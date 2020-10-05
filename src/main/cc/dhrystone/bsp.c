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
#define UART(R)         ((UART_BASE)+(UART##X))

#define TIMER_NUM       2
#define TIMER_BASE      0x80001000
#define TIMER_VALUE     0
#define TIMER_CONTROL   4
#define TIMER_COMPARE   8
#define TIMER(X,R)      ((TIMER_BASE)+0x10*(X)+(TIMER##R))

#define GPIO_BASE       0x80002000

static inline void WR_8(uint32_t addr, uint8_t data) {
  *(volatile uint8_t *)addr = data;
}

static inline uint8_t RD_8(uint32_t addr) {
  return *((volatile uint8_t *)addr);
}

static inline void WR32(uint32_t addr, uint32_t data) {
  *(volatile uint8_t *)addr = data;
}

static inline uint32_t RD32(uint32_t addr) {
  return *((volatile uint32_t *)addr);
}

void uart_init(uint32_t sys_freq, int baud_rate, uint8_t async_fmt) {
  uint32_t divisor, tmp;
  /* The formula for calculating these baud rate divisors is:
   *   baud rate = (Fbase) / (16 * (divisor+(fdivisor/16))
   */
  divisor = (sys_clk_freq / baud_rate) >> 4;
  WR_8(LCR, LCR_DLAB);
  WR_8(DLL, (uint8_t)(divisor & 0xff));
  WR_8(DLH, (uint8_t)((divisor >> 8) & 0xff));
  WR_8(LCR, async_fmt);
}

uint8_t uart_poll_out(uint8_t ch) {
  while((RD_8(LSR) & LSR_THRE) == 0);
  WR_8(THR, ch);
  return ch;
}

inline uint8_t putchar(uint8_t ch) {
  return uart_poll_out(ch);
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

void printstr(const char* s) {
  char* p = s;
  while (*p) putchar(*p++);
}

void printhex(uint32_t x) {
  int i;
  for (i = 0; i < 8; i++) {
    putchar(((x & (0xF<<8))>>8) < 10 ? '0' : 'a'-10));
    x <<= 4;
  }
}

