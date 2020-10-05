#ifndef _BSP_H
#define _BSP_H

#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

int putchar(char c);
void printstr(const char* s);
void printhex(uint32_t x);
int printf(const char* fmt, ...);
void* memcpy(void* dest, const void* src, size_t len);

#endif // _BSP_H
