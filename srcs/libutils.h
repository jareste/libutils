#ifndef FT_LIBUTILS_H
# define FT_LIBUTILS_H

typedef unsigned long size_t;

typedef enum { false, true } bool;

#undef memcpy
void *memcpy (void *dest, const void *src, size_t len);

#undef memset
void *memset (void *ptr, int value, size_t num);

#undef strlen
size_t strlen (const char *str);

#undef strcmp
int strcmp (const char *p1, const char *p2);

#undef tolower
int tolower(int c);

#undef strcasecmp
int strcasecmp(const char *p1, const char *p2);

#endif