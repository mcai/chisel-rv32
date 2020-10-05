#include "board.h"

#define UART_BASE       0x80000000
#define UART_THR        0
#define UART_RDR        0
#define UART_DLL        0
#define UART_DLH        1
#define UART_IER        1
#define UART_IIR        2
#define UART_FCR        2
#define UART_LCR        3
#define UART_MDC        4
#define UART_LSR        5
#define UART_MSR        6
#define UART_SCR        7
#define LCR_DLAB        0x80
#define UART_REG(R)     ((UART_BASE)+(UART##X))

#define TIMER_NUM       2
#define TIMER_BASE      0x80001000
#define TIMER_VALUE     0
#define TIMER_CONTROL   4
#define TIMER_COMPARE   8
#define TIMER_REG(X,R)  ((TIMER_BASE)+0x10*(X)+(TIMER##R))

#define GPIO_BASE       0x80002000

inline void WR_8(uint32_t addr, uint8_t data) {
  *(volatile uint8_t *)addr = data;
}

inline uint8_t RD_8(uint32_t addr) {
  return *((volatile uint8_t *)addr);
}

inline void WR32(uint32_t addr, uint32_t data) {
  *(volatile uint8_t *)addr = data;
}

inline uint32_t RD32(uint32_t addr) {
  return *((volatile uint32_t *)addr);
}

inline void timer_set(int t, uint32_t value) {
  WR32(TIMER(t,VALUE), value);
}

inline uint32_t timer_get(int t) {
  return (uint32_t)RD32(TIMER(t,VALUE))
}

inline void timer_start(int t) {
  WR32(TIMER(t,CONTROL), 1)
}

inline void timer_stop(int t) {
  WR32(TIMER(t,CONTROL), 0)
}

inline void stop_simulation() {
  WR_8(UART_REG(SCR), 0xFF);
}

void uart_init(uint32_t sys_freq, int baud_rate, uint8_t async_fmt) {
  uint32_t divisor, tmp;
  /* The formula for calculating these baud rate divisors is:
   *   baud rate = (Fbase) / (16 * (divisor+(fdivisor/16))
   */
  divisor = (sys_clk_freq / baud_rate) >> 4;
  WR_8(UART_REG(LCR), LCR_DLAB);
  WR_8(UART_REG(DLL), (uint8_t)(divisor & 0xff));
  WR_8(UART_REG(DLH), (uint8_t)((divisor >> 8) & 0xff));
  WR_8(UART_REG(LCR), async_fmt);
}

uint8_t uart_poll_out(uint8_t ch) {
  while((RD_8(LSR) & LSR_THRE) == 0);
  WR_8(THR, ch);
  return ch;
}

inline uint8_t putchar(uint8_t ch) {
  return uart_poll_out(ch);
}

void printstr(const char* s) {
  char* p = s;
  while (*p) putchar(*p++);
}

void printhex(uint32_t x) {
  int i;
  for (i = 0; i < 8; i++) {
    putchar(((x & (0xFu<<8))>>8) < 10u ? '0' : 'a'-10);
    x <<= 4;
  }
}

static inline void printnum (
    void (*putch)(int, void**),
    void **putdat,
    unsigned long long num,
    unsigned base,
    int width,
    int padc
) {
  unsigned digs[sizeof(num)*CHAR_BIT];
  int pos = 0;

  while (1) {
    digs[pos++] = num % base;
    if (num < base) break;
    num /= base;
  }

  while (width-- > pos) putch(padc, putdat);

  while (pos-- > 0) putch(digs[pos] + (digs[pos] >= 10 ? 'a' - 10 : '0'), putdat);
}

static unsigned long long getuint(va_list *ap, int lflag) {
  if (lflag >= 2)
    return va_arg(*ap, unsigned long long);
  else if (lflag)
    return va_arg(*ap, unsigned long);
  else
    return va_arg(*ap, unsigned int);
}

static long long getint(va_list *ap, int lflag) {
  if (lflag >= 2)
    return va_arg(*ap, long long);
  else if (lflag)
    return va_arg(*ap, long);
  else
    return va_arg(*ap, int);
}

static void vprintfmt(
    void (*putch)(int, void**),
    void **putdat,
    const char *fmt,
    va_list ap
) {
  register const char* p;
  const char* last_fmt;
  register int ch, err;
  unsigned long long num;
  int base, lflag, width, precision, altflag;
  char padc;

  while (1) {
    while ((ch = *(unsigned char *) fmt) != '%') {
      if (ch == '\0') return;
      fmt++;
      putch(ch, putdat);
    }
    fmt++;

    // Process a %-escape sequence
    last_fmt = fmt;
    padc = ' ';
    width = -1;
    precision = -1;
    lflag = 0;
    altflag = 0;
  reswitch:
    switch (ch = *(unsigned char *) fmt++) {

    // flag to pad on the right
    case '-':
      padc = '-';
      goto reswitch;

    // flag to pad with 0's instead of spaces
    case '0':
      padc = '0';
      goto reswitch;

    // width field
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      for (precision = 0; ; ++fmt) {
        precision = precision * 10 + ch - '0';
        ch = *fmt;
        if (ch < '0' || ch > '9')
          break;
      }
      goto process_precision;

    case '*':
      precision = va_arg(ap, int);
      goto process_precision;

    case '.':
      if (width < 0)
        width = 0;
      goto reswitch;

    case '#':
      altflag = 1;
      goto reswitch;

    process_precision:
      if (width < 0)
        width = precision, precision = -1;
      goto reswitch;

    // long flag (doubled for long long)
    case 'l':
      lflag++;
      goto reswitch;

    // character
    case 'c':
      putch(va_arg(ap, int), putdat);
      break;

    // string
    case 's':
      if ((p = va_arg(ap, char *)) == NULL)
        p = "(null)";
      if (width > 0 && padc != '-')
        for (width -= strnlen(p, precision); width > 0; width--)
          putch(padc, putdat);
      for (; (ch = *p) != '\0' && (precision < 0 || --precision >= 0); width--) {
        putch(ch, putdat);
        p++;
      }
      for (; width > 0; width--)
        putch(' ', putdat);
      break;

    // (signed) decimal
    case 'd':
      num = getint(&ap, lflag);
      if ((long long) num < 0) {
        putch('-', putdat);
        num = -(long long) num;
      }
      base = 10;
      goto signed_number;

    // unsigned decimal
    case 'u':
      base = 10;
      goto unsigned_number;

    // (unsigned) octal
    case 'o':
      // should do something with padding so it's always 3 octits
      base = 8;
      goto unsigned_number;

    // pointer
    case 'p':
      static_assert(sizeof(long) == sizeof(void*));
      lflag = 1;
      putch('0', putdat);
      putch('x', putdat);
      /* fall through to 'x' */

    // (unsigned) hexadecimal
    case 'x':
      base = 16;
    unsigned_number:
      num = getuint(&ap, lflag);
    signed_number:
      printnum(putch, putdat, num, base, width, padc);
      break;

    // escaped '%' character
    case '%':
      putch(ch, putdat);
      break;

    // unrecognized escape sequence - just print it literally
    default:
      putch('%', putdat);
      fmt = last_fmt;
      break;
    }
  }
}

int printf(const char* fmt, ...) {
  va_list ap;
  va_start(ap, fmt);

  vprintfmt((void*)putchar, 0, fmt, ap);

  va_end(ap);
  return 0; // incorrect return value, but who cares, anyway?
}

int sprintf(char* str, const char* fmt, ...) {
  va_list ap;
  char* str0 = str;
  va_start(ap, fmt);

  void sprintf_putch(int ch, void** data) {
    char** pstr = (char**)data;
    **pstr = ch;
    (*pstr)++;
  }

  vprintfmt(sprintf_putch, (void**)&str, fmt, ap);
  *str = 0;

  va_end(ap);
  return str - str0;
}

void* memcpy(void* dest, const void* src, size_t len) {
  if ((((uintptr_t)dest | (uintptr_t)src | len) & (sizeof(uintptr_t)-1)) == 0) {
    const uintptr_t* s = src;
    uintptr_t *d = dest;
    while (d < (uintptr_t*)(dest + len)) *d++ = *s++;
  } else {
    const char* s = src;
    char *d = dest;
    while (d < (char*)(dest + len)) *d++ = *s++;
  }
  return dest;
}

void* memset(void* dest, int byte, size_t len) {
  if ((((uintptr_t)dest | len) & (sizeof(uintptr_t)-1)) == 0) {
    uintptr_t word = byte & 0xFF;
    word |= word << 8;
    word |= word << 16;
    word |= word << 16 << 16;

    uintptr_t *d = dest;
    while (d < (uintptr_t*)(dest + len)) *d++ = word;
  } else {
    char *d = dest;
    while (d < (char*)(dest + len)) *d++ = byte;
  }
  return dest;
}

size_t strlen(const char *s) {
  const char *p = s;
  while (*p) p++;
  return p - s;
}

size_t strnlen(const char *s, size_t n) {
  const char *p = s;
  while (n-- && *p) p++;
  return p - s;
}

int strcmp(const char* s1, const char* s2) {
  unsigned char c1, c2;

  do {
    c1 = *s1++;
    c2 = *s2++;
  } while (c1 != 0 && c2 != 0 && c1 == c2);

  return c1 - c2;
}

char* strcpy(char* dest, const char* src) {
  char* d = dest;
  while ((*d++ = *src++));
  return dest;
}

long atol(const char* str) {
  long res = 0;
  int sign = 0;

  while (*str == ' ')
    str++;

  if (*str == '-' || *str == '+') {
    sign = *str == '-';
    str++;
  }

  while (*str) {
    res *= 10;
    res += *str++ - '0';
  }

  return sign ? -res : res;
}
