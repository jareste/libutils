#include <libutils.h>
void *memset(void *ptr, int value, size_t num)
{
    char *p = ptr;
    while (num--)
        *p++ = value;
    return ptr;
}