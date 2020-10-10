#ifndef _BSP_H
#define _BSP_H

#include <stdarg.h>
#include <stdint.h>
#include <limits.h>

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
#define LSR_THRE        0x20
#define UART_REG(R)     ((UART_BASE)+(UART_##R))

#define TIMER_NUM       2
#define TIMER_BASE      0x80001000
#define TIMER_VALUE     0
#define TIMER_CONTROL   4
#define TIMER_COMPARE   8
#define TIMER_REG(X,R)  ((TIMER_BASE)+0x10*(X)+(TIMER_##R))

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

static inline void timer_set(int t, uint32_t value) {
  WR32(TIMER_REG(t,VALUE), value);
}

static inline uint32_t timer_get(int t) {
  return (uint32_t)RD32(TIMER_REG(t,VALUE));
}

static inline uint32_t timer_start(int t) {
  WR32(TIMER_REG(t,CONTROL), 1);
  return RD32(TIMER_REG(t,VALUE));
}

static inline uint32_t timer_stop(int t) {
  WR32(TIMER_REG(t,CONTROL), 0);
  return RD32(TIMER_REG(t,VALUE));
}

static inline void stop_simulation() {
  WR_8(UART_REG(SCR), 0xFF);
}

void uart_init(uint32_t sys_freq, int baud_rate, uint8_t async_fmt);
int putchar(int c);
void printstr(const char* s);
int puts(const char* s);
void printhex(uint32_t x);
int printf(const char* fmt, ...);
int sprintf(char* str, const char* fmt, ...);
void* memcpy(void* dest, const void* src, size_t len);
void* memset(void* dest, int byte, size_t len);

size_t strlen(const char *s);
size_t strnlen(const char *s, size_t n);
int strcmp(const char* s1, const char* s2);
char* strcpy(char* dest, const char* src);
long atol(const char* str);

void setStats(int);

#endif // _BSP_H
