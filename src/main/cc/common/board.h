#ifndef _BSP_H
#define _BSP_H

#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

inline void stop_simulation();

inline void timer_set(int t, uint32_t value);
inline uint32_t timer_get(int t);
inline void timer_start(int t);
inline void timer_stop(int t);

void uart_init(uint32_t sys_freq, int baud_rate, uint8_t async_fmt);
uint8_t uart_poll_out(uint8_t ch);

int putchar(char c);
void printstr(const char* s);
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

#endif // _BSP_H
