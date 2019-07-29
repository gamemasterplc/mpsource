This binary is a compilation of the https://ftp.gnu.org/old-gnu/gcc/gcc-2.7.2.1.tar.gz source with the following changes:

```
# define obstack_ptr_grow(OBSTACK,datum)                \
__extension__                                \
({ struct obstack *__o = (OBSTACK);                    \
   if (__o->next_free + sizeof (void *) > __o->chunk_limit)        \
     _obstack_newchunk (__o, sizeof (void *));                \
   *((void **)__o->next_free) = ((void *)datum);            \
   __o->next_free += sizeof (void *);                     \
   (void) 0; })
```

...to replace the macro, and:

```
#ifdef __GNUC__
__inline
#endif
static struct resword *
is_reserved_word (str, len)
     register char *str;
     register unsigned int len;
```
...to fix the static definition.

Both the macro and definition in obstack.h and c-gperf.h will need to be updated respectively. WSL will produce the included binary.

# Binutils

The provided assembler was compiled from https://ftp.gnu.org/gnu/binutils/binutils-2.18.tar.bz2.
