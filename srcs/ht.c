#include <ht.h>
#include <malloc.h>

// Hash table structure: create with ht_create, free with ht_destroy.

#define INITIAL_CAPACITY 16  // must not be zero

ht* ht_create(void)
{
    ht* table = malloc(sizeof(ht));

    table->length = 0;
    table->capacity = INITIAL_CAPACITY;

    // Allocate (zero'd) space for entry buckets.
    table->entries = malloc(table->capacity * sizeof(ht_entry));
    memset(table->entries, 0, table->capacity * sizeof(ht_entry));

    return table;
}

void ht_destroy(ht* table)
{
    // First free allocated keys.
    for (size_t i = 0; i < table->capacity; i++)
    {
        free((void*)table->entries[i].key);
    }

    // Then free entries array and table itself.
    free(table->entries);
    free(table);
}