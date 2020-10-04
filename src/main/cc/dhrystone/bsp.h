#ifndef _BSP_H
#define _BSP_H

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

#define TIMER_BASE      0x80001000
#define TIMER_VALUE     0
#define TIMER_CTRL      4
#define TIMER_CMP       8

#define GPIO_BASE       0x80002000

#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

int putchar(char c);
void printstr(const char* s);
void printhex(uint32_t x);
int printf(const char* fmt, ...);
void* memcpy(void* dest, const void* src, size_t len);

#endif // _BSP_H
