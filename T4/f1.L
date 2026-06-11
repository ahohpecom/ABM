Page 1    2026 June 11, 11:03:05     


TNS/X C - T0878L02 - 01FEB2025 (Nov  8 2024 01:18:43)
Copyright (C) 2024 Hewlett Packard Enterprise Development LP
 
Options:
 
    systype=oss, env=common, nooverflow_traps, noinnerlist
    list, lines=66, nomap, nosymbols
 
Source file:  [0] C:\ABM\T4\f1.c  2026-06-11 11:03:01
       1.   0  0    /* Reading a Guardian File With an OSS Function Call */
       2.   0  0    #include <stdio.h>
Source file:  [1] C:\NonStop\L25.02\usr\include\stdio.h  2025-03-07 13:25:11
       1.   0  0    #ifdef __TANDEM
       2.   0  0    #pragma columns 80
       3.   0  0    #if _TANDEM_ARCH_ != 0
       4.   0  0    #pragma ONCE
       5.   0  0    #endif
       6.   0  0    #endif
       7.   0  0    #ifndef _STDIO
       8.   0  0    #define _STDIO
       9.   0  0    #if _TANDEM_ARCH_ > 2
      10.   0  0    #pragma hpe_nonstop_standard_header
      11.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
      12.   0  0    
      13.   0  0    /* T8645L02 - (01FEB2025) - stdio.h   standard input/output definitions */
      14.   0  0    
      15.   0  0    /*
      16.   0  0     *  Copyright 2014, 2016, 2017, 2020-2024 
      17.   0  0     *  Hewlett Packard Enterprise Development LP
      18.   0  0     *
      19.   0  0     *     ALL RIGHTS RESERVED
      20.   0  0     */
      21.   0  0    
      22.   0  0    #if (_TANDEM_ARCH_ == 1 && __G_Series_RVU < 629 || \
      23.   0  0         _TANDEM_ARCH_ == 2 && __H_Series_RVU < 606) && \
      24. # 0  0            (_FILE_OFFSET_BITS == 64 || _LARGEFILE64_SOURCE == 1)
      25. # 0  0       #error 64-bit functions not available for target RVU
      26.   0  0    #endif /* 64-bit functions requested when not available */
      27.   0  0    
      28.   0  0    #ifndef __DIRFD_SUPPORTED__
      29.   0  0    #define __DIRFD_SUPPORTED__ \
      30.   0  0       ( ( (_TANDEM_ARCH_ == 2 && defined(__J_Series_RVU) &&  \
      31.   0  0              __J_Series_RVU >= 622) || \
      32.   0  0           (_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
      33.   0  0              __L_Series_RVU >= 1802) || \
      34.   0  0           (_TANDEM_ARCH_ > 3 ) ) && _XOPEN_SOURCE_EXTENDED == 1 )
      35.   0  0    #endif /* __DIRFD_SUPPORTED__ */
      36.   0  0    
      37. # 0  0    #ifdef __cplusplus
      38. # 0  0       extern "C" {
      39.   0  0    #endif
      40.   0  0    
      41.   0  0    #ifndef __NOEXCEPT
      42. # 0  0    #if (__CPLUSPLUS_VERSION >= 4)
      43. # 0  0    #define __NOEXCEPT noexcept
      44. # 0  0    #elif (__CPLUSPLUS_VERSION == 3)
      45. # 0  0    #define __NOEXCEPT throw ()
      46.   0  0    #else
      47.   0  0    #define __NOEXCEPT
      48.   0  0    #endif /* (__CPLUSPLUS_VERSION >= 4) */
      49.   0  0    #endif /* __NOEXCEPT */
      50.   0  0    
      51.   0  0    #ifndef NULL
Page 2    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


      52. # 0  0    #if defined(_GUARDIAN_TARGET) && defined(__XMEM)
      53. # 0  0    #define NULL   0L
      54.   0  0    #else
      55.   0  0    #define NULL   0
      56.   0  0    #endif
      57.   0  0    #endif /* NULL */
      58.   0  0    
      59.   0  0    #ifndef __size_t_DEFINED
      60.   0  0    #define __size_t_DEFINED
      61.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
      62. # 0  0    #ifdef __LP64
      63. # 0  0    typedef unsigned long  size_t;
      64.   0  0    #else  /* !__LP64 */
      65.   0  0    typedef unsigned int   size_t;
      66.   0  0    #endif /* !__LP64 */
      67. # 0  0    #else /* _TANDEM_ARCH_ == 0 */
      68. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
      69. # 0  0    typedef unsigned long  size_t;
      70. # 0  0    #else
      71. # 0  0    typedef unsigned short size_t;
      72. # 0  0    #endif
      73.   0  0    #endif /* _TANDEM_ARCH_ == 0 */
      74.   0  0    #endif /* __size_t_DEFINED */
      75.   0  0    
      76.   0  0    #ifndef __va_list_DEFINED
      77.   0  0    #define __va_list_DEFINED
      78.   0  0    #if _TANDEM_ARCH_ == 3
      79.   0  0    typedef __va_list__ va_list;
      80. # 0  0    #elif _TANDEM_ARCH_ == 2 || _TANDEM_ARCH_ == 1
      81. # 0  0    typedef char *va_list;
      82. # 0  0    #else  /* _TANDEM_ARCH_ == 0 */
      83. # 0  0    typedef int  *va_list;
      84.   0  0    #endif /* _TANDEM_ARCH_ == 0 */
      85.   0  0    #endif /* __va_list_DEFINED */
      86.   0  0    
      87.   0  0    #ifdef __TANDEM
      88.   0  0    typedef long long fpos_t;
      89. # 0  0    #else
      90. # 0  0    typedef unsigned  fpos_t;
      91.   0  0    #endif
      92.   0  0    
      93. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
      94. # 0  0    typedef long long fpos64_t;
      95.   0  0    #endif
      96.   0  0    
      97.   0  0    #ifndef __off_t_DEFINED
      98.   0  0    #define __off_t_DEFINED
      99. # 0  0    #if _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0
     100. # 0  0    typedef long long       off_t;          /* file offset (signed integer) */
     101.   0  0    #else  /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ != 0 */
     102.   0  0    typedef long            off_t;          /* file offset (signed integer) */
     103.   0  0    #endif /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ != 0 */
     104.   0  0    
     105. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     106. # 0  0    typedef long long       off64_t;        /* file offset (signed integer) */
     107.   0  0    #endif
     108.   0  0    #endif /* __off_t_DEFINED */
     109.   0  0    
     110.   0  0    #ifdef __TANDEM
     111. # 0  0    #ifdef __LP64
     112. # 0  0    #pragma fieldalign platform FILE
     113.   0  0    #else  /* !__LP64 */
     114.   0  0    #pragma fieldalign shared8 FILE
Page 3    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     115.   0  0    #endif /* !__LP64 */
     116.   0  0    #endif
     117.   0  0    
     118.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(_GUARDIAN_TARGET)
     119.   0  0    
     120.   0  0    typedef struct FILE {
     121.   0  0    int            _signature;
     122.   0  0    int            _cnt;
     123.   0  0    unsigned char *_ptr;
     124.   0  0    unsigned char *_base;
     125.   0  0    int            _bufsiz;
     126.   0  0    short          _flag;
     127.   0  0    short          _file;
     128.   0  0    void          *_unused;
     129.   0  0    void          *_lock;
     130.   0  0    char          *__newbase;
     131.   0  0    unsigned char *_bufendp;
     132.   0  0    int           *_OFTE_ptr;
     133.   0  0    } FILE;
     134.   0  0    
     135. # 0  0    #else /* _TANDEM_ARCH_ == 0 && _GUARDIAN_TARGET */
     136. # 0  0    
     137. # 0  0    typedef struct FILE {
     138. # 0  0    long           _signature;
     139. # 0  0    short          contents[12];
     140. # 0  0    } FILE;
     141. # 0  0    
     142.   0  0    #endif /* _TANDEM_ARCH_ == 0 && _GUARDIAN_TARGET */
     143.   0  0    
     144.   0  0    FILE *__stdio_fp (short) __NOEXCEPT;
     145.   0  0    
     146.   0  0    #define stdin   __stdio_fp(0)
     147.   0  0    #define stdout  __stdio_fp(1)
     148.   0  0    #define stderr  __stdio_fp(2)
     149.   0  0    
     150.   0  0    #if _TANDEM_ARCH_ != 0
     151.   0  0    #define BUFSIZ    4096
     152. # 0  0    #else
     153. # 0  0    #define BUFSIZ    1024
     154.   0  0    #endif
     155.   0  0    #define EOF       (-1)
     156.   0  0    
     157. # 0  0    #if defined(_TANDEM_SOURCE) && defined(_GUARDIAN_TARGET)
     158. # 0  0    #define OPEN_MAX  25            /* Max number of open files */
     159. # 0  0    #define NAME_MAX  35            /* Max length of a Guardian file name */
     160. # 0  0    #define FCHR_MAX  2147483647L   /* Max number of bytes in a file */
     161.   0  0    #endif /* _TANDEM_SOURCE && _GUARDIAN_TARGET */
     162.   0  0    
     163.   0  0    #ifndef SEEK_SET
     164.   0  0    #define SEEK_SET  0
     165.   0  0    #endif
     166.   0  0    
     167.   0  0    #ifndef SEEK_CUR
     168.   0  0    #define SEEK_CUR  1
     169.   0  0    #endif
     170.   0  0    
     171.   0  0    #ifndef SEEK_END
     172.   0  0    #define SEEK_END  2
     173.   0  0    #endif
     174.   0  0    
     175.   0  0    #define _IOFBF 0                  /*                     */
     176.   0  0    #define _IOLBF 1                  /* setvbuf() constants */
     177.   0  0    #define _IONBF 2                  /*                     */
Page 4    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     178.   0  0    
     179.   0  0    #define FOPEN_MAX    25
     180.   0  0    
     181. # 0  0    #ifdef _GUARDIAN_TARGET
     182. # 0  0    #define FILENAME_MAX  35          /* Maximum length of a Guardian file name */
     183. # 0  0    #define L_tmpnam     9
     184. # 0  0    #ifndef TMP_MAX         /* Acquired from limits.h */
     185. # 0  0    #define TMP_MAX      100
     186. # 0  0    #endif
     187.   0  0    #else /* open target */
     188.   0  0    #define FILENAME_MAX  248         /* Maximum length of an OSS file name */
     189.   0  0    #ifdef _XOPEN_SOURCE
     190.   0  0    #define P_tmpdir "/tmp/"
     191.   0  0    #define L_tmpnam  (sizeof(P_tmpdir) + 15)
     192. # 0  0    #else
     193. # 0  0    #define _P_tmpdir "/tmp/"
     194. # 0  0    #define L_tmpnam  (sizeof(_P_tmpdir) + 15)
     195.   0  0    #endif
     196.   0  0    #ifndef TMP_MAX         /* Acquired from limits.h */
     197.   0  0    #define TMP_MAX      27576
     198.   0  0    #endif
     199.   0  0    #endif /* _GUARDIAN_TARGET */
     200.   0  0    
     201.   0  0    int getchar (void) __NOEXCEPT;
     202.   0  0    int putchar (int) __NOEXCEPT;
     203.   0  0    #define getchar()   getc(stdin)
     204.   0  0    #define putchar(c)  putc((c), stdout)
     205.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)
     206.   0  0    int getchar_unlocked(void) __NOEXCEPT;
     207.   0  0    int putchar_unlocked(int) __NOEXCEPT;
     208.   0  0    #define getchar_unlocked() getc_unlocked(stdin)
     209.   0  0    #define putchar_unlocked(c) putc_unlocked((c), stdout)
     210.   0  0    #endif /* _TANDEM_ARCH_ >= 2 */
     211.   0  0    
     212. # 0  0    #ifdef _TANDEM_SOURCE
     213. # 0  0    #ifdef _GUARDIAN_TARGET
     214. # 0  0    #if _TANDEM_ARCH_ != 0 || defined(__XMEM)
     215. # 0  0    int    edfseek(FILE *, long, int) __NOEXCEPT;
     216. # 0  0    long   edftell(FILE *) __NOEXCEPT;
     217. # 0  0    short  fopen_std_file(short, short, char *) __NOEXCEPT;
     218. # 0  0    #if _TANDEM_ARCH_ != 0
     219. # 0  0    #if _LARGEFILE64_SOURCE == 1
     220. # 0  0    short  fopen64_std_file(short, short, char *) __NOEXCEPT;
     221. # 0  0    #endif
     222. # 0  0    #ifdef __LP64
     223. # 0  0       #if _LARGEFILE64_SOURCE == 1
     224. # 0  0       #pragma function fopen64_std_file (alias("fopen_std_file"), extensible, tal)
     225. # 0  0       #endif
     226. # 0  0       #pragma function fopen_std_file  (extensible, tal)
     227. # 0  0    #else  /* !__LP64 */
     228. # 0  0       #if _LARGEFILE64_SOURCE == 1
     229. # 0  0       #pragma function fopen64_std_file (extensible, tal)
     230. # 0  0       #endif
     231. # 0  0       #if _FILE_OFFSET_BITS == 64
     232. # 0  0       #pragma function fopen_std_file  (alias("fopen64_std_file"), extensible, tal)
     233. # 0  0       #else  /* _FILE_OFFSET_BITS != 64 */
     234. # 0  0       #pragma function fopen_std_file  (extensible, tal)
     235. # 0  0       #endif /* _FILE_OFFSET_BITS != 64 */
     236. # 0  0    #endif /* !__LP64 */
     237. # 0  0    #else  /* _TANDEM_ARCH_ == 0 */
     238. # 0  0    #pragma function fopen_std_file  (alias("C_OPEN_STD_FILE_"), extensible, tal)
     239. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     240. # 0  0    #else /* small model TNS C */
Page 5    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     241. # 0  0    int    edfseek(FILE _far *, long, int) __NOEXCEPT;
     242. # 0  0    long   edftell(FILE _far *) __NOEXCEPT;
     243. # 0  0    short  fopen_std_file(short, short, char _far *) __NOEXCEPT;
     244. # 0  0    #pragma function fopen_std_file  (alias("C_OPEN_STD_FILE_"), extensible, tal)
     245. # 0  0    #endif /* small model TNS C */
     246. # 0  0    #endif /* _GUARDIAN_TARGET */
     247. # 0  0    
     248. # 0  0    #if _TANDEM_ARCH_ == 0            /* TNS C (all models) */
     249. # 0  0    void   fcloseall(void) __NOEXCEPT;
     250. # 0  0    #define setnbuf(fp) setbuf(fp, 0L)
     251. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     252.   0  0    #endif /* _TANDEM_SOURCE */
     253.   0  0    
     254.   0  0    int    printf(const char *, ...) __NOEXCEPT;
     255.   0  0    int    fprintf(FILE *, const char *, ...) __NOEXCEPT;
     256.   0  0    int    sprintf(char *, const char *, ...) __NOEXCEPT;
     257.   0  0    int    vprintf(const char *, va_list) __NOEXCEPT;
     258.   0  0    int    vfprintf(FILE *, const char *, va_list) __NOEXCEPT;
     259.   0  0    int    vsprintf(char *, const char *, va_list) __NOEXCEPT;
     260.   0  0    int    scanf(const char *, ...) __NOEXCEPT;
     261.   0  0    int    fscanf(FILE *, const char *, ...) __NOEXCEPT;
     262.   0  0    int    sscanf(const char *, const char *, ...) __NOEXCEPT;
     263.   0  0    void   perror(const char *) __NOEXCEPT;
     264.   0  0    #if _TANDEM_ARCH_ != 0
     265.   0  0    int    snprintf(char *, size_t, const char *, ...) __NOEXCEPT;
     266.   0  0    int    vsnprintf(char *, size_t, const char *, va_list) __NOEXCEPT;
     267.   0  0    #endif /* _TANDEM_ARCH_ != 0 */
     268.   0  0    #if _TANDEM_ARCH_ > 2 || _TANDEM_ARCH_ == 2 && __H_Series_RVU >= 608 || \
     269.   0  0        _TANDEM_ARCH_ == 1 && __G_Series_RVU >= 630
     270.   0  0    int    vfscanf(FILE *, const char *, va_list) __NOEXCEPT;
     271.   0  0    int    vscanf (const char *, va_list) __NOEXCEPT;
     272.   0  0    int    vsscanf(const char *, const char *, va_list) __NOEXCEPT;
     273.   0  0    #endif /* unrestricted || __H_Series_RVU >= 608 || __G_Series_RVU >= 630 */
     274.   0  0    
     275.   0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     276.   0  0    /*
     277.   0  0     * OSS and Guardian (wide-model and large-model)
     278.   0  0     */
     279.   0  0    void   clearerr(FILE *) __NOEXCEPT;
     280.   0  0    int    fclose(FILE *) __NOEXCEPT;
     281.   0  0    int    feof(FILE *) __NOEXCEPT;
     282.   0  0    int    ferror(FILE *) __NOEXCEPT;
     283.   0  0    int    fflush(FILE *) __NOEXCEPT;
     284.   0  0    int    fgetc(FILE *) __NOEXCEPT;
     285.   0  0    int    fgetpos(FILE *, fpos_t *) __NOEXCEPT;
     286.   0  0    char  *fgets(char *, int, FILE *) __NOEXCEPT;
     287.   0  0    FILE  *fopen(const char *, const char *) __NOEXCEPT;
     288.   0  0    int    fputc(int, FILE *) __NOEXCEPT;
     289.   0  0    int    fputs(const char *, FILE *) __NOEXCEPT;
     290.   0  0    size_t fread(void *, size_t, size_t, FILE *) __NOEXCEPT;
     291.   0  0    FILE  *freopen(const char *, const char *, FILE *) __NOEXCEPT;
     292.   0  0    int    fseek(FILE *, long, int) __NOEXCEPT;
     293.   0  0    int    fsetpos(FILE *, const fpos_t *) __NOEXCEPT;
     294.   0  0    long   ftell(FILE *) __NOEXCEPT;
     295.   0  0    size_t fwrite(const void *, size_t, size_t, FILE *) __NOEXCEPT;
     296.   0  0    int    getc(FILE *) __NOEXCEPT;
     297. # 0  0    #if __STDC_VERSION__ >= 201112 || __cplusplus > 201103L
     298.   0  0    #else
     299.   0  0    char  *gets(char *) __NOEXCEPT;
     300.   0  0    #endif
     301.   0  0    int    putc(int, FILE *) __NOEXCEPT;
     302.   0  0    int    puts(const char *) __NOEXCEPT;
     303.   0  0    void   setbuf(FILE *, char *) __NOEXCEPT;
Page 6    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     304.   0  0    int    setvbuf(FILE *, char *, int, size_t) __NOEXCEPT;
     305.   0  0    int    remove(const char *) __NOEXCEPT;
     306.   0  0    int    rename(const char *, const char *) __NOEXCEPT;
     307. # 0  0    #if __DIRFD_SUPPORTED__
     308. # 0  0    int    renameat(int, const char *, int, const char *) __NOEXCEPT;
     309.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     310.   0  0    void   rewind(FILE *) __NOEXCEPT;
     311.   0  0    FILE  *tmpfile(void) __NOEXCEPT;
     312.   0  0    char  *tmpnam(char *) __NOEXCEPT;
     313.   0  0    #if (_TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)) \
     314.   0  0        && !defined(_SPT_MODEL_)
     315.   0  0    char  *tmpnam_r(char *) __NOEXCEPT;
     316.   0  0    #endif /* _TANDEM_ARCH_ >= 2 && !_SPT_MODEL_ */
     317.   0  0    int    ungetc(int, FILE *) __NOEXCEPT;
     318.   0  0    
     319.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)
     320.   0  0    void   flockfile(FILE *) __NOEXCEPT;
     321.   0  0    int    ftrylockfile(FILE *) __NOEXCEPT;
     322.   0  0    void   funlockfile(FILE *) __NOEXCEPT;
     323.   0  0    int    getc_unlocked(FILE *) __NOEXCEPT;
     324.   0  0    int    putc_unlocked(int, FILE *) __NOEXCEPT;
     325.   0  0    #endif /* _TANDEM_ARCH_ >= 2 */
     326.   0  0    
     327.   0  0    #if _TANDEM_ARCH_ != 0
     328.   0  0    #if _LARGEFILE64_SOURCE == 1 || _FILE_OFFSET_BITS == 64 || \
     329. # 0  0        defined(_TANDEM_SOURCE)
     330. # 0  0    int     fseeko(FILE *, off_t, int) __NOEXCEPT;
     331. # 0  0    off_t   ftello(FILE *) __NOEXCEPT;
     332. # 0  0    #if _LARGEFILE64_SOURCE == 1
     333. # 0  0    int     fgetpos64(FILE *, fpos64_t *) __NOEXCEPT;
     334. # 0  0    FILE   *fopen64  (const char *, const char *) __NOEXCEPT;
     335. # 0  0    FILE   *freopen64(const char *, const char *, FILE *) __NOEXCEPT;
     336. # 0  0    int     fseeko64 (FILE *, off64_t, int) __NOEXCEPT;
     337. # 0  0    int     fsetpos64(FILE *, const fpos64_t *) __NOEXCEPT;
     338. # 0  0    off64_t ftello64 (FILE *) __NOEXCEPT;
     339. # 0  0    FILE   *tmpfile64(void) __NOEXCEPT;
     340. # 0  0    #endif /* _LARGEFILE64_SOURCE == 1 */
     341. # 0  0    
     342. # 0  0    #ifdef __LP64
     343. # 0  0       #if _LARGEFILE64_SOURCE == 1
     344. # 0  0       #pragma function fgetpos64  (alias("fgetpos"), unspecified)
     345. # 0  0       #pragma function fopen64    (alias("fopen")  , unspecified)
     346. # 0  0       #pragma function freopen64  (alias("freopen"), unspecified)
     347. # 0  0       #pragma function fsetpos64  (alias("fsetpos"), unspecified)
     348. # 0  0       #pragma function tmpfile64  (alias("tmpfile"), unspecified)
     349. # 0  0       #pragma function fseeko     (alias("fseeko64") , unspecified)
     350. # 0  0       #pragma function ftello     (alias("ftello64") , unspecified)
     351. # 0  0       #endif /* _LARGEFILE64_SOURCE == 1 */
     352. # 0  0    #else /* !__LP64 */
     353. # 0  0    #if _FILE_OFFSET_BITS == 64
     354. # 0  0       #pragma function fgetpos  (alias("fgetpos64"), unspecified)
     355. # 0  0       #pragma function fopen    (alias("fopen64")  , unspecified)
     356. # 0  0       #pragma function freopen  (alias("freopen64"), unspecified)
     357. # 0  0       #pragma function fsetpos  (alias("fsetpos64"), unspecified)
     358. # 0  0       #pragma function tmpfile  (alias("tmpfile64"), unspecified)
     359. # 0  0       #pragma function fseeko   (alias("fseeko64") , unspecified)
     360. # 0  0       #pragma function ftello   (alias("ftello64") , unspecified)
     361. # 0  0    #else  /* _FILE_OFFSET_BITS != 64 */
     362. # 0  0       #pragma function fseeko   (alias("fseek"), unspecified)
     363. # 0  0       #pragma function ftello   (alias("ftell"), unspecified)
     364. # 0  0    #endif /* _FILE_OFFSET_BITS != 64 */
     365. # 0  0    #endif /* !__LP64 */
     366.   0  0    #endif /* _LARGEFILE64_SOURCE == 1 || ... || _TANDEM_SOURCE */
Page 7    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     367.   0  0    #endif /* _TANDEM_ARCH_ != 0 */
     368.   0  0    
     369.   0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     370.   0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
     371.   0  0        defined(_TANDEM_SOURCE)
     372.   0  0    FILE  *fdopen(int, const char *) __NOEXCEPT;
     373.   0  0    int    fileno(FILE *) __NOEXCEPT;
     374. # 0  0    #if defined(_TANDEM_SOURCE) && (_TANDEM_ARCH_ != 0 || !defined(__TANDEM))
     375. # 0  0    int    gfileno(FILE *) __NOEXCEPT;
     376.   0  0    #endif
     377.   0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     378.   0  0    
     379.   0  0    #endif /* !_GUARDIAN_TARGET || __XMEM */
     380.   0  0    
     381.   0  0    #if _TANDEM_ARCH_ != 0 || defined(__INT32)
     382. # 0  0    #ifdef _TANDEM_SOURCE
     383. # 0  0    FILE *fopen_guardian  (const char *, const char *) __NOEXCEPT;
     384. # 0  0    FILE *fopen_oss       (const char *, const char *) __NOEXCEPT;
     385. # 0  0    FILE *freopen_guardian(const char *, const char *, FILE *) __NOEXCEPT;
     386. # 0  0    FILE *freopen_oss     (const char *, const char *, FILE *) __NOEXCEPT;
     387. # 0  0    int   remove_guardian (const char *) __NOEXCEPT;
     388. # 0  0    int   remove_oss      (const char *) __NOEXCEPT;
     389. # 0  0    int   rename_guardian (const char *, const char *) __NOEXCEPT;
     390. # 0  0    int   rename_oss      (const char *, const char *) __NOEXCEPT;
     391. # 0  0    FILE *tmpfile_guardian(void) __NOEXCEPT;
     392. # 0  0    FILE *tmpfile_oss     (void) __NOEXCEPT;
     393. # 0  0    char *tmpnam_guardian (char *) __NOEXCEPT;
     394. # 0  0    char *tmpnam_oss      (char *) __NOEXCEPT;
     395. # 0  0    #if _TANDEM_ARCH_ != 0
     396. # 0  0    #if _LARGEFILE64_SOURCE == 1
     397. # 0  0    FILE *fopen64_guardian  (const char *, const char *);
     398. # 0  0    FILE *fopen64_oss       (const char *, const char *);
     399. # 0  0    FILE *freopen64_guardian(const char *, const char *, FILE *);
     400. # 0  0    FILE *freopen64_oss     (const char *, const char *, FILE *);
     401. # 0  0    FILE *tmpfile64_guardian(void);
     402. # 0  0    FILE *tmpfile64_oss   (void);
     403. # 0  0    #endif /* _LARGEFILE64_SOURCE == 1 */
     404. # 0  0    
     405. # 0  0    #ifdef __LP64
     406. # 0  0       #if _LARGEFILE64_SOURCE == 1
     407. # 0  0       #pragma function fopen64_guardian    (alias("fopen_guardian")  , unspecified)
     408. # 0  0       #pragma function fopen64_oss         (alias("fopen_oss")       , unspecified)
     409. # 0  0       #pragma function freopen64_guardian  (alias("freopen_guardian"), unspecified)
     410. # 0  0       #pragma function freopen64_oss       (alias("freopen_oss")     , unspecified)
     411. # 0  0       #pragma function tmpfile64_guardian  (alias("tmpfile_guardian"), unspecified)
     412. # 0  0       #pragma function tmpfile64_oss       (alias("tmpfile_oss")     , unspecified)
     413. # 0  0       #endif /* _LARGEFILE64_SOURCE == 1 */
     414. # 0  0    #else /* !__LP64 */
     415. # 0  0    #if _FILE_OFFSET_BITS == 64
     416. # 0  0       #pragma function fopen_guardian    (alias("fopen64_guardian")  , unspecified)
     417. # 0  0       #pragma function fopen_oss         (alias("fopen64_oss")       , unspecified)
     418. # 0  0       #pragma function freopen_guardian  (alias("freopen64_guardian"), unspecified)
     419. # 0  0       #pragma function freopen_oss       (alias("freopen64_oss")     , unspecified)
     420. # 0  0       #pragma function tmpfile_guardian  (alias("tmpfile64_guardian"), unspecified)
     421. # 0  0       #pragma function tmpfile_oss       (alias("tmpfile64_oss")     , unspecified)
     422. # 0  0    #endif /* _FILE_OFFSET_BITS == 64 */
     423. # 0  0    #endif /* !__LP64 */
     424. # 0  0    #endif /* _TANDEM_ARCH_ != 0 */
     425.   0  0    #endif /* _TANDEM_SOURCE */
     426.   0  0    
     427.   0  0    #ifdef __TANDEM
     428.   0  0    #if _TANDEM_ARCH_ != 0
     429.   0  0    #if !defined(_EMBEDDED) && !defined(_LIBSPACE)
Page 8    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     430.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
     431.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     432. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     433. # 0  0    #pragma function rename           (alias("_TSL_rename"), unspecified)
     434.   0  0    #else  /* !_THREAD_SUPPORT_FUNCTIONS */
     435.   0  0    #pragma function rename           (alias("rename_dynamic"), unspecified)
     436.   0  0    #endif /* !_THREAD_SUPPORT_FUNCTIONS */
     437.   0  0    #endif /* !_EMBEDDED && !_LIBSPACE */
     438. # 0  0    #ifdef _TANDEM_SOURCE
     439. # 0  0    #if (_TANDEM_ARCH_ >= 2 && \
     440. # 0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     441. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     442. # 0  0    #pragma function rename_oss       (alias("_TSL_rename"), unspecified)
     443. # 0  0    #else  /* !_THREAD_SUPPORT_FUNCTIONS */
     444. # 0  0    #pragma function rename_oss       (alias("rename"),     unspecified)
     445. # 0  0    #endif /* !_THREAD_SUPPORT_FUNCTIONS */
     446.   0  0    #endif /* _TANDEM_SOURCE */
     447. # 0  0    #else  /* _TANDEM_ARCH_ == 0 */
     448. # 0  0    #ifdef _TANDEM_SOURCE
     449. # 0  0    #pragma function fopen_guardian   (alias("C_LG_FOPEN_"),     unspecified)
     450. # 0  0    #pragma function fopen_oss        (alias("_C_PX_fopen_"),    unspecified)
     451. # 0  0    #pragma function freopen_guardian (alias("C_LG_FREOPEN_"),   unspecified)
     452. # 0  0    #pragma function freopen_oss      (alias("_C_PX_freopen_"),  unspecified)
     453. # 0  0    #pragma function remove_guardian  (alias("C_REMOVE_32_"),    unspecified)
     454. # 0  0    #pragma function remove_oss       (alias("_C_PX_remove_"),   unspecified)
     455. # 0  0    #pragma function rename_guardian  (alias("C_RENAME_32_"),    unspecified)
     456. # 0  0    #pragma function rename_oss       (alias("PXFS_FILE_RENAME_"),       tal)
     457. # 0  0    #pragma function tmpfile_guardian (alias("C_LG_TMPFILE_"),   unspecified)
     458. # 0  0    #pragma function tmpfile_oss      (alias("_C_PX_tmpfile_"),  unspecified)
     459. # 0  0    #pragma function tmpnam_guardian  (alias("C_LG_TMPNAM_"),    unspecified)
     460. # 0  0    #pragma function tmpnam_oss       (alias("_C_PX_tmpnam_"),   unspecified)
     461. # 0  0    #endif /* _TANDEM_SOURCE */
     462.   0  0    #endif /* _TANDEM_ARCH_ == 0 */
     463.   0  0    #endif /* __TANDEM */
     464.   0  0    #endif /* _TANDEM_ARCH_ != 0 || __INT32 */
     465.   0  0    
     466.   0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     467.   0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2
     468.   0  0    #define L_ctermid    9
     469.   0  0    char *ctermid(char *) __NOEXCEPT;
     470.   0  0    #if (_TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)) \
     471.   0  0        && !defined(_SPT_MODEL_)
     472.   0  0    char *ctermid_r(char *) __NOEXCEPT;
     473.   0  0    #endif /* _TANDEM_ARCH_ >= 2 && !_SPT_MODEL_ */
     474.   0  0    
     475.   0  0    #if _TANDEM_ARCH_ != 0
     476.   0  0    #define L_cuserid    33
     477.   0  0    char   *cuserid(char *) __NOEXCEPT;
     478.   0  0    #endif
     479.   0  0    
     480.   0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE */
     481.   0  0    
     482.   0  0    #if defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2
     483.   0  0    int   pclose(FILE *) __NOEXCEPT;
     484.   0  0    FILE *popen(const char *, const char *) __NOEXCEPT;
     485.   0  0    #endif /* _XOPEN_SOURCE || _POSIX_C_SOURCE == 2 */
     486.   0  0    
     487.   0  0    #ifdef _XOPEN_SOURCE
     488.   0  0    #ifndef _GUARDIAN_TARGET
     489.   0  0    int   getw(FILE *) __NOEXCEPT;
     490.   0  0    int   putw(int, FILE *) __NOEXCEPT;
     491.   0  0    #endif
     492.   0  0    char *tempnam(const char *, const char *) __NOEXCEPT;
Page 9    2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     493.   0  0    #endif /* _XOPEN_SOURCE */
     494.   0  0    
     495.   0  0    /*
     496.   0  0     * TNS C aliases and attributes
     497.   0  0     */
     498. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0
     499. # 0  0    #ifdef _GUARDIAN_TARGET
     500. # 0  0    #ifdef __XMEM
     501. # 0  0    #ifdef __INT32
     502. # 0  0    /*
     503. # 0  0     * Wide Model
     504. # 0  0     */
     505. # 0  0    #ifdef _INTEROPERABLE
     506. # 0  0    #pragma function __stdio_fp    (alias("C_INT_LG_STDIO_FP_"), unspecified)
     507. # 0  0    #pragma function clearerr      (alias("_C_HB_clearerr_"),  unspecified)
     508. # 0  0    #pragma function fclose        (alias("_C_HB_fclose_"),    unspecified)
     509. # 0  0    #pragma function feof          (alias("_C_HB_feof_"),      unspecified)
     510. # 0  0    #pragma function ferror        (alias("_C_HB_ferror_"),    unspecified)
     511. # 0  0    #pragma function fflush        (alias("_C_HB_fflush_"),    unspecified)
     512. # 0  0    #pragma function fgetc         (alias("_C_HB_fgetc_"),     unspecified)
     513. # 0  0    #pragma function fgetpos       (alias("_C_HB_fgetpos_"),   unspecified)
     514. # 0  0    #pragma function fgets         (alias("_C_HB_fgets_"),     unspecified)
     515. # 0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     516. # 0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
     517. # 0  0        defined(_TANDEM_SOURCE)
     518. # 0  0    #pragma function fdopen        (alias("_C_HB_fdopen_"),    unspecified)
     519. # 0  0    #pragma function fileno        (alias("_C_HB_fileno_"),    unspecified)
     520. # 0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     521. # 0  0    #pragma function fopen         (alias("C_LG_FOPEN_"),      unspecified)
     522. # 0  0    #pragma function fprintf       (alias("_C_HB_fprintf_"),   c)
     523. # 0  0    #pragma function fputc         (alias("_C_HB_fputc_"),     unspecified)
     524. # 0  0    #pragma function fputs         (alias("_C_HB_fputs_"),     unspecified)
     525. # 0  0    #pragma function fread         (alias("_C_HB_fread_"),     unspecified)
     526. # 0  0    #pragma function freopen       (alias("C_LG_FREOPEN_"),    tal)
     527. # 0  0    #pragma function fscanf        (alias("_C_HB_fscanf_"),    c)
     528. # 0  0    #pragma function fseek         (alias("_C_HB_fseek_"),     unspecified)
     529. # 0  0    #pragma function fsetpos       (alias("_C_HB_fsetpos_"),   unspecified)
     530. # 0  0    #pragma function ftell         (alias("_C_HB_ftell_"),     unspecified)
     531. # 0  0    #pragma function fwrite        (alias("_C_HB_fwrite_"),    unspecified)
     532. # 0  0    #pragma function getc          (alias("_C_HB_getc_"),      unspecified)
     533. # 0  0    #pragma function gets          (alias("_C_HB_gets_"),      unspecified)
     534. # 0  0    #pragma function printf        (alias("_C_HB_printf_"),    c)
     535. # 0  0    #pragma function putc          (alias("_C_HB_putc_"),      unspecified)
     536. # 0  0    #pragma function puts          (alias("_C_HB_puts_"),      unspecified)
     537. # 0  0    #pragma function remove        (alias("C_REMOVE_32_"),     tal)
     538. # 0  0    #pragma function rename        (alias("C_RENAME_32_"),     unspecified)
     539. # 0  0    #pragma function rewind        (alias("_C_HB_rewind_"),    unspecified)
     540. # 0  0    #pragma function scanf         (alias("_C_HB_scanf_"),     c)
     541. # 0  0    #pragma function setbuf        (alias("_C_HB_setbuf_"),    unspecified)
     542. # 0  0    #pragma function setvbuf       (alias("_C_HB_setvbuf_"),   unspecified)
     543. # 0  0    #pragma function tmpfile       (alias("C_LG_TMPFILE_"),    unspecified)
     544. # 0  0    #pragma function tmpnam        (alias("C_LG_TMPNAM_"),     unspecified)
     545. # 0  0    #pragma function ungetc        (alias("_C_HB_ungetc_"),    unspecified)
     546. # 0  0    #pragma function vfprintf      (alias("_C_HB_vfprintf_"),  c)
     547. # 0  0    #pragma function vprintf       (alias("_C_HB_vprintf_"),   c)
     548. # 0  0    #ifdef _TANDEM_SOURCE
     549. # 0  0    #pragma function edfseek       (alias("C_EDFSEEK_32_"),    tal)
     550. # 0  0    #pragma function edftell       (alias("C_EDFTELL_"),       tal)
     551. # 0  0    #pragma function fcloseall     (alias("C_FCLOSEALL_"),     tal)
     552. # 0  0    #endif /* _TANDEM_SOURCE */
     553. # 0  0    #else /* not interoperable */
     554. # 0  0    #pragma function __stdio_fp    (alias("C_INT_LG_STDIO_FP_"), tal)
     555. # 0  0    #pragma function clearerr      (alias("C_CLEARERR_"),      tal)
Page 10   2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     556. # 0  0    #pragma function fclose        (alias("C_FCLOSE_32_"),     tal)
     557. # 0  0    #pragma function feof          (alias("C_FEOF_32_"),       tal)
     558. # 0  0    #pragma function ferror        (alias("C_FERROR_32_"),     tal)
     559. # 0  0    #pragma function fflush        (alias("C_FFLUSH_32_"),     tal)
     560. # 0  0    #pragma function fgetc         (alias("C_FGETC_32_"),      tal)
     561. # 0  0    #pragma function fgetpos       (alias("C_FGETPOS_32_"),    tal)
     562. # 0  0    #pragma function fgets         (alias("C_LG_FGETS_32_"),   tal)
     563. # 0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     564. # 0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
     565. # 0  0        defined(_TANDEM_SOURCE)
     566. # 0  0    #pragma function fdopen        (alias ("C_LG_FDOPEN_32_"), tal)
     567. # 0  0    #pragma function fileno        (alias ("C_FILENO_32_"),    tal)
     568. # 0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     569. # 0  0    #pragma function fopen         (alias ("C_LG_FOPEN_"),     tal)
     570. # 0  0    #pragma function fprintf       (alias ("_C_LG_fprintf_32_"), c)
     571. # 0  0    #pragma function fputc         (alias ("C_FPUTC_32_"),     tal)
     572. # 0  0    #pragma function fputs         (alias ("C_FPUTS_32_"),     tal)
     573. # 0  0    #pragma function fread         (alias ("C_LG_FREAD_"),     tal)
     574. # 0  0    #pragma function freopen       (alias ("C_LG_FREOPEN_"),   tal)
     575. # 0  0    #pragma function fscanf        (alias ("_C_LG_fscanf_32_"),  c)
     576. # 0  0    #pragma function fseek         (alias ("C_FSEEK_32_"),     tal)
     577. # 0  0    #pragma function fsetpos       (alias ("C_FSETPOS_32_"),   tal)
     578. # 0  0    #pragma function ftell         (alias ("C_FTELL_"),        tal)
     579. # 0  0    #pragma function fwrite        (alias ("C_LG_FWRITE_"),    tal)
     580. # 0  0    #pragma function getc          (alias ("C_GETC_32_"),      tal)
     581. # 0  0    #pragma function gets          (alias ("C_LG_GETS_"),      tal)
     582. # 0  0    #pragma function printf        (alias ("_C_LG_printf_32_"),  c)
     583. # 0  0    #pragma function putc          (alias ("C_PUTC_32_"),      tal)
     584. # 0  0    #pragma function puts          (alias ("C_PUTS_32_"),      tal)
     585. # 0  0    #pragma function remove        (alias ("C_REMOVE_32_"),    tal)
     586. # 0  0    #pragma function rename        (alias ("C_RENAME_32_"),    tal)
     587. # 0  0    #pragma function rewind        (alias ("C_REWIND_"),       tal)
     588. # 0  0    #pragma function scanf         (alias ("_C_LG_scanf_32_"),   c)
     589. # 0  0    #pragma function setbuf        (alias ("C_SETBUF_"),       tal)
     590. # 0  0    #pragma function setvbuf       (alias ("C_LG_SETVBUF_32_"),tal)
     591. # 0  0    #pragma function tmpfile       (alias ("C_LG_TMPFILE_"),   tal)
     592. # 0  0    #pragma function tmpnam        (alias ("C_LG_TMPNAM_"),    tal)
     593. # 0  0    #pragma function ungetc        (alias ("C_UNGETC_32_"),    tal)
     594. # 0  0    #pragma function vfprintf      (alias ("_C_LG_vfprintf_32_"),c)
     595. # 0  0    #pragma function vprintf       (alias ("_C_LG_vprintf_32_"), c)
     596. # 0  0    #ifdef _TANDEM_SOURCE
     597. # 0  0    #pragma function edfseek       (alias ("C_EDFSEEK_32_"),   tal)
     598. # 0  0    #pragma function edftell       (alias ("C_EDFTELL_"),      tal)
     599. # 0  0    #pragma function fcloseall     (alias ("C_FCLOSEALL_"),    tal)
     600. # 0  0    #endif /* _TANDEM_SOURCE */
     601. # 0  0    #endif /* _INTEROPERABLE */
     602. # 0  0    #else
     603. # 0  0    /*
     604. # 0  0     * Large Model
     605. # 0  0     */
     606. # 0  0    #pragma function __stdio_fp    (alias("C_INT_LG_STDIO_FP_"), tal)
     607. # 0  0    #pragma function clearerr      (alias("C_CLEARERR_"),      tal)
     608. # 0  0    #pragma function fclose        (alias("C_FCLOSE_"),        tal)
     609. # 0  0    #pragma function feof          (alias("C_FEOF_"),          tal)
     610. # 0  0    #pragma function ferror        (alias("C_FERROR_"),        tal)
     611. # 0  0    #pragma function fflush        (alias("C_FFLUSH_"),        tal)
     612. # 0  0    #pragma function fgetc         (alias("C_FGETC_"),         tal)
     613. # 0  0    #pragma function fgetpos       (alias("C_FGETPOS_"),       tal)
     614. # 0  0    #pragma function fgets         (alias("C_LG_FGETS_"),      tal)
     615. # 0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     616. # 0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
     617. # 0  0        defined(_TANDEM_SOURCE)
     618. # 0  0    #pragma function fdopen        (alias("C_LG_FDOPEN_"),     tal)
Page 11   2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     619. # 0  0    #pragma function fileno        (alias("C_FILENO_"),        tal)
     620. # 0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     621. # 0  0    #pragma function fopen         (alias("C_LG_FOPEN_"),      tal)
     622. # 0  0    #pragma function fprintf       (alias("_C_LG_fprintf_"),   c)
     623. # 0  0    #pragma function fputc         (alias("C_FPUTC_"),         tal)
     624. # 0  0    #pragma function fputs         (alias("C_FPUTS_"),         tal)
     625. # 0  0    #pragma function fread         (alias("C_LG_FREAD_"),      tal)
     626. # 0  0    #pragma function freopen       (alias("C_LG_FREOPEN_"),    tal)
     627. # 0  0    #pragma function fscanf        (alias("_C_LG_fscanf_"),    c)
     628. # 0  0    #pragma function fseek         (alias("C_FSEEK_"),         tal)
     629. # 0  0    #pragma function fsetpos       (alias("C_FSETPOS_"),       tal)
     630. # 0  0    #pragma function ftell         (alias("C_FTELL_"),         tal)
     631. # 0  0    #pragma function fwrite        (alias("C_LG_FWRITE_"),     tal)
     632. # 0  0    #pragma function getc          (alias("C_GETC_"),          tal)
     633. # 0  0    #pragma function gets          (alias("C_LG_GETS_"),       tal)
     634. # 0  0    #pragma function printf        (alias("_C_LG_printf_"),    c)
     635. # 0  0    #pragma function putc          (alias("C_PUTC_"),          tal)
     636. # 0  0    #pragma function puts          (alias("C_PUTS_"),          tal)
     637. # 0  0    #pragma function remove        (alias("C_REMOVE_"),        tal)
     638. # 0  0    #pragma function rename        (alias("C_RENAME_"),        tal)
     639. # 0  0    #pragma function rewind        (alias("C_REWIND_"),        tal)
     640. # 0  0    #pragma function scanf         (alias("_C_LG_scanf_"),     c)
     641. # 0  0    #pragma function setbuf        (alias("C_SETBUF_"),        tal)
     642. # 0  0    #pragma function setvbuf       (alias("C_LG_SETVBUF_"),    tal)
     643. # 0  0    #pragma function tmpfile       (alias("C_LG_TMPFILE_"),    tal)
     644. # 0  0    #pragma function tmpnam        (alias("C_LG_TMPNAM_"),     tal)
     645. # 0  0    #pragma function ungetc        (alias("C_UNGETC_"),        tal)
     646. # 0  0    #pragma function vfprintf      (alias("_C_LG_vfprintf_"),  c)
     647. # 0  0    #pragma function vprintf       (alias("_C_LG_vprintf_"),   c)
     648. # 0  0    #ifdef _TANDEM_SOURCE
     649. # 0  0    #pragma function edfseek       (alias("C_EDFSEEK_"),       tal)
     650. # 0  0    #pragma function edftell       (alias("C_EDFTELL_"),       tal)
     651. # 0  0    #pragma function fcloseall     (alias("C_FCLOSEALL_"),     tal)
     652. # 0  0    #endif /* _TANDEM_SOURCE */
     653. # 0  0    #endif
     654. # 0  0    #else
     655. # 0  0    /*
     656. # 0  0     * Small Model
     657. # 0  0     */
     658. # 0  0    void   clearerr(FILE _far *);
     659. # 0  0    int    fclose(FILE _far *);
     660. # 0  0    FILE  *fdopen(int, const char _far *);
     661. # 0  0    int    feof(FILE _far *);
     662. # 0  0    int    ferror(FILE _far *);
     663. # 0  0    int    fflush(FILE _far *);
     664. # 0  0    int    fgetc(FILE _far *);
     665. # 0  0    int    fgetpos(FILE _far *, fpos_t _far *);
     666. # 0  0    char  *fgets(char _far *, int, FILE _far *);
     667. # 0  0    int    fileno(FILE _far *);
     668. # 0  0    FILE  *fopen(const char _far *, const char _far *);
     669. # 0  0    int    fputc(int, FILE _far *);
     670. # 0  0    int    fputs(const char _far *, FILE _far *);
     671. # 0  0    size_t fread(void _far *, size_t, size_t, FILE _far *);
     672. # 0  0    FILE  *freopen(const char _far *, const char _far *, FILE _far *);
     673. # 0  0    int    fseek(FILE _far *, long, int);
     674. # 0  0    int    fsetpos(FILE _far *, const fpos_t _far *);
     675. # 0  0    long   ftell(FILE _far *);
     676. # 0  0    size_t fwrite(const void _far *, size_t, size_t, FILE _far *);
     677. # 0  0    int    getc(FILE _far *);
     678. # 0  0    char  *gets(char _far *);
     679. # 0  0    int    putc(int, FILE _far *);
     680. # 0  0    int    puts(const char _far *);
     681. # 0  0    int    remove(const char _far *);
Page 12   2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     682. # 0  0    int    rename(const char _far *, const char _far *);
     683. # 0  0    void   rewind(FILE _far *);
     684. # 0  0    void   setbuf(FILE _far *, char _far *);
     685. # 0  0    int    setvbuf(FILE _far *, char _far *, int, size_t);
     686. # 0  0    FILE  *tmpfile(void);
     687. # 0  0    char  *tmpnam(char _far *);
     688. # 0  0    int    ungetc(int, FILE _far *);
     689. # 0  0    #pragma function __stdio_fp    (alias("C_INT_SM_STDIO_FP_"), tal)
     690. # 0  0    #pragma function clearerr      (alias("C_CLEARERR_"),        tal)
     691. # 0  0    #pragma function edfseek       (alias("C_EDFSEEK_"),         tal)
     692. # 0  0    #pragma function edftell       (alias("C_EDFTELL_"),         tal)
     693. # 0  0    #pragma function fclose        (alias("C_FCLOSE_"),          tal)
     694. # 0  0    #pragma function fcloseall     (alias("C_FCLOSEALL_"),       tal)
     695. # 0  0    #pragma function fdopen        (alias("C_SM_FDOPEN_"),       tal)
     696. # 0  0    #pragma function feof          (alias("C_FEOF_"),            tal)
     697. # 0  0    #pragma function ferror        (alias("C_FERROR_"),          tal)
     698. # 0  0    #pragma function fflush        (alias("C_FFLUSH_"),          tal)
     699. # 0  0    #pragma function fgetc         (alias("C_FGETC_"),           tal)
     700. # 0  0    #pragma function fgetpos       (alias("C_FGETPOS_"),         tal)
     701. # 0  0    #pragma function fgets         (alias("C_SM_FGETS_"),        tal)
     702. # 0  0    #pragma function fileno        (alias("C_FILENO_"),          tal)
     703. # 0  0    #pragma function fopen         (alias("C_SM_FOPEN_"),        tal)
     704. # 0  0    #pragma function fprintf       (alias("_C_SM_fprintf_"),     c)
     705. # 0  0    #pragma function fputc         (alias("C_FPUTC_"),           tal)
     706. # 0  0    #pragma function fputs         (alias("C_FPUTS_"),           tal)
     707. # 0  0    #pragma function fread         (alias("C_SM_FREAD_"),        tal)
     708. # 0  0    #pragma function freopen       (alias("C_SM_FREOPEN_"),      tal)
     709. # 0  0    #pragma function fscanf        (alias("_C_SM_fscanf_"),      c)
     710. # 0  0    #pragma function fseek         (alias("C_FSEEK_"),           tal)
     711. # 0  0    #pragma function fsetpos       (alias("C_FSETPOS_"),         tal)
     712. # 0  0    #pragma function printf        (alias("_C_SM_printf_"),        c)
     713. # 0  0    #pragma function scanf         (alias("_C_SM_scanf_"),         c)
     714. # 0  0    #pragma function ftell         (alias("C_FTELL_"),           tal)
     715. # 0  0    #pragma function fwrite        (alias("C_SM_FWRITE_"),       tal)
     716. # 0  0    #pragma function getc          (alias("C_GETC_"),            tal)
     717. # 0  0    #pragma function gets          (alias("C_SM_GETS_"),         tal)
     718. # 0  0    #pragma function putc          (alias("C_PUTC_"),            tal)
     719. # 0  0    #pragma function puts          (alias("C_PUTS_"),            tal)
     720. # 0  0    #pragma function remove        (alias("C_REMOVE_"),          tal)
     721. # 0  0    #pragma function rename        (alias("C_RENAME_"),          tal)
     722. # 0  0    #pragma function rewind        (alias("C_REWIND_"),          tal)
     723. # 0  0    #pragma function setbuf        (alias("C_SETBUF_"),          tal)
     724. # 0  0    #pragma function setvbuf       (alias("C_SM_SETVBUF_"),      tal)
     725. # 0  0    #pragma function tmpfile       (alias("C_SM_TMPFILE_"),      tal)
     726. # 0  0    #pragma function tmpnam        (alias("C_SM_TMPNAM_"),       tal)
     727. # 0  0    #pragma function ungetc        (alias("C_UNGETC_"),          tal)
     728. # 0  0    #pragma function vfprintf      (alias("_C_SM_vfprintf_"),    c)
     729. # 0  0    #pragma function vprintf       (alias("_C_SM_vprintf_"),     c)
     730. # 0  0    #endif
     731. # 0  0    #else
     732. # 0  0    /*
     733. # 0  0     * OSS
     734. # 0  0     */
     735. # 0  0    #ifdef _INTEROPERABLE
     736. # 0  0    #pragma function __stdio_fp    (alias("C_INT_LG_STDIO_FP_"), unspecified)
     737. # 0  0    #pragma function clearerr      (alias("_C_HB_clearerr_"), unspecified)
     738. # 0  0    #pragma function fclose        (alias("_C_HB_fclose_"),   unspecified)
     739. # 0  0    #pragma function feof          (alias("_C_HB_feof_"),     unspecified)
     740. # 0  0    #pragma function ferror        (alias("_C_HB_ferror_"),   unspecified)
     741. # 0  0    #pragma function fflush        (alias("_C_HB_fflush_"),   unspecified)
     742. # 0  0    #pragma function fgetc         (alias("_C_HB_fgetc_"),    unspecified)
     743. # 0  0    #pragma function fgetpos       (alias("_C_HB_fgetpos_"),  unspecified)
     744. # 0  0    #pragma function fgets         (alias("_C_HB_fgets_"),    unspecified)
Page 13   2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     745. # 0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     746. # 0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
     747. # 0  0        defined(_TANDEM_SOURCE)
     748. # 0  0    #pragma function fdopen        (alias("_C_HB_fdopen_"),   unspecified)
     749. # 0  0    #pragma function fileno        (alias("_C_HB_fileno_"),   unspecified)
     750. # 0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     751. # 0  0    #pragma function fopen         (alias("_C_PX_fopen_"),    unspecified)
     752. # 0  0    #pragma function fprintf       (alias("_C_HB_fprintf_"),            c)
     753. # 0  0    #pragma function fputc         (alias("_C_HB_fputc_"),    unspecified)
     754. # 0  0    #pragma function fputs         (alias("_C_HB_fputs_"),    unspecified)
     755. # 0  0    #pragma function fread         (alias("_C_HB_fread_"),    unspecified)
     756. # 0  0    #pragma function freopen       (alias("_C_PX_freopen_"),  unspecified)
     757. # 0  0    #pragma function fscanf        (alias("_C_HB_fscanf_"),             c)
     758. # 0  0    #pragma function fseek         (alias("_C_HB_fseek_"),    unspecified)
     759. # 0  0    #pragma function fsetpos       (alias("_C_HB_fsetpos_"),  unspecified)
     760. # 0  0    #pragma function ftell         (alias("_C_HB_ftell_"),    unspecified)
     761. # 0  0    #pragma function fwrite        (alias("_C_HB_fwrite_"),   unspecified)
     762. # 0  0    #pragma function getc          (alias("_C_HB_getc_"),     unspecified)
     763. # 0  0    #pragma function gets          (alias("_C_HB_gets_"),     unspecified)
     764. # 0  0    #pragma function printf        (alias("_C_HB_printf_"),             c)
     765. # 0  0    #pragma function putc          (alias("_C_HB_putc_"),     unspecified)
     766. # 0  0    #pragma function puts          (alias("_C_HB_puts_"),     unspecified)
     767. # 0  0    #pragma function remove        (alias("_C_PX_remove_"),   unspecified)
     768. # 0  0    #pragma function rename        (alias("PXFS_FILE_RENAME_"),       tal)
     769. # 0  0    #pragma function rewind        (alias("_C_HB_rewind_"),   unspecified)
     770. # 0  0    #pragma function scanf         (alias("_C_HB_scanf_"),              c)
     771. # 0  0    #pragma function setbuf        (alias("_C_HB_setbuf_"),   unspecified)
     772. # 0  0    #pragma function setvbuf       (alias("_C_HB_setvbuf_"),  unspecified)
     773. # 0  0    #pragma function tmpfile       (alias("_C_PX_tmpfile_"),  unspecified)
     774. # 0  0    #pragma function tmpnam        (alias("_C_PX_tmpnam_"),   unspecified)
     775. # 0  0    #pragma function ungetc        (alias("_C_HB_ungetc_"),   unspecified)
     776. # 0  0    #pragma function vfprintf      (alias("_C_HB_vfprintf_"),           c)
     777. # 0  0    #pragma function vprintf       (alias("_C_HB_vprintf_"),            c)
     778. # 0  0    #else /* not interoperable */
     779. # 0  0    #pragma function __stdio_fp    (alias("C_INT_LG_STDIO_FP_"), unspecified)
     780. # 0  0    #pragma function clearerr      (alias("_C_PX_clearerr_"), unspecified)
     781. # 0  0    #pragma function fclose        (alias("_C_PX_fclose_"),   unspecified)
     782. # 0  0    #pragma function feof          (alias("_C_PX_feof_"),     unspecified)
     783. # 0  0    #pragma function ferror        (alias("_C_PX_ferror_"),   unspecified)
     784. # 0  0    #pragma function fflush        (alias("_C_PX_fflush_"),   unspecified)
     785. # 0  0    #pragma function fgetc         (alias("_C_PX_fgetc_"),    unspecified)
     786. # 0  0    #pragma function fgetpos       (alias("_C_PX_fgetpos_"),  unspecified)
     787. # 0  0    #pragma function fgets         (alias("_C_PX_fgets_"),    unspecified)
     788. # 0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
     789. # 0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
     790. # 0  0        defined(_TANDEM_SOURCE)
     791. # 0  0    #pragma function fdopen        (alias("_C_PX_fdopen_"),  unspecified)
     792. # 0  0    #pragma function fileno        (alias("_C_PX_fileno_"),  unspecified)
     793. # 0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     794. # 0  0    #pragma function fopen         (alias("_C_PX_fopen_"),   unspecified)
     795. # 0  0    #pragma function fprintf       (alias("_C_PX_fprintf_"),           c)
     796. # 0  0    #pragma function fputc         (alias("_C_PX_fputc_"),   unspecified)
     797. # 0  0    #pragma function fputs         (alias("_C_PX_fputs_"),   unspecified)
     798. # 0  0    #pragma function fread         (alias("_C_PX_fread_"),   unspecified)
     799. # 0  0    #pragma function freopen       (alias("_C_PX_freopen_"), unspecified)
     800. # 0  0    #pragma function fscanf        (alias("_C_PX_fscanf_"),            c)
     801. # 0  0    #pragma function fseek         (alias("_C_PX_fseek_"),   unspecified)
     802. # 0  0    #pragma function fsetpos       (alias("_C_PX_fsetpos_"), unspecified)
     803. # 0  0    #pragma function ftell         (alias("_C_PX_ftell_"),   unspecified)
     804. # 0  0    #pragma function fwrite        (alias("_C_PX_fwrite_"),  unspecified)
     805. # 0  0    #pragma function getc          (alias("_C_PX_getc_"),    unspecified)
     806. # 0  0    #pragma function gets          (alias("_C_PX_gets_"),    unspecified)
     807. # 0  0    #pragma function printf        (alias("_C_PX_printf_"),            c)
Page 14   2026 June 11, 11:03:05        [1] C:\NonStop\L25.02\usr\include\stdio.h


     808. # 0  0    #pragma function putc          (alias("_C_PX_putc_"),    unspecified)
     809. # 0  0    #pragma function puts          (alias("_C_PX_puts_"),    unspecified)
     810. # 0  0    #pragma function remove        (alias("_C_PX_remove_"),  unspecified)
     811. # 0  0    #pragma function rename        (alias("PXFS_FILE_RENAME_"),      tal)
     812. # 0  0    #pragma function rewind        (alias("_C_PX_rewind_"),  unspecified)
     813. # 0  0    #pragma function scanf         (alias("_C_PX_scanf_"),             c)
     814. # 0  0    #pragma function setbuf        (alias("_C_PX_setbuf_"),  unspecified)
     815. # 0  0    #pragma function setvbuf       (alias("_C_PX_setvbuf_"), unspecified)
     816. # 0  0    #pragma function tmpfile       (alias("_C_PX_tmpfile_"), unspecified)
     817. # 0  0    #pragma function tmpnam        (alias("_C_PX_tmpnam_"),  unspecified)
     818. # 0  0    #pragma function ungetc        (alias("_C_PX_ungetc_"),  unspecified)
     819. # 0  0    #pragma function vfprintf      (alias("_C_PX_vfprintf_"),          c)
     820. # 0  0    #pragma function vprintf       (alias("_C_PX_vprintf_"),           c)
     821. # 0  0    #endif /* _INTEROPERABLE */
     822. # 0  0    #endif
     823.   0  0    #endif /* __TANDEM && _TANDEM_ARCH_ == 0 */
     824.   0  0    
     825.   0  0    
     826.   0  0    #if _TANDEM_ARCH_ != 0 || defined(_OSS_TARGET) && !defined(_INTEROPERABLE)
     827.   0  0    extern int __filbuf (FILE *) __NOEXCEPT;
     828.   0  0    extern int __flsbuf (int, FILE *) __NOEXCEPT;
     829.   0  0    #if _TANDEM_ARCH_ != 0 && \
     830. # 0  0          (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL))
     831. # 0  0    #define getc_unlocked(stream) \
     832. # 0  0       (--(stream)->_cnt >= 0 ? ((int) *(stream)->_ptr++) : __filbuf(stream))
     833. # 0  0    #define putc_unlocked(c, stream) \
     834. # 0  0       (--(stream)->_cnt >= 0 ? (int)(*(stream)->_ptr++ = (unsigned char)(c)) : \
     835. # 0  0                                __flsbuf((unsigned char)(c), stream))
     836.   0  0    #else  /* _TANDEM_ARCH_ == 0 || (!_THREAD_SUPPORT_FUNCTIONS && !_PUT_MODEL) */
     837.   0  0    #define getc(stream) \
     838.   0  0       (--(stream)->_cnt >= 0 ? ((int) *(stream)->_ptr++) : __filbuf(stream))
     839.   0  0    #define putc(c, stream) \
     840.   0  0       (--(stream)->_cnt >= 0 ? (int)(*(stream)->_ptr++ = (unsigned char)(c)) : \
     841.   0  0                                __flsbuf((unsigned char)(c), stream))
     842.   0  0    #endif /* _TANDEM_ARCH_ == 0 || (!_THREAD_SUPPORT_FUNCTIONS && !_PUT_MODEL) */
     843.   0  0    #endif /* _TANDEM_ARCH_ != 0 || _OSS_TARGET && !_INTEROPERABLE */
     844.   0  0    
     845.   0  0    
     846. # 0  0    #ifdef __cplusplus
     847. # 0  0       }
     848.   0  0    #endif
     849.   0  0    #if _TANDEM_ARCH_ > 2
     850.   0  0    #pragma hpe_nonstop_standard_header_end
     851.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
     852.   0  0    
     853.   0  0    #endif  /* _STDIO defined */
Source file:  [0] C:\ABM\T4\f1.c  2026-06-11 11:03:01
       3.   0  0    #include <stdlib.h>
Source file:  [2] C:\NonStop\L25.02\usr\include\stdlib.h  2025-03-07 13:25:11
       1.   0  0    #ifdef __TANDEM
       2.   0  0    #pragma columns 80
       3.   0  0    #if _TANDEM_ARCH_ != 0
       4.   0  0    #pragma ONCE
       5.   0  0    #endif
       6.   0  0    #endif
       7.   0  0    #ifndef _STDLIB
       8.   0  0    #define _STDLIB
       9.   0  0    #if _TANDEM_ARCH_ > 2
      10.   0  0    #pragma hpe_nonstop_standard_header
      11.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
      12.   0  0    
      13.   0  0    /* T8645L02 - (01FEB2025) - stdlib.h   standard library definitions */
      14.   0  0    
Page 15   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


      15.   0  0    /*
      16.   0  0     *  Copyright 2014, 2016, 2019, 2020, 2024 
      17.   0  0     *  Hewlett Packard Enterprise Development LP
      18.   0  0     *
      19.   0  0     *     ALL RIGHTS RESERVED
      20.   0  0     */
      21.   0  0    
      22. # 0  0    #ifdef __cplusplus
      23. # 0  0       extern "C" {
      24.   0  0    #endif
      25.   0  0    
      26.   0  0    
      27. # 0  0    #ifndef NULL
      28. # 0  0    #if defined(_GUARDIAN_TARGET) && defined(__XMEM)
      29. # 0  0    #define NULL   0L
      30. # 0  0    #else
      31. # 0  0    #define NULL   0
      32. # 0  0    #endif
      33.   0  0    #endif /* NULL */
      34.   0  0    
      35. # 0  0    #ifndef __size_t_DEFINED
      36. # 0  0    #define __size_t_DEFINED
      37. # 0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
      38. # 0  0    #ifdef __LP64
      39. # 0  0    typedef unsigned long  size_t;
      40. # 0  0    #else  /* !__LP64 */
      41. # 0  0    typedef unsigned int   size_t;
      42. # 0  0    #endif /* !__LP64 */
      43. # 0  0    #else /* _TANDEM_ARCH_ == 0 */
      44. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
      45. # 0  0    typedef unsigned long  size_t;
      46. # 0  0    #else
      47. # 0  0    typedef unsigned short size_t;
      48. # 0  0    #endif
      49. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
      50.   0  0    #endif /* __size_t_DEFINED */
      51.   0  0    
      52.   0  0    #ifndef __wchar_t_DEFINED
      53.   0  0    #define __wchar_t_DEFINED
      54.   0  0    typedef unsigned short wchar_t;
      55.   0  0    #endif
      56.   0  0    
      57.   0  0    #ifdef _XOPEN_SOURCE
      58.   0  0    #ifndef _GUARDIAN_HOST
      59.   0  0    #include <sys/wait.h>
Source file:  [3] C:\NonStop\L25.02\usr\include\sys/wait.h  2025-03-07 13:25:12
       1.   0  0    #ifdef __TANDEM
       2.   0  0    #pragma columns 80
       3.   0  0    #if _TANDEM_ARCH_ != 0
       4.   0  0    #pragma ONCE
       5.   0  0    #endif
       6.   0  0    #endif
       7.   0  0    #ifndef _SYSWAIT
       8.   0  0    #define _SYSWAIT
       9.   0  0    #if _TANDEM_ARCH_ > 2
      10.   0  0    #pragma hpe_nonstop_standard_header
      11.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
      12. # 0  0    #ifndef __NOEXCEPT
      13. # 0  0    #if (__CPLUSPLUS_VERSION >= 4)
      14. # 0  0    #define __NOEXCEPT noexcept
      15. # 0  0    #elif (__CPLUSPLUS_VERSION == 3)
      16. # 0  0    #define __NOEXCEPT throw ()
      17. # 0  0    #else
Page 16   2026 June 11, 11:03:05        [3] C:\NonStop\L25.02\usr\include\sys/wait.h


      18. # 0  0    #define __NOEXCEPT
      19. # 0  0    #endif /* (__CPLUSPLUS_VERSION >= 4) */
      20.   0  0    #endif /* __NOEXCEPT */
      21.   0  0    
      22.   0  0    
      23.   0  0    /* T8645L02 - (01FEB2025) - sys/wait.h   declarations for waiting */
      24.   0  0    
      25.   0  0    /*
      26.   0  0     *  Copyright 2014, 2024
      27.   0  0     *  Hewlett Packard Enterprise Development LP
      28.   0  0     *
      29.   0  0     *     ALL RIGHTS RESERVED
      30.   0  0     */
      31.   0  0    
      32. # 0  0    #ifdef __cplusplus
      33. # 0  0       extern "C" {
      34.   0  0    #endif
      35.   0  0    
      36.   0  0    /*
      37.   0  0     * COPYRIGHT NOTICE
      38.   0  0     *
      39.   0  0     * Copyright (c) 1990, 1991, 1992, 1993 Open Software Foundation, Inc.
      40.   0  0     * ALL RIGHTS RESERVED (OSF/1).  See /usr/include/COPYRIGHT.OSF1 .
      41.   0  0     */
      42.   0  0    /* OSF/1 1.3 (Revision 3.0.2.5) */
      43.   0  0    
      44.   0  0    /*
      45.   0  0     * Copyright International Business Machines Corp. 1985, 1988
      46.   0  0     * All Rights Reserved
      47.   0  0     * Licensed Material - Property of IBM
      48.   0  0     */
      49.   0  0    
      50.   0  0    #ifndef _GUARDIAN_HOST
      51.   0  0    #include <sys/types.h>
Source file:  [4] C:\NonStop\L25.02\usr\include\sys/types.h  2025-03-07 13:25:12
       1.   0  0    #ifdef __TANDEM
       2.   0  0    #pragma columns 90
       3.   0  0    #if _TANDEM_ARCH_ != 0
       4.   0  0    #pragma ONCE
       5.   0  0    #endif
       6.   0  0    #endif
       7.   0  0    #ifndef _SYS_TYPES
       8.   0  0    #define _SYS_TYPES
       9.   0  0    #if _TANDEM_ARCH_ > 2
      10.   0  0    #pragma hpe_nonstop_standard_header
      11.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
      12.   0  0    
      13.   0  0    /* T8645L02 - (01FEB2025) - sys/types.h   basic system types */
      14.   0  0    
      15.   0  0    /*
      16.   0  0     *  Copyright 2014, 2018, 2024 Hewlett Packard Enterprise Development LP
      17.   0  0     *
      18.   0  0     *     ALL RIGHTS RESERVED
      19.   0  0     */
      20.   0  0    
      21.   0  0    #if (_TANDEM_ARCH_ == 1 && __G_Series_RVU < 629 || \
      22.   0  0         _TANDEM_ARCH_ == 2 && __H_Series_RVU < 606) && \
      23. # 0  0            (_FILE_OFFSET_BITS == 64 || _LARGEFILE64_SOURCE == 1)
      24. # 0  0       #error 64-bit functions not available for target RVU
      25.   0  0    #endif /* 64-bit functions requested when not available */
      26.   0  0    
      27. # 0  0    #ifdef __cplusplus
      28. # 0  0       extern "C" {
Page 17   2026 June 11, 11:03:05        [4] C:\NonStop\L25.02\usr\include\sys/types.h


      29.   0  0    #endif
      30.   0  0    
      31.   0  0    
      32.   0  0    /*
      33.   0  0     * The OSS File System requires a 64-bit data object type.  Because the
      34.   0  0     * first ISO C Standard did not specify one, the NSK product set defined
      35.   0  0     * the type specifier int64_t in sys/types.h; it will continue to do so.
      36.   0  0     */
      37.   0  0    
      38.   0  0    #ifndef __int64_t_DEFINED               /* Prevent conflict with stdint.h */
      39.   0  0    #define __int64_t_DEFINED
      40.   0  0    typedef signed long long int64_t;
      41.   0  0    #endif
      42.   0  0    
      43.   0  0    #ifndef __clock_t_DEFINED
      44.   0  0    #define __clock_t_DEFINED
      45.   0  0    typedef int64_t         clock_t;        /* Used for sys time in clock ticks */
      46.   0  0    #endif
      47.   0  0    
      48.   0  0    typedef int64_t         dev_t;          /* <old device number> type */
      49. # 0  0    #ifdef __LP64
      50. # 0  0    typedef int             gid_t;          /* group id     */
      51.   0  0    #else  /* !__LP64 */
      52.   0  0    typedef long            gid_t;          /* group id     */
      53.   0  0    #endif /* !__LP64 */
      54.   0  0    
      55. # 0  0    #ifdef _XOPEN_SOURCE_EXTENDED
      56. # 0  0    #ifndef __id_t_DEFINED
      57. # 0  0    #define __id_t_DEFINED
      58. # 0  0    typedef int             id_t;           /* Can hold gid_t, pid_t, or uid_t */
      59. # 0  0    #endif
      60.   0  0    #endif /* _XOPEN_SOURCE_EXTENDED */
      61.   0  0    
      62.   0  0    typedef int             key_t;          /* IPC Key */
      63. # 0  0    #ifdef __LP64
      64. # 0  0    typedef unsigned int    mode_t;
      65.   0  0    #else  /* !__LP64 */
      66.   0  0    typedef unsigned long   mode_t;
      67.   0  0    #endif /* !__LP64 */
      68.   0  0    typedef short           nlink_t;
      69.   0  0    
      70. # 0  0    #if _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0
      71. # 0  0    typedef unsigned long long fsblkcnt_t;      /* <inode> type         */
      72. # 0  0    typedef unsigned long long fsfilcnt_t;      /* offsets within files */
      73.   0  0    #else  /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ == 0 */
      74.   0  0    typedef unsigned long fsblkcnt_t;           /* <inode> type         */
      75.   0  0    typedef unsigned long fsfilcnt_t;           /* offsets within files */
      76.   0  0    #endif /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ == 0 */
      77.   0  0    
      78. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
      79. # 0  0    typedef unsigned long long fsblkcnt64_t;    /* <inode> type         */
      80. # 0  0    typedef unsigned long long fsfilcnt64_t;    /* offsets within files */
      81.   0  0    #endif
      82.   0  0    
      83. # 0  0    #if _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0
      84. # 0  0    typedef unsigned long long ino_t;       /* <inode> type             */
      85.   0  0    #else  /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ == 0 */
      86.   0  0    typedef long ino_t;                     /* <inode> type             */
      87.   0  0    #endif /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ == 0 */
      88.   0  0    
      89. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
      90. # 0  0    typedef unsigned long long ino64_t;     /* <inode> type             */
      91.   0  0    #endif
Page 18   2026 June 11, 11:03:05        [4] C:\NonStop\L25.02\usr\include\sys/types.h


      92.   0  0    
      93. # 0  0    #ifndef __off_t_DEFINED
      94. # 0  0    #define __off_t_DEFINED
      95. # 0  0    #if _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0
      96. # 0  0    typedef long long       off_t;          /* file offset (signed integer) */
      97. # 0  0    #else  /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ != 0 */
      98. # 0  0    typedef long            off_t;          /* file offset (signed integer) */
      99. # 0  0    #endif /* _FILE_OFFSET_BITS != 64 || _TANDEM_ARCH_ != 0 */
     100. # 0  0    
     101. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     102. # 0  0    typedef long long       off64_t;        /* file offset (signed integer) */
     103. # 0  0    #endif
     104.   0  0    #endif /* __off_t_DEFINED */
     105.   0  0    
     106.   0  0    typedef int             pid_t;          /* process id (signed number)  */
     107.   0  0    
     108. # 0  0    #ifndef __size_t_DEFINED
     109. # 0  0    #define __size_t_DEFINED
     110. # 0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     111. # 0  0    #ifdef __LP64
     112. # 0  0    typedef unsigned long  size_t;
     113. # 0  0    #else  /* !__LP64 */
     114. # 0  0    typedef unsigned int   size_t;
     115. # 0  0    #endif /* !__LP64 */
     116. # 0  0    #else /* _TANDEM_ARCH_ == 0 */
     117. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     118. # 0  0    typedef unsigned long  size_t;
     119. # 0  0    #else
     120. # 0  0    typedef unsigned short size_t;
     121. # 0  0    #endif
     122. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     123.   0  0    #endif /* __size_t_DEFINED */
     124.   0  0    
     125.   0  0    #ifndef __ssize_t_DEFINED
     126.   0  0    #define __ssize_t_DEFINED
     127.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     128. # 0  0    #ifdef __LP64
     129. # 0  0    typedef long  ssize_t;
     130.   0  0    #else  /* !__LP64 */
     131.   0  0    typedef int   ssize_t;
     132.   0  0    #endif /* !__LP64 */
     133. # 0  0    #else /* _TANDEM_ARCH_ == 0 */
     134. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     135. # 0  0    typedef long  ssize_t;
     136. # 0  0    #else
     137. # 0  0    typedef short ssize_t;
     138. # 0  0    #endif
     139.   0  0    #endif /* _TANDEM_ARCH_ == 0 */
     140.   0  0    #endif /* __ssize_t_DEFINED */
     141.   0  0    
     142.   0  0    #ifndef __time_t_DEFINED
     143.   0  0    #define __time_t_DEFINED
     144.   0  0    typedef long            time_t;         /* time in seconds */
     145.   0  0    typedef long long       time64_t;       /* 64-bit time in seconds */
     146.   0  0    #endif
     147. # 0  0    #ifdef __LP64
     148. # 0  0    typedef unsigned long   useconds_t;     /* time in microseconds (unsigned) */
     149.   0  0    #else  /* !__LP64 */
     150.   0  0    typedef unsigned int    useconds_t;     /* time in microseconds (unsigned) */
     151.   0  0    #endif /* !__LP64 */
     152.   0  0    typedef long            suseconds_t;    /* time in microseconds (signed)   */
     153.   0  0    
     154. # 0  0    #ifdef __LP64
Page 19   2026 June 11, 11:03:05        [4] C:\NonStop\L25.02\usr\include\sys/types.h


     155. # 0  0    typedef int             uid_t;          /* user id      */
     156.   0  0    #else  /* !__LP64 */
     157.   0  0    typedef long            uid_t;          /* user id      */
     158.   0  0    #endif /* !__LP64 */
     159.   0  0    
     160.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
     161.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     162. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     163. # 0  0    #ifndef __pthread_types_DEFINED
     164. # 0  0    #define __pthread_types_DEFINED
     165. # 0  0    
     166. # 0  0    typedef struct PTHREAD_HANDLE_T {
     167. # 0  0               void       *field1;
     168. # 0  0               short int   field2;
     169. # 0  0               short int   field3;
     170. # 0  0            } pthread_handle_t;
     171. # 0  0    
     172. # 0  0    typedef pthread_handle_t pthread_t;
     173. # 0  0    
     174. # 0  0    typedef int              pthread_key_t;
     175. # 0  0    #ifdef _KLT_MODEL_
     176. # 0  0    #pragma maxalign       /* force 16-byte alignment  */
     177. # 0  0    typedef struct __PTHREAD_ATTR_OBJ {
     178. # 0  0        long long filler0[2];
     179. # 0  0        long long filler1[8];
     180. # 0  0        long long filler2[4];
     181. # 0  0    } __pthread_attr_obj;
     182. # 0  0    typedef __pthread_attr_obj pthread_attr_t;
     183. # 0  0    
     184. # 0  0    #pragma maxalign       /* force 16-byte alignment  */
     185. # 0  0    typedef struct __PTHREAD_SYNCATTR_OBJ {
     186. # 0  0        long long filler0[2];
     187. # 0  0        long long filler1[2];
     188. # 0  0        long long filler2[4];
     189. # 0  0    } __pthread_syncattr_obj;
     190. # 0  0    typedef __pthread_syncattr_obj pthread_condattr_t;
     191. # 0  0    typedef __pthread_syncattr_obj pthread_mutexattr_t;
     192. # 0  0    typedef __pthread_syncattr_obj pthread_rwlockattr_t;
     193. # 0  0    
     194. # 0  0    #pragma maxalign       /* force 16-byte alignment  */
     195. # 0  0    typedef struct __PTHREAD_SYNC_OBJ {
     196. # 0  0      long long filler0;
     197. # 0  0      int filler1[20];
     198. # 0  0      long filler2[10];
     199. # 0  0    } __pthread_sync_obj;
     200. # 0  0    typedef __pthread_sync_obj pthread_cond_t;
     201. # 0  0    typedef __pthread_sync_obj pthread_mutex_t;
     202. # 0  0    typedef __pthread_sync_obj pthread_rwlock_t; 
     203. # 0  0    
     204. # 0  0    #else /* _PUT_MODEL_ */
     205. # 0  0    typedef pthread_handle_t pthread_attr_t;
     206. # 0  0    typedef pthread_handle_t pthread_cond_t;
     207. # 0  0    typedef pthread_handle_t pthread_condattr_t;
     208. # 0  0    typedef pthread_handle_t pthread_mutex_t;
     209. # 0  0    typedef pthread_handle_t pthread_mutexattr_t;
     210. # 0  0    #endif
     211. # 0  0    
     212. # 0  0    
     213. # 0  0    #ifdef _KLT_MODEL_
     214. # 0  0    typedef struct PTHREAD_ONCE_T {
     215. # 0  0      short            po_executing;
     216. # 0  0      short            po_completed;
     217. # 0  0      pthread_mutex_t  po_mutex;
Page 20   2026 June 11, 11:03:05        [4] C:\NonStop\L25.02\usr\include\sys/types.h


     218. # 0  0      pthread_cond_t   po_cv;
     219. # 0  0    } pthread_once_t;
     220. # 0  0    #else
     221. # 0  0    typedef struct PTHREAD_ONCE_T {
     222. # 0  0               int    field1;
     223. # 0  0               int    field2;
     224. # 0  0    #ifdef __LP64
     225. # 0  0               long    field3;
     226. # 0  0    #else
     227. # 0  0               int    field3;
     228. # 0  0    #endif
     229. # 0  0            } pthread_once_t;
     230. # 0  0    #endif
     231. # 0  0    #endif /* __pthread_types_DEFINED */
     232.   0  0    #endif /* _PUT_MODEL_ || _KLT_MODEL_ */
     233.   0  0    
     234. # 0  0    #ifdef _TANDEM_SOURCE
     235. # 0  0    #ifndef __caddr_t_DEFINED
     236. # 0  0    #define __caddr_t_DEFINED
     237. # 0  0    typedef char   *caddr_t;
     238. # 0  0    #if _TANDEM_ARCH_ >= 2
     239. # 0  0    typedef char _ptr64 *caddr64_t;
     240. # 0  0    #endif
     241. # 0  0    #endif
     242. # 0  0    typedef unsigned char   uchar_t;
     243. # 0  0    typedef unsigned int    uint_t;
     244. # 0  0    
     245. # 0  0    #ifndef _tcp_TYPES
     246. # 0  0    #define _tcp_TYPES
     247. # 0  0    typedef unsigned char  u_char;
     248. # 0  0    typedef unsigned short u_short;
     249. # 0  0    typedef unsigned int   u_int;
     250. # 0  0    typedef unsigned long  u_long;
     251. # 0  0    typedef unsigned short ushort;
     252. # 0  0    #endif /* _tcp_TYPES */
     253. # 0  0    
     254. # 0  0    #ifndef __daddr_t_DEFINED
     255. # 0  0    #define __daddr_t_DEFINED
     256. # 0  0    typedef long    daddr_t;
     257. # 0  0    #endif
     258. # 0  0    
     259. # 0  0    #ifndef __NBBY_DEFINED
     260. # 0  0    #define __NBBY_DEFINED
     261. # 0  0    #define NBBY    8               /* number of bits in a byte */
     262. # 0  0    #endif
     263. # 0  0    
     264. # 0  0    #ifndef howmany
     265. # 0  0    #define howmany(x, y)   (((x)+((y)-1))/(y))
     266. # 0  0    #endif
     267.   0  0    #endif /* _TANDEM_SOURCE */
     268.   0  0    
     269.   0  0    
     270. # 0  0    #ifdef __cplusplus
     271. # 0  0       }
     272.   0  0    #endif
     273.   0  0    #if _TANDEM_ARCH_ > 2
     274.   0  0    #pragma hpe_nonstop_standard_header_end
     275.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
     276.   0  0    
     277.   0  0    #endif  /* _SYS_TYPES defined */
Source file:  [3] C:\NonStop\L25.02\usr\include\sys/wait.h  2025-03-07 13:25:12
      52. # 0  0    #else
      53. # 0  0    #include <systype.h> nolist
Page 21   2026 June 11, 11:03:05        [3] C:\NonStop\L25.02\usr\include\sys/wait.h


      54.   0  0    #endif /* _GUARDIAN_HOST */
      55.   0  0    
      56.   0  0    #define WNOHANG 1
      57.   0  0    #define WUNTRACED 2
      58.   0  0    
      59.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 624)
      60.   0  0    pid_t wait ( int _ptr64 * ) __NOEXCEPT;
      61.   0  0    pid_t waitpid ( pid_t, int _ptr64 *, int ) __NOEXCEPT;
      62. # 0  0    #else  /* _TANDEM_ARCH_ < 2 || __H_Series_RVU < 624 */
      63. # 0  0    pid_t wait ( int * );
      64. # 0  0    pid_t waitpid ( pid_t, int *, int );
      65.   0  0    #endif /* _TANDEM_ARCH_ < 2 || __H_Series_RVU < 624 */
      66.   0  0    
      67.   0  0    #if defined(__TANDEM)
      68.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
      69.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
      70. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
      71. # 0  0    #pragma function wait     (alias("_TSL_wait"),    unspecified)
      72. # 0  0    #pragma function waitpid  (alias("_TSL_waitpid"), unspecified)
      73.   0  0    #else  /* !_THREAD_SUPPORT_FUNCTIONS */
      74.   0  0    #pragma function wait    (unspecified)
      75.   0  0    #pragma function waitpid (unspecified)
      76.   0  0    #endif /* !_THREAD_SUPPORT_FUNCTIONS */
      77.   0  0    #endif
      78.   0  0    
      79.   0  0    /*
      80.   0  0     *               0                   15 16                    31
      81.   0  0     *              |-----------+----------+----------+-------------|
      82.   0  0     *   Stopped:   |         filler       | stopsig  |      0177   |
      83.   0  0     *              |-----------+----------+----------+-------------|
      84.   0  0     *
      85.   0  0     *              |-----------+----------+----------+-------------|
      86.   0  0     *   Exited:    |A| filler  |    completion code  |CD|     0    |
      87.   0  0     *              |-----------+----------+----------+-------------|
      88.   0  0     *
      89.   0  0     *              |-----------+----------+----------+-------------|
      90.   0  0     *   Signaled:  |A| filler  |    completion code  |CD| termsig  |
      91.   0  0     *              |-----------+----------+----------+-------------|
      92.   0  0     *
      93.   0  0    */
      94.   0  0    
      95.   0  0    union __wait {
      96.   0  0          unsigned int    w_status;
      97.   0  0          struct {
      98.   0  0                  unsigned int    w_Abend:1;
      99.   0  0                  unsigned int    w_Filler:15;
     100.   0  0                  unsigned int    w_Retcode:8;
     101.   0  0                  unsigned int    w_Coredump:1;
     102.   0  0                  unsigned int    w_Termsig:7;
     103.   0  0          } w_T;                                 /* exit, 8bit status */
     104.   0  0          struct {
     105.   0  0                  unsigned int    w_Filler:16;
     106.   0  0                  unsigned int    w_Stopsig:8;
     107.   0  0                  unsigned int    w_Stopval:8;
     108.   0  0          } w_S;                                 /* stopped  */
     109.   0  0          struct {
     110.   0  0                  unsigned int    w_Abend:1;
     111.   0  0                  unsigned int    w_Filler:7;
     112.   0  0                  unsigned int    w_Completion:16;
     113.   0  0                  unsigned int    w_Coredump:1;
     114.   0  0                  unsigned int    w_Termsig:7;
     115.   0  0          } w_A;                                 /* signaled, abended,
     116.   0  0                                                    exit 16bit stats */
Page 22   2026 June 11, 11:03:05        [3] C:\NonStop\L25.02\usr\include\sys/wait.h


     117.   0  0    };
     118.   0  0    #define __w_abend        w_T.w_Abend
     119.   0  0    #define __w_retcode      w_T.w_Retcode
     120.   0  0    #define __w_coredump     w_T.w_Coredump
     121.   0  0    #define __w_termsig      w_T.w_Termsig
     122.   0  0    #define __w_stopsig      w_S.w_Stopsig
     123.   0  0    #define __w_stopval      w_S.w_Stopval
     124.   0  0    #define __w_completion   w_A.w_Completion
     125.   0  0    #define __WSTOPPED       (unsigned)0177
     126.   0  0    
     127.   0  0    
     128.   0  0    #define WIFEXITED(x)                                                \
     129.   0  0          (((union __wait*)&(x))->__w_stopval != __WSTOPPED             \
     130.   0  0            && ((union __wait*)&(x))->__w_termsig == (unsigned)0)
     131.   0  0    #define WIFSIGNALED(x)                                              \
     132.   0  0          (((union __wait*)&(x))->__w_stopval != __WSTOPPED             \
     133.   0  0            && ((union __wait*)&(x))->__w_termsig != (unsigned)0)
     134.   0  0    #define WIFSTOPPED(x)                                               \
     135.   0  0          (((union __wait*)&(x))->__w_stopval == __WSTOPPED)
     136.   0  0    
     137.   0  0    #define WEXITSTATUS(x) (((union __wait*)&(x))->__w_retcode)
     138.   0  0    #define WSTOPSIG(x)    (((union __wait*)&(x))->__w_stopsig)
     139.   0  0    #define WTERMSIG(x)    (((union __wait*)&(x))->__w_termsig)
     140.   0  0    
     141. # 0  0    #ifdef _TANDEM_SOURCE
     142. # 0  0    #define WIFABENDED(x)                                               \
     143. # 0  0          (((union __wait*)&(x))->__w_stopval != __WSTOPPED             \
     144. # 0  0            && ((union __wait*)&(x))->__w_abend)
     145. # 0  0    #define WIFSAVEABEND(x)                                             \
     146. # 0  0          (((union __wait*)&(x))->__w_stopval != __WSTOPPED             \
     147. # 0  0            && ((union __wait*)&(x))->__w_coredump)
     148. # 0  0    
     149. # 0  0    #define WCOMPLETION(x) (((union __wait*)&(x))->__w_completion)
     150.   0  0    #endif /* _TANDEM_SOURCE */
     151.   0  0    
     152.   0  0    
     153. # 0  0    #ifdef __cplusplus
     154. # 0  0       }
     155.   0  0    #endif
     156.   0  0    #if _TANDEM_ARCH_ > 2
     157.   0  0    #pragma hpe_nonstop_standard_header_end
     158.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
     159.   0  0    
     160.   0  0    #endif  /* _SYSWAIT defined */
Source file:  [2] C:\NonStop\L25.02\usr\include\stdlib.h  2025-03-07 13:25:11
      60. # 0  0    #else
      61. # 0  0    #include <syswait.h> nolist
      62.   0  0    #endif /* _GUARDIAN_HOST */
      63.   0  0    #endif /* _XOPEN_SOURCE */
      64.   0  0    
      65.   0  0    #define EXIT_FAILURE    -1
      66.   0  0    #define EXIT_SUCCESS     0
      67.   0  0    #if _TANDEM_ARCH_ != 0 || defined(__INT32)
      68.   0  0    #define MB_CUR_MAX       __getmbcurmax()
      69.   0  0    int    __getmbcurmax(void);
      70. # 0  0    #else
      71. # 0  0    #define MB_CUR_MAX       2
      72.   0  0    #endif
      73.   0  0    
      74.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
      75.   0  0    #define RAND_MAX     2147483647
      76. # 0  0    #else
      77. # 0  0    #define RAND_MAX     32767
Page 23   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


      78.   0  0    #endif
      79.   0  0    
      80.   0  0    #ifdef __TANDEM
      81. # 0  0    #ifdef __LP64
      82. # 0  0    #pragma fieldalign platform div_t ldiv_t lldiv_t
      83.   0  0    #else  /* !__LP64 */
      84.   0  0    #pragma fieldalign shared8 div_t ldiv_t lldiv_t
      85.   0  0    #endif /* !__LP64 */
      86.   0  0    #endif
      87.   0  0    typedef struct div_t   { int  quot, rem; } div_t;
      88.   0  0    typedef struct ldiv_t  { long quot, rem; } ldiv_t;
      89.   0  0    typedef struct lldiv_t { long long quot, rem; } lldiv_t;
      90.   0  0    
      91. # 0  0    #ifndef __NOEXCEPT
      92. # 0  0    #if (__CPLUSPLUS_VERSION >= 4)
      93. # 0  0    #define __NOEXCEPT noexcept
      94. # 0  0    #elif (__CPLUSPLUS_VERSION == 3)
      95. # 0  0    #define __NOEXCEPT throw ()
      96. # 0  0    #else
      97. # 0  0    #define __NOEXCEPT
      98. # 0  0    #endif /* (__CPLUSPLUS_VERSION >= 4) */
      99.   0  0    #endif /* __NOEXCEPT */
     100.   0  0    
     101.   0  0    #ifndef __NORETURN
     102. # 0  0    #if (__CPLUSPLUS_VERSION >= 4)
     103. # 0  0    #define __NORETURN [[noreturn]]
     104. # 0  0    #elif (__STDC_VERSION__ >= 201112)
     105. # 0  0    #define __NORETURN _Noreturn
     106.   0  0    #else
     107.   0  0    #define __NORETURN
     108.   0  0    #endif /* (__CPLUSPLUS_VERSION >= 4) */
     109.   0  0    #endif /* __NORETURN */
     110.   0  0    
     111.   0  0    __NORETURN void abort(void) __NOEXCEPT;
     112.   0  0    
     113.   0  0    int    abs (int) __NOEXCEPT;
     114.   0  0    int    atexit (void (*)(void)) __NOEXCEPT;
     115.   0  0    void  *bsearch (const void *, const void *, size_t, size_t,
     116.   0  0                    int (*)(const void *, const void *));
     117.   0  0    void  *calloc (size_t, size_t) __NOEXCEPT;
     118.   0  0    div_t  div (int, int) __NOEXCEPT;
     119.   0  0    __NORETURN void   exit (int) __NOEXCEPT;
     120.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 608)
     121.   0  0    __NORETURN void  _Exit (int) __NOEXCEPT;
     122.   0  0    #pragma function  _Exit (alias("_exit"), unspecified)
     123.   0  0    #endif
     124.   0  0    char  *getenv (const char *) __NOEXCEPT;
     125.   0  0    long   labs (long) __NOEXCEPT;
     126.   0  0    ldiv_t ldiv (long, long) __NOEXCEPT;
     127.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 608)
     128.   0  0    long long llabs (long long) __NOEXCEPT;
     129.   0  0    #endif
     130.   0  0    #if _TANDEM_ARCH_ >= 1
     131.   0  0    lldiv_t lldiv (long long, long long) __NOEXCEPT;
     132.   0  0    #endif
     133.   0  0    void  *malloc (size_t) __NOEXCEPT;
     134.   0  0    #if _TANDEM_ARCH_ > 1
     135.   0  0    void  *malloc_pages (size_t) __NOEXCEPT;
     136.   0  0    #endif
     137.   0  0    int    mblen (const char *, size_t) __NOEXCEPT;
     138.   0  0    size_t mbstowcs (wchar_t *, const char *, size_t) __NOEXCEPT;
     139.   0  0    int    mbtowc (wchar_t *, const char *, size_t) __NOEXCEPT;
     140.   0  0    void   qsort (void *, size_t, size_t, int (*)(const void *, const void *));
Page 24   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     141.   0  0    int    rand (void) __NOEXCEPT;
     142.   0  0    void   srand (unsigned int) __NOEXCEPT;
     143.   0  0    double strtod (const char *, char **) __NOEXCEPT;
     144.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)
     145.   0  0    #pragma push warn
     146.   0  0    #pragma nowarn
     147.   0  0    long double strtold (const char *, char **) __NOEXCEPT;
     148.   0  0    #pragma function strtold  (alias("strtod"), unspecified)
     149.   0  0    #pragma pop warn
     150.   0  0    #endif
     151.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 608)
     152.   0  0    float  strtof (const char *, char **) __NOEXCEPT;
     153.   0  0    #endif
     154.   0  0    long   strtol (const char *, char **, int) __NOEXCEPT;
     155.   0  0    unsigned long strtoul (const char *, char **, int) __NOEXCEPT;
     156.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     157.   0  0    #if _TANDEM_ARCH_ > 1 || __G_Series_RVU >= 625
     158.   0  0    long long          strtoll (const char *, char **, int) __NOEXCEPT;
     159.   0  0    #endif /* G06.25 or later */
     160.   0  0    #if _TANDEM_ARCH_ > 1 || __G_Series_RVU >= 627 && __SQLCFE != 1
     161.   0  0    unsigned long long strtoull(const char *, char **, int) __NOEXCEPT;
     162.   0  0    #endif /* G06.27 or later and not SQLCFE */
     163.   0  0    #endif /* _TANDEM_ARCH_ != 0 */
     164.   0  0    int    system (const char *) __NOEXCEPT;
     165.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     166.   0  0    void  *valloc (size_t) __NOEXCEPT;
     167.   0  0    #endif
     168.   0  0    size_t wcstombs (char *, const wchar_t *, size_t) __NOEXCEPT;
     169.   0  0    int    wctomb (char *, wchar_t) __NOEXCEPT;
     170.   0  0    
     171.   0  0    #if (_TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)) \
     172.   0  0        && !defined(_SPT_MODEL_)
     173.   0  0    int    rand_r  (unsigned int *) __NOEXCEPT;
     174.   0  0    #endif /* _TANDEM_ARCH_ >= 2 && !_SPT_MODEL_ */
     175.   0  0    
     176.   0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     177.   0  0    double atof (const char *) __NOEXCEPT;
     178.   0  0    int    atoi (const char *) __NOEXCEPT;
     179.   0  0    long   atol (const char *) __NOEXCEPT;
     180.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     181.   0  0    long long atoll (const char *) __NOEXCEPT;
     182.   0  0    #endif
     183.   0  0    void   free (void *) __NOEXCEPT;
     184.   0  0    void  *realloc (void *, size_t) __NOEXCEPT;
     185. # 0  0    #else /* small model */
     186. # 0  0    double atof (const char _far *) __NOEXCEPT;
     187. # 0  0    int    atoi (const char _far *) __NOEXCEPT;
     188. # 0  0    long   atol (const char _far *) __NOEXCEPT;
     189. # 0  0    void   free (void _far *) __NOEXCEPT;
     190. # 0  0    void  *realloc (void _far *, size_t) __NOEXCEPT;
     191.   0  0    #endif /* !_GUARDIAN_TARGET || __XMEM */
     192.   0  0    
     193.   0  0    #if defined(_XOPEN_SOURCE) || defined(_TANDEM_SOURCE)
     194.   0  0    #if (_TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)) \
     195.   0  0        && !defined(_SPT_MODEL_)
     196.   0  0    int    getenv_r(const char *, char *, size_t) __NOEXCEPT;
     197.   0  0    #endif /* _TANDEM_ARCH_ >= 2 && !_SPT_MODEL_ */
     198.   0  0    #if _TANDEM_ARCH_ != 0 || defined(__INT32) || !defined(__TANDEM)
     199.   0  0    int    putenv  (const char *) __NOEXCEPT;   /* standard */
     200. # 0  0    #elif defined(__XMEM)
     201. # 0  0    long   putenv  (const char *) __NOEXCEPT;   /* large model */
     202.   0  0    #endif
     203. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0 && defined(__XMEM)
Page 25   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     204. # 0  0    #pragma function putenv (alias("CRE_PUTENV_"), unspecified)
     205.   0  0    #endif
     206.   0  0    #if (_TANDEM_ARCH_ > 3 || (_TANDEM_ARCH_ == 3 && __L_Series_RVU >= 2010))
     207.   0  0    int setenv(const char *envname, const char *envval, int overwrite) __NOEXCEPT;
     208.   0  0    int unsetenv(const char *name) __NOEXCEPT;
     209.   0  0    #endif /* (_TANDEM_ARCH_ > 3 || (_TANDEM_ARCH_ == 3 &&
     210.   0  0              __L_Series_RVU >= 2010)) */
     211.   0  0    #endif /* _XOPEN_SOURCE || _TANDEM_SOURCE */
     212.   0  0    
     213.   0  0    #ifdef _XOPEN_SOURCE
     214.   0  0    double   drand48 (void) __NOEXCEPT;
     215.   0  0    double   erand48 (unsigned short int *) __NOEXCEPT;    /* xsubi[3] */
     216.   0  0    long int jrand48 (unsigned short int *) __NOEXCEPT;    /* xsubi[3] */
     217.   0  0    long int lrand48 (void) __NOEXCEPT;
     218.   0  0    long int mrand48 (void) __NOEXCEPT;
     219.   0  0    long int nrand48 (unsigned short int *) __NOEXCEPT;    /* xsubi[3] */
     220.   0  0    void     srand48 (long int) __NOEXCEPT;
     221.   0  0    
     222.   0  0    void     lcong48 (unsigned short int *) __NOEXCEPT;    /* param[7] */
     223.   0  0    unsigned short int *seed48 (unsigned short int *) __NOEXCEPT; /* seed16v[3] */
     224.   0  0    void     setkey  (const char *) __NOEXCEPT;   /* not supported */
     225.   0  0    #endif /* _XOPEN_SOURCE */
     226.   0  0    
     227.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     228. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1
     229. # 0  0    long   a64l(const char *) __NOEXCEPT;
     230. # 0  0    char  *fcvt(double, int, int *, int *) __NOEXCEPT;
     231. # 0  0    char  *gcvt(double, int, char *) __NOEXCEPT;
     232. # 0  0    int    getsubopt(char **, char * const *, char **) __NOEXCEPT;
     233. # 0  0    char  *initstate(unsigned int, char *, size_t) __NOEXCEPT;
     234. # 0  0    char  *l64a(long) __NOEXCEPT;
     235. # 0  0    char  *mktemp(char *) __NOEXCEPT;
     236. # 0  0    int    mkstemp(char *) __NOEXCEPT;
     237. # 0  0    long   random(void) __NOEXCEPT;
     238. # 0  0    char  *realpath(const char *, char *) __NOEXCEPT;
     239. # 0  0    char  *setstate(const char *) __NOEXCEPT;
     240. # 0  0    void   srandom(unsigned int) __NOEXCEPT;
     241.   0  0    #endif /* _XOPEN_SOURCE_EXTENDED == 1 */
     242. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1 || defined(_TANDEM_SOURCE)
     243. # 0  0    char  *ecvt(double, int, int *, int *) __NOEXCEPT;
     244.   0  0    #endif /* _XOPEN_SOURCE_EXTENDED == 1 || _TANDEM_SOURCE */
     245.   0  0    #endif /* _TANDEM_ARCH_ != 0 || !__TANDEM */
     246.   0  0    
     247.   0  0    #if _TANDEM_ARCH_ >= 3 && __L_Series_RVU >= 1605 &&  \
     248. # 0  0        ((__STDC_VERSION__ >= 201112) || (__CPLUSPLUS_VERSION >= 4))
     249. # 0  0    /* C11 */
     250. # 0  0    void *aligned_alloc(size_t alignment, size_t size) __NOEXCEPT;
     251. # 0  0    int at_quick_exit(void (*func)(void)) __NOEXCEPT;
     252. # 0  0    __NORETURN void quick_exit(int status)__NOEXCEPT;
     253.   0  0    #endif
     254.   0  0    
     255. # 0  0    #ifdef _TANDEM_SOURCE
     256. # 0  0    
     257. # 0  0    #define _abs(x)   ((x) < 0 ? -(x) : (x))
     258. # 0  0    #ifdef __NSK_BOOST_VERSION__
     259. # 0  0    #define __max(x, y)  ((x) > (y) ? (x) : (y))
     260. # 0  0    #define __min(x, y)  ((x) < (y) ? (x) : (y))
     261. # 0  0    #else
     262. # 0  0    #define _max(x, y)  ((x) > (y) ? (x) : (y))
     263. # 0  0    #define _min(x, y)  ((x) < (y) ? (x) : (y))
     264. # 0  0    #endif
     265. # 0  0    
     266. # 0  0    void  heap_check (void) __NOEXCEPT;
Page 26   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     267. # 0  0    void  heap_check_always (int) __NOEXCEPT;
     268. # 0  0    void  heap_min_block_size (long) __NOEXCEPT;
     269. # 0  0    #if _TANDEM_ARCH_ == 0
     270. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     271. # 0  0    char *ecvt (double, short, short *, short *) __NOEXCEPT;
     272. # 0  0    #else /* small model */
     273. # 0  0    char *ecvt (double, short, short _far *, short _far *) __NOEXCEPT;
     274. # 0  0    #endif /* !_GUARDIAN_TARGET || __XMEM */
     275. # 0  0    int   stcd_i (char *, int *) __NOEXCEPT;
     276. # 0  0    int   stcd_l (char *, long *) __NOEXCEPT;
     277. # 0  0    int   stch_i (char *, int *) __NOEXCEPT;
     278. # 0  0    int   stci_d (char *, int, int) __NOEXCEPT;
     279. # 0  0    int   stcu_d (char *, unsigned int, int) __NOEXCEPT;
     280. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     281. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     282. # 0  0    __NORETURN void terminate_program (short, short, short, short, short *, 
     283. # 0  0                            char *, short) __NOEXCEPT;
     284. # 0  0    #else /* small model */
     285. # 0  0    void terminate_program \
     286. # 0  0              (short, short, short, short, short _far *, char _far *, short);
     287. # 0  0    #endif /* !_GUARDIAN_TARGET || __XMEM */
     288. # 0  0    
     289. # 0  0    #ifdef __LP64
     290. # 0  0    void _ptr32 *calloc32  ( unsigned int, unsigned int ) __NOEXCEPT;
     291. # 0  0    void         free32    ( void _ptr32 * ) __NOEXCEPT;
     292. # 0  0    void _ptr32 *malloc32  ( unsigned int ) __NOEXCEPT;
     293. # 0  0    void _ptr32 *realloc32 ( void _ptr32 *, unsigned int ) __NOEXCEPT;
     294. # 0  0    void         heap_check32 ( void ) __NOEXCEPT;
     295. # 0  0    void         heap_check_always32 ( int ) __NOEXCEPT;
     296. # 0  0    #endif /* __LP64 */
     297. # 0  0    
     298. # 0  0    #ifdef __TANDEM
     299. # 0  0    #pragma fieldalign shared8 CRE_RFOA
     300. # 0  0    #endif
     301. # 0  0    /*  Receive file open attributes template  */
     302. # 0  0    typedef struct CRE_RFOA {
     303. # 0  0       short maximum_requesters;      /* Maximum requesters supported        */
     304. # 0  0       short maximum_syncdepth;       /* Maximum saved replies per requester */
     305. # 0  0       short maximum_reply;           /* Maximum bytes in saved reply        */
     306. # 0  0       short receive_depth;           /* Maximum server queue depth          */
     307. # 0  0       short report_flags[4];         /* Report system message flags         */
     308. # 0  0       short filler;                  /* Reserved (must be 0)                */
     309. # 0  0    } CRE_RFOA;
     310. # 0  0    
     311. # 0  0    /*  Masks for report_flags[0]  */
     312. # 0  0    #define CRE_cpu_down_mask             0040000   /* System message   -2 */
     313. # 0  0    #define CRE_cpu_up_mask               0020000   /* System message   -3 */
     314. # 0  0    #define CRE_settime_mask              0010000   /* System message  -10 */
     315. # 0  0    #define CRE_power_on_mask             0004000   /* System message  -11 */
     316. # 0  0    #define CRE_NEWPROCESSNOWAIT_mask     0002000   /* System message  -12 */
     317. # 0  0    #define CRE_message_missed_mask       0001000   /* System message  -13 */
     318. # 0  0    #define CRE_3270_status_mask          0000100   /* System message  -21 */
     319. # 0  0    #define CRE_SIGNALTIMEOUT_mask        0000040   /* System message  -22 */
     320. # 0  0    #define CRE_LOCKMEMORY_done_mask      0000020   /* System message  -23 */
     321. # 0  0    #define CRE_LOCKMEMORY_failed_mask    0000010   /* System message  -24 */
     322. # 0  0    #define CRE_PROCSIGNALTIMEOUT_mask    0000002   /* System message  -26 */
     323. # 0  0    /*  Masks for report_flags[1]  */
     324. # 0  0    #define CRE_CONTROL_mask              0100000   /* System message  -32 */
     325. # 0  0    #define CRE_SETMODE_mask              0040000   /* System message  -33 */
     326. # 0  0    #define CRE_RESETSYNC_mask            0020000   /* System message  -34 */
     327. # 0  0    #define CRE_CONTROLBUF_mask           0010000   /* System message  -35 */
     328. # 0  0    #define CRE_SETPARAM_mask             0002000   /* System message  -37 */
     329. # 0  0    #define CRE_message_cancelled_mask    0001000   /* System message  -38 */
Page 27   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     330. # 0  0    #define CRE_DEVICEINFO2_mask          0000100   /* System message  -41 */
     331. # 0  0    #define CRE_logical_close_mask        0000002
     332. # 0  0    #define CRE_logical_open_mask         0000001
     333. # 0  0    /*  Masks for report_flags[2]  */
     334. # 0  0    #define CRE_remote_cpu_down_mask      0100000   /* System message -100 */
     335. # 0  0    #define CRE_process_deleted_mask      0040000   /* System message -101 */
     336. # 0  0    #define CRE_PROCESS_CREATE_mask       0020000   /* System message -102 */
     337. # 0  0    #define CRE_OPEN_mask                 0010000   /* System message -103 */
     338. # 0  0    #define CRE_CLOSE_mask                0004000   /* System message -104 */
     339. # 0  0    #define CRE_break_mask                0002000   /* System message -105 */
     340. # 0  0    #define CRE_devinfo_query_mask        0001000   /* System message -106 */
     341. # 0  0    #define CRE_subname_mask              0000400   /* System message -107 */
     342. # 0  0    #define CRE_FILE_GETINFO__mask        0000200   /* System message -108 */
     343. # 0  0    #define CRE_FILENAME_FINDNEXT_mask    0000100   /* System message -109 */
     344. # 0  0    #define CRE_node_down_mask            0000040   /* System message -110 */
     345. # 0  0    #define CRE_node_up_mask              0000020   /* System message -111 */
     346. # 0  0    #define CRE_GMOM_notify_mask          0000010   /* System message -112 */
     347. # 0  0    #define CRE_remote_cpu_up_mask        0000004   /* System message -113 */
     348. # 0  0    /*  Masks for report_flags[3]  */
     349. # 0  0    #define CRE_pathsend_dialog_abort_mask 0002000  /* System message -121 */
     350. # 0  0    
     351. # 0  0    #ifdef __TANDEM
     352. # 0  0    #pragma fieldalign shared8 CRE_sender
     353. # 0  0    #endif
     354. # 0  0    /*  Receive message sender info template  */
     355. # 0  0    typedef struct CRE_sender {
     356. # 0  0       short system_flag;             /* -1 if system message, 0 otherwise */
     357. # 0  0       short entry_number;            /* Requester number for sender       */
     358. # 0  0       short message_number;          /* CRE message number                */
     359. # 0  0       short file_number;             /* Guardian open number for sender   */
     360. # 0  0       short phandle[10];             /* Process handle of sender          */
     361. # 0  0       short read_count;              /* Maximum size for reply text       */
     362. # 0  0       short pathsend_dialog_info;    /* PATHSEND dialog info              */
     363. # 0  0    } CRE_sender;
     364. # 0  0    
     365. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0
     366. # 0  0    short CRE_RECEIVE_OPEN_CLOSE_(short, CRE_RFOA *, long _near *) __NOEXCEPT;
     367. # 0  0    #else
     368. # 0  0    short CRE_RECEIVE_OPEN_CLOSE_(short, CRE_RFOA *, long *) __NOEXCEPT;
     369. # 0  0    #endif
     370. # 0  0    short CRE_RECEIVE_READ_ (char *, short, short *, long, 
     371. # 0  0                             CRE_sender *, short) __NOEXCEPT;
     372. # 0  0    short CRE_RECEIVE_WRITE_(char *, short, short, short) __NOEXCEPT;
     373. # 0  0    
     374. # 0  0    #ifdef __TANDEM
     375. # 0  0    #pragma fieldalign shared2 startup_msg_type
     376. # 0  0    #pragma fieldalign shared2 assign_msg_type
     377. # 0  0    #pragma fieldalign shared2 param_msg_type
     378. # 0  0    #endif
     379. # 0  0    
     380. # 0  0    /* Guardian STARTUP message format */
     381. # 0  0    typedef struct startup_msg_type
     382. # 0  0       {
     383. # 0  0         short msg_code;
     384. # 0  0         union
     385. # 0  0             { char   whole[16];
     386. # 0  0               struct
     387. # 0  0                 { char volume[8];
     388. # 0  0                   char subvolume[8];
     389. # 0  0                 }    parts;
     390. # 0  0             } defaults;
     391. # 0  0         union
     392. # 0  0             { char   whole[24];
Page 28   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     393. # 0  0               struct
     394. # 0  0                 { char volume[8];
     395. # 0  0                   char subvolume[8];
     396. # 0  0                   char file[8];
     397. # 0  0                 }    parts;
     398. # 0  0             } infile;
     399. # 0  0         union
     400. # 0  0             { char   whole[24];
     401. # 0  0               struct
     402. # 0  0                 { char volume[8];
     403. # 0  0                   char subvolume[8];
     404. # 0  0                   char file[8];
     405. # 0  0                 }    parts;
     406. # 0  0             } outfile;
     407. # 0  0         char  param[530];
     408. # 0  0       } startup_msg_type;
     409. # 0  0    
     410. # 0  0    /* Guardian ASSIGN message format */
     411. # 0  0    typedef struct assign_msg_type
     412. # 0  0       {
     413. # 0  0         short  msg_code;
     414. # 0  0         struct
     415. # 0  0             {
     416. # 0  0                char prognamelen;
     417. # 0  0                char progname[31];
     418. # 0  0                char filenamelen;
     419. # 0  0                char filename[31];
     420. # 0  0             }  logical_unit_name;
     421. # 0  0    #ifdef __LP64
     422. # 0  0         unsigned int field_mask;
     423. # 0  0    #else  /* !__LP64 */
     424. # 0  0         unsigned long field_mask;
     425. # 0  0    #endif /* !__LP64 */
     426. # 0  0         union
     427. # 0  0             { char   whole[24];
     428. # 0  0               struct
     429. # 0  0                 { char volume[8];
     430. # 0  0                   char subvolume[8];
     431. # 0  0                   char file[8];
     432. # 0  0                 }    parts;
     433. # 0  0             }  filename;
     434. # 0  0         short  primary_extent;
     435. # 0  0         short  secondary_extent;
     436. # 0  0         short  file_code;
     437. # 0  0         short  exclusion_spec;
     438. # 0  0         short  access_spec;
     439. # 0  0         short  record_size;
     440. # 0  0         short  block_size;
     441. # 0  0       } assign_msg_type;
     442. # 0  0    
     443. # 0  0    /* Guardian PARAM message format */
     444. # 0  0    typedef struct param_msg_type
     445. # 0  0       {
     446. # 0  0         short  msg_code;
     447. # 0  0         short  num_params;
     448. # 0  0         char   parameters[1024];
     449. # 0  0       } param_msg_type;
     450. # 0  0    
     451. # 0  0    #ifdef _GUARDIAN_TARGET
     452. # 0  0    short get_max_assign_msg_ordinal (void) __NOEXCEPT;
     453. # 0  0    #ifdef __XMEM
     454. # 0  0    short get_assign_msg (short, assign_msg_type *) __NOEXCEPT;
     455. # 0  0    short get_assign_msg_by_name (char *, assign_msg_type *) __NOEXCEPT;
Page 29   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     456. # 0  0    short get_param_msg(param_msg_type *, short *) __NOEXCEPT;
     457. # 0  0    short get_param_by_name(char *, char *, short) __NOEXCEPT;
     458. # 0  0    short get_startup_msg (startup_msg_type *, short *) __NOEXCEPT;
     459. # 0  0    #else /* small model */
     460. # 0  0    short get_assign_msg (short, assign_msg_type _far *) __NOEXCEPT;
     461. # 0  0    short get_assign_msg_by_name (char _far *, assign_msg_type _far *) __NOEXCEPT;
     462. # 0  0    short get_param_msg (param_msg_type _far *, short _far *) __NOEXCEPT;
     463. # 0  0    short get_param_by_name (char _far *, char _far *, short) __NOEXCEPT;
     464. # 0  0    short get_startup_msg (startup_msg_type _far *, short _far *) __NOEXCEPT;
     465. # 0  0    #endif /* __XMEM */
     466. # 0  0    #if _TANDEM_ARCH_ == 0
     467. # 0  0    void trap_overflows (short) __NOEXCEPT;
     468. # 0  0    #endif
     469. # 0  0    #endif /* _GUARDIAN_TARGET */
     470. # 0  0    
     471.   0  0    #endif /* _TANDEM_SOURCE */
     472.   0  0    
     473.   0  0    /*
     474.   0  0     * TNS C aliases and attributes
     475.   0  0     */
     476. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0
     477. # 0  0    
     478. # 0  0    /*  This header file has a different structure than others because many
     479. # 0  0     *  functions have both "check" and "nocheck" variants and many others
     480. # 0  0     *  don't.  Consequently, the 'aliases and attributes' repository here
     481. # 0  0     *  has one section for functions with "check" and "nocheck" variants
     482. # 0  0     *  and a different section for the functions without these variants.
     483. # 0  0     */
     484. # 0  0    
     485. # 0  0    #ifdef _GUARDIAN_TARGET
     486. # 0  0    /*
     487. # 0  0     * This section is for functions WITHOUT the "check" and "nocheck" variants
     488. # 0  0     */
     489. # 0  0    #ifdef __XMEM
     490. # 0  0    #ifdef __INT32
     491. # 0  0    /*
     492. # 0  0     * Wide Model
     493. # 0  0     */
     494. # 0  0    #pragma function abs                   (alias("RTL_ABSVAL_INT32_"        ),tal)
     495. # 0  0    #pragma function atexit                (alias("C_LG_ATEXIT_32_"          ),tal)
     496. # 0  0    #pragma function atof                  (alias("RTL_ATOF_"                ),tal)
     497. # 0  0    #pragma function atoi                  (alias("RTL_ATOL_"                ),tal)
     498. # 0  0    #pragma function atol                  (alias("RTL_ATOL_"                ),tal)
     499. # 0  0    #pragma function exit                  (alias("C_EXIT_32_"               ),tal)
     500. # 0  0    #pragma function getenv                (alias("CRE_GETENV_"),      unspecified)
     501. # 0  0    #pragma function labs                  (alias("RTL_ABSVAL_INT32_"        ),tal)
     502. # 0  0    #pragma function rand                  (alias("CRE_RANDOM_NEXT_32_"      ),tal)
     503. # 0  0    #pragma function srand                 (alias("CRE_RANDOM_SET_32_"       ),tal)
     504. # 0  0    #pragma function system                (alias("C_LG_SYSTEM_32_"          ),tal)
     505. # 0  0    #ifdef _TANDEM_SOURCE
     506. # 0  0    #pragma function ecvt                  (alias("RTL_ECVTX_"               ),tal)
     507. # 0  0    #pragma function heap_check            (alias("C_HEAP_CHECK_"            ),tal)
     508. # 0  0    #pragma function heap_check_always     (alias("C_HEAP_CHECK_ALWAYS_32_"  ),tal)
     509. # 0  0    #pragma function heap_min_block_size   (alias("C_HEAP_MIN_BLOCKSIZE_"    ),tal)
     510. # 0  0    #endif /* _TANDEM_SOURCE */
     511. # 0  0    
     512. # 0  0    #else
     513. # 0  0    /*
     514. # 0  0     * Large Model
     515. # 0  0     */
     516. # 0  0    #pragma function abs                   (alias("RTL_ABSVAL_INT16_"        ),tal)
     517. # 0  0    #pragma function atexit                (alias("C_LG_ATEXIT_"             ),tal)
     518. # 0  0    #pragma function atof                  (alias("RTL_ATOF_"                ),tal)
Page 30   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     519. # 0  0    #pragma function atoi                  (alias("RTL_ATOI_"                ),tal)
     520. # 0  0    #pragma function atol                  (alias("RTL_ATOL_"                ),tal)
     521. # 0  0    #pragma function exit                  (alias("C_EXIT_"                  ),tal)
     522. # 0  0    #pragma function getenv                (alias("CRE_GETENV_"),      unspecified)
     523. # 0  0    #pragma function labs                  (alias("RTL_ABSVAL_INT32_"        ),tal)
     524. # 0  0    #pragma function rand                  (alias("CRE_RANDOM_NEXT_"         ),tal)
     525. # 0  0    #pragma function srand                 (alias("CRE_RANDOM_SET_"          ),tal)
     526. # 0  0    #pragma function system                (alias("C_LG_SYSTEM_"             ),tal)
     527. # 0  0    #ifdef _TANDEM_SOURCE
     528. # 0  0    #pragma function ecvt                  (alias("RTL_ECVTX_"               ),tal)
     529. # 0  0    #pragma function heap_check            (alias("C_HEAP_CHECK_"            ),tal)
     530. # 0  0    #pragma function heap_check_always     (alias("C_HEAP_CHECK_ALWAYS_"     ),tal)
     531. # 0  0    #pragma function heap_min_block_size   (alias("C_HEAP_MIN_BLOCKSIZE_"    ),tal)
     532. # 0  0    #endif /* _TANDEM_SOURCE */
     533. # 0  0    #endif
     534. # 0  0    #else
     535. # 0  0    /*
     536. # 0  0     * Small Model
     537. # 0  0     */
     538. # 0  0    #pragma function abs                   (alias("RTL_ABSVAL_INT16_"    ),tal)
     539. # 0  0    #pragma function atexit                (alias("C_SM_ATEXIT_"         ),tal)
     540. # 0  0    #pragma function atof                  (alias("RTL_ATOF_"),            tal)
     541. # 0  0    #pragma function atoi                  (alias("RTL_ATOI_"),            tal)
     542. # 0  0    #pragma function atol                  (alias("RTL_ATOL_"),            tal)
     543. # 0  0    #pragma function ecvt                  (alias("RTL_ECVT_"),            tal)
     544. # 0  0    #pragma function exit                  (alias("C_EXIT_"              ),tal)
     545. # 0  0    #pragma function getenv                (alias("C_SM_GETENV_"         ),tal)
     546. # 0  0    #pragma function heap_check            (alias("C_HEAP_CHECK_"        ),tal)
     547. # 0  0    #pragma function heap_check_always     (alias("C_HEAP_CHECK_ALWAYS_" ),tal)
     548. # 0  0    #pragma function heap_min_block_size   (alias("C_HEAP_MIN_BLOCKSIZE_"),tal)
     549. # 0  0    #pragma function labs                  (alias("RTL_ABSVAL_INT32_"    ),tal)
     550. # 0  0    #pragma function rand                  (alias("CRE_RANDOM_NEXT_"     ),tal)
     551. # 0  0    #pragma function srand                 (alias("CRE_RANDOM_SET_"      ),tal)
     552. # 0  0    #pragma function system                (alias("C_SM_SYSTEM_"         ),tal)
     553. # 0  0    #endif /* __XMEM */
     554. # 0  0    
     555. # 0  0    /*
     556. # 0  0     * This section is for functions WITH the "check" and "nocheck" variants
     557. # 0  0     */
     558. # 0  0    #ifdef __CHECK
     559. # 0  0    
     560. # 0  0    #ifdef __XMEM
     561. # 0  0    #ifdef __INT32
     562. # 0  0    /*
     563. # 0  0     * Wide Checked Model
     564. # 0  0     */
     565. # 0  0    #pragma function calloc                (alias("C_LG_CK_CALLOC_"      ),tal)
     566. # 0  0    #pragma function free                  (alias("C_CK_FREE_"           ),tal)
     567. # 0  0    #pragma function malloc                (alias("C_LG_CK_MALLOC_"      ),tal)
     568. # 0  0    #pragma function realloc               (alias("C_LG_CK_REALLOC_"     ),tal)
     569. # 0  0    #pragma function strtod                (alias("CRE_CK_STRTODX_"      ),tal)
     570. # 0  0    #pragma function strtol                (alias("CRE_CK_STRTOLX_32_"   ),tal)
     571. # 0  0    #pragma function strtoul               (alias("CRE_CK_STRTOULX_32_"  ),tal)
     572. # 0  0    #ifdef _TANDEM_SOURCE
     573. # 0  0    #pragma function stcd_i                (alias("CRE_CK_STCD_LX_32_"   ),tal)
     574. # 0  0    #pragma function stcd_l                (alias("CRE_CK_STCD_LX_32_"   ),tal)
     575. # 0  0    #pragma function stch_i                (alias("CRE_CK_STCH_IX_32_"   ),tal)
     576. # 0  0    #pragma function stci_d                (alias("CRE_CK_STCI_DX_32_"   ),tal)
     577. # 0  0    #pragma function stcu_d                (alias("CRE_CK_STCU_DX_32_"   ),tal)
     578. # 0  0    #endif /* _TANDEM_SOURCE */
     579. # 0  0    #else
     580. # 0  0    /*
     581. # 0  0     * Large Checked Model
Page 31   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     582. # 0  0     */
     583. # 0  0    #pragma function calloc                (alias("C_LG_CK_CALLOC_"      ),tal)
     584. # 0  0    #pragma function free                  (alias("C_CK_FREE_"           ),tal)
     585. # 0  0    #pragma function malloc                (alias("C_LG_CK_MALLOC_"      ),tal)
     586. # 0  0    #pragma function realloc               (alias("C_LG_CK_REALLOC_"     ),tal)
     587. # 0  0    #pragma function strtod                (alias("CRE_CK_STRTODX_"      ),tal)
     588. # 0  0    #pragma function strtol                (alias("CRE_CK_STRTOLX_"      ),tal)
     589. # 0  0    #pragma function strtoul               (alias("CRE_CK_STRTOULX_"     ),tal)
     590. # 0  0    #ifdef _TANDEM_SOURCE
     591. # 0  0    #pragma function stcd_i                (alias("CRE_CK_STCD_IX_"      ),tal)
     592. # 0  0    #pragma function stcd_l                (alias("CRE_CK_STCD_LX_"      ),tal)
     593. # 0  0    #pragma function stch_i                (alias("CRE_CK_STCH_IX_"      ),tal)
     594. # 0  0    #pragma function stci_d                (alias("CRE_CK_STCI_DX_"      ),tal)
     595. # 0  0    #pragma function stcu_d                (alias("CRE_CK_STCU_DX_"      ),tal)
     596. # 0  0    #endif /* _TANDEM_SOURCE */
     597. # 0  0    #endif
     598. # 0  0    #else
     599. # 0  0    /*
     600. # 0  0     * Small Checked Model
     601. # 0  0     */
     602. # 0  0    #pragma function calloc                (alias("C_SM_CK_CALLOC_"      ),tal)
     603. # 0  0    #pragma function free                  (alias("C_CK_FREE_"           ),tal)
     604. # 0  0    #pragma function malloc                (alias("C_SM_CK_MALLOC_"      ),tal)
     605. # 0  0    #pragma function realloc               (alias("C_SM_CK_REALLOC_"     ),tal)
     606. # 0  0    #pragma function strtod                (alias("CRE_CK_STRTOD_"       ),tal)
     607. # 0  0    #pragma function strtol                (alias("CRE_CK_STRTOL_"       ),tal)
     608. # 0  0    #pragma function strtoul               (alias("CRE_CK_STRTOUL_"      ),tal)
     609. # 0  0    #pragma function stcd_i                (alias("CRE_CK_STCD_I_"       ),tal)
     610. # 0  0    #pragma function stcd_l                (alias("CRE_CK_STCD_L_"       ),tal)
     611. # 0  0    #pragma function stch_i                (alias("CRE_CK_STCH_I_"       ),tal)
     612. # 0  0    #pragma function stci_d                (alias("CRE_CK_STCI_D_"       ),tal)
     613. # 0  0    #pragma function stcu_d                (alias("CRE_CK_STCU_D_"       ),tal)
     614. # 0  0    #endif /* __XMEM */
     615. # 0  0    
     616. # 0  0    #else
     617. # 0  0    
     618. # 0  0    #ifdef __XMEM
     619. # 0  0    #ifdef __INT32
     620. # 0  0    /*
     621. # 0  0     * Wide Unchecked Model
     622. # 0  0     */
     623. # 0  0    #pragma function calloc                (alias("C_LG_CALLOC_"         ),tal)
     624. # 0  0    #pragma function free                  (alias("C_FREE_"              ),tal)
     625. # 0  0    #pragma function malloc                (alias("C_LG_MALLOC_"         ),tal)
     626. # 0  0    #pragma function realloc               (alias("C_LG_REALLOC_"        ),tal)
     627. # 0  0    #pragma function strtod                (alias("CRE_STRTODX_"         ),tal)
     628. # 0  0    #pragma function strtol                (alias("CRE_STRTOLX_32_"      ),tal)
     629. # 0  0    #pragma function strtoul               (alias("CRE_STRTOULX_32_"     ),tal)
     630. # 0  0    #ifdef _TANDEM_SOURCE
     631. # 0  0    #pragma function stcd_i                (alias("RTL_STCD_LX_32_"      ),tal)
     632. # 0  0    #pragma function stcd_l                (alias("RTL_STCD_LX_32_"      ),tal)
     633. # 0  0    #pragma function stch_i                (alias("RTL_STCH_IX_32_"      ),tal)
     634. # 0  0    #pragma function stci_d                (alias("RTL_STCI_DX_32_"      ),tal)
     635. # 0  0    #pragma function stcu_d                (alias("RTL_STCU_DX_32_"      ),tal)
     636. # 0  0    #endif /* _TANDEM_SOURCE */
     637. # 0  0    #else
     638. # 0  0    /*
     639. # 0  0     * Large Unchecked Model
     640. # 0  0     */
     641. # 0  0    #pragma function calloc                (alias("C_LG_CALLOC_"         ),tal)
     642. # 0  0    #pragma function free                  (alias("C_FREE_"              ),tal)
     643. # 0  0    #pragma function malloc                (alias("C_LG_MALLOC_"         ),tal)
     644. # 0  0    #pragma function realloc               (alias("C_LG_REALLOC_"        ),tal)
Page 32   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     645. # 0  0    #pragma function strtod                (alias("CRE_STRTODX_"         ),tal)
     646. # 0  0    #pragma function strtol                (alias("CRE_STRTOLX_"         ),tal)
     647. # 0  0    #pragma function strtoul               (alias("CRE_STRTOULX_"        ),tal)
     648. # 0  0    #ifdef _TANDEM_SOURCE
     649. # 0  0    #pragma function stcd_i                (alias("RTL_STCD_IX_"         ),tal)
     650. # 0  0    #pragma function stcd_l                (alias("RTL_STCD_LX_"         ),tal)
     651. # 0  0    #pragma function stch_i                (alias("RTL_STCH_IX_"         ),tal)
     652. # 0  0    #pragma function stci_d                (alias("RTL_STCI_DX_"         ),tal)
     653. # 0  0    #pragma function stcu_d                (alias("RTL_STCU_DX_"         ),tal)
     654. # 0  0    #endif /* _TANDEM_SOURCE */
     655. # 0  0    #endif
     656. # 0  0    #else
     657. # 0  0    /*
     658. # 0  0     * Small Unchecked Model
     659. # 0  0     */
     660. # 0  0    #pragma function calloc                (alias("C_SM_CALLOC_"         ),tal)
     661. # 0  0    #pragma function free                  (alias("C_FREE_"              ),tal)
     662. # 0  0    #pragma function malloc                (alias("C_SM_MALLOC_"         ),tal)
     663. # 0  0    #pragma function realloc               (alias("C_SM_REALLOC_"        ),tal)
     664. # 0  0    #pragma function strtod                (alias("CRE_STRTOD_"          ),tal)
     665. # 0  0    #pragma function strtol                (alias("CRE_STRTOL_"          ),tal)
     666. # 0  0    #pragma function strtoul               (alias("CRE_STRTOUL_"         ),tal)
     667. # 0  0    #pragma function stcd_i                (alias("RTL_STCD_I_"          ),tal)
     668. # 0  0    #pragma function stcd_l                (alias("RTL_STCD_L_"          ),tal)
     669. # 0  0    #pragma function stch_i                (alias("RTL_STCH_I_"          ),tal)
     670. # 0  0    #pragma function stci_d                (alias("RTL_STCI_D_"          ),tal)
     671. # 0  0    #pragma function stcu_d                (alias("RTL_STCU_D_"          ),tal)
     672. # 0  0    #endif /* __XMEM */
     673. # 0  0    #endif /* __CHECK */
     674. # 0  0    #else
     675. # 0  0    /*
     676. # 0  0     * OSS
     677. # 0  0     */
     678. # 0  0    #pragma function abs                   (alias("RTL_ABSVAL_INT32_"    ),tal)
     679. # 0  0    #pragma function atexit                (alias("C_LG_ATEXIT_32_"      ),tal)
     680. # 0  0    #pragma function atof                  (alias("RTL_ATOF_"            ),tal)
     681. # 0  0    #pragma function atoi                  (alias("RTL_ATOL_"            ),tal)
     682. # 0  0    #pragma function atol                  (alias("RTL_ATOL_"            ),tal)
     683. # 0  0    #pragma function exit                  (alias("C_EXIT_32_"           ),tal)
     684. # 0  0    #pragma function getenv                (alias("CRE_GETENV_"),  unspecified)
     685. # 0  0    #pragma function labs                  (alias("RTL_ABSVAL_INT32_"    ),tal)
     686. # 0  0    #pragma function rand                  (alias("CRE_RANDOM_NEXT_32_"  ),tal)
     687. # 0  0    #pragma function srand                 (alias("CRE_RANDOM_SET_32_"   ),tal)
     688. # 0  0    #pragma function system                (alias("_C_PX_system_"), unspecified)
     689. # 0  0    #ifdef _TANDEM_SOURCE
     690. # 0  0    #pragma function ecvt                  (alias("RTL_ECVTX_"               ),tal)
     691. # 0  0    #pragma function heap_check            (alias("C_HEAP_CHECK_"            ),tal)
     692. # 0  0    #pragma function heap_check_always     (alias("C_HEAP_CHECK_ALWAYS_32_"  ),tal)
     693. # 0  0    #pragma function heap_min_block_size   (alias("C_HEAP_MIN_BLOCKSIZE_"    ),tal)
     694. # 0  0    #endif /* _TANDEM_SOURCE */
     695. # 0  0    #ifndef __CHECK
     696. # 0  0    #pragma function calloc                (alias("C_LG_CALLOC_"         ),tal)
     697. # 0  0    #pragma function free                  (alias("C_FREE_"              ),tal)
     698. # 0  0    #pragma function malloc                (alias("C_LG_MALLOC_"         ),tal)
     699. # 0  0    #pragma function realloc               (alias("C_LG_REALLOC_"        ),tal)
     700. # 0  0    #pragma function strtod                (alias("CRE_STRTODX_"         ),tal)
     701. # 0  0    #pragma function strtol                (alias("CRE_STRTOLX_32_"      ),tal)
     702. # 0  0    #pragma function strtoul               (alias("CRE_STRTOULX_32_"     ),tal)
     703. # 0  0    #ifdef _TANDEM_SOURCE
     704. # 0  0    #pragma function stcd_i                (alias("RTL_STCD_LX_32_"      ),tal)
     705. # 0  0    #pragma function stcd_l                (alias("RTL_STCD_LX_32_"      ),tal)
     706. # 0  0    #pragma function stch_i                (alias("RTL_STCH_IX_32_"      ),tal)
     707. # 0  0    #pragma function stci_d                (alias("RTL_STCI_DX_32_"      ),tal)
Page 33   2026 June 11, 11:03:05        [2] C:\NonStop\L25.02\usr\include\stdlib.h


     708. # 0  0    #pragma function stcu_d                (alias("RTL_STCU_DX_32_"      ),tal)
     709. # 0  0    #endif /* _TANDEM_SOURCE */
     710. # 0  0    #else   /* __CHECK */
     711. # 0  0    #pragma function calloc                (alias("C_LG_CK_CALLOC_"      ),tal)
     712. # 0  0    #pragma function free                  (alias("C_CK_FREE_"           ),tal)
     713. # 0  0    #pragma function malloc                (alias("C_LG_CK_MALLOC_"      ),tal)
     714. # 0  0    #pragma function realloc               (alias("C_LG_CK_REALLOC_"     ),tal)
     715. # 0  0    #pragma function strtod                (alias("CRE_CK_STRTODX_"      ),tal)
     716. # 0  0    #pragma function strtol                (alias("CRE_CK_STRTOLX_32_"   ),tal)
     717. # 0  0    #pragma function strtoul               (alias("CRE_CK_STRTOULX_32_"  ),tal)
     718. # 0  0    #ifdef _TANDEM_SOURCE
     719. # 0  0    #pragma function stcd_i                (alias("CRE_CK_STCD_LX_32_"   ),tal)
     720. # 0  0    #pragma function stcd_l                (alias("CRE_CK_STCD_LX_32_"   ),tal)
     721. # 0  0    #pragma function stch_i                (alias("CRE_CK_STCH_IX_32_"   ),tal)
     722. # 0  0    #pragma function stci_d                (alias("CRE_CK_STCI_DX_32_"   ),tal)
     723. # 0  0    #pragma function stcu_d                (alias("CRE_CK_STCU_DX_32_"   ),tal)
     724. # 0  0    #endif /* _TANDEM_SOURCE */
     725. # 0  0    #endif  /* __CHECK */
     726. # 0  0    #endif
     727. # 0  0    
     728.   0  0    #endif /* __TANDEM && _TANDEM_ARCH_ == 0 */
     729.   0  0    
     730.   0  0    #ifdef __TANDEM
     731. # 0  0    #if _TANDEM_ARCH_ != 0 && defined(_GUARDIAN_TARGET)
     732. # 0  0    #pragma function system                (alias("system_guardian"), tal)
     733.   0  0    #endif
     734.   0  0    
     735. # 0  0    #ifdef _TANDEM_SOURCE
     736. # 0  0    #pragma function terminate_program (alias("CRE_TERMINATOR_"), extensible, tal)
     737. # 0  0    #ifdef _GUARDIAN_TARGET
     738. # 0  0    #pragma function get_max_assign_msg_ordinal \
     739. # 0  0                             (alias("CRE_ASSIGN_MAXORDINAL_"), extensible, tal)
     740. # 0  0    #if _TANDEM_ARCH_ == 0
     741. # 0  0    #pragma function get_assign_msg        (alias("C_GET_ASSIGN_MSG_"),    tal)
     742. # 0  0    #pragma function get_assign_msg_by_name(alias("C_GET_ASSIGN_MSG_BY_NAME_"),tal)
     743. # 0  0    #pragma function get_param_msg         (alias("C_GET_PARAM_MSG_"),     tal)
     744. # 0  0    #pragma function get_param_by_name     (alias("C_GET_PARAM_BY_NAME_"), tal)
     745. # 0  0    #pragma function get_startup_msg       (alias("C_GET_STARTUP_MSG_"),   tal)
     746. # 0  0    #pragma function trap_overflows        (alias("RTL_ARITHMETIC_TRAPS_"),tal)
     747. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     748. # 0  0    #endif /* _GUARDIAN_TARGET */
     749. # 0  0    
     750. # 0  0    #pragma function CRE_RECEIVE_READ_       (extensible, unspecified)
     751. # 0  0    #pragma function CRE_RECEIVE_WRITE_      (extensible, unspecified)
     752. # 0  0    #pragma function CRE_RECEIVE_OPEN_CLOSE_ (extensible, unspecified)
     753.   0  0    #endif /* _TANDEM_SOURCE */
     754.   0  0    
     755.   0  0    #endif /* __TANDEM */
     756.   0  0    
     757.   0  0    
     758. # 0  0    #ifdef __cplusplus
     759. # 0  0       }
     760.   0  0    #endif
     761.   0  0    #if _TANDEM_ARCH_ > 2
     762.   0  0    #pragma hpe_nonstop_standard_header_end
     763.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
     764.   0  0    
     765.   0  0    #endif  /* _STDLIB defined */
Source file:  [0] C:\ABM\T4\f1.c  2026-06-11 11:03:01
       4.   0  0    #include <unistd.h>
Source file:  [5] C:\NonStop\L25.02\usr\include\unistd.h  2025-03-07 13:25:12
       1.   0  0    #ifdef __TANDEM
       2.   0  0    #pragma columns 80
Page 34   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


       3.   0  0    #if _TANDEM_ARCH_ != 0
       4.   0  0    #pragma ONCE
       5.   0  0    #endif
       6.   0  0    #endif
       7.   0  0    #ifndef _UNISTD
       8.   0  0    #define _UNISTD
       9.   0  0    #if _TANDEM_ARCH_ > 2
      10.   0  0    #pragma hpe_nonstop_standard_header
      11.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
      12.   0  0    
      13.   0  0    /* T8645L02 - (01FEB2025) - unistd.h  various kernel and FS definitions */
      14.   0  0    
      15.   0  0    /*
      16.   0  0     *  Copyright 2011, 2016-2018, 2024 
      17.   0  0     *  Hewlett Packard Enterprise Development LP
      18.   0  0     *
      19.   0  0     *     ALL RIGHTS RESERVED
      20.   0  0     */
      21.   0  0    #if (_TANDEM_ARCH_ == 1 && __G_Series_RVU < 629 || \
      22.   0  0         _TANDEM_ARCH_ == 2 && __H_Series_RVU < 606) && \
      23. # 0  0            (_FILE_OFFSET_BITS == 64 || _LARGEFILE64_SOURCE == 1)
      24. # 0  0       #error 64-bit functions not available for target RVU
      25.   0  0    #endif /* 64-bit functions requested when not available */
      26.   0  0    
      27.   0  0    #if ((_TANDEM_ARCH_ < 3) || \
      28.   0  0         (_TANDEM_ARCH_ == 3 && __L_Series_RVU < 1605)) && \
      29. # 0  0         (defined(_PRELOAD_SUPPORT_FUNCTIONS))
      30. # 0  0           #error "Preload support functions not available for target RVU"
      31.   0  0    #endif /* Preload support functions requested when not available */
      32.   0  0    
      33. # 0  0    #ifndef __DIRFD_SUPPORTED__
      34. # 0  0    #define __DIRFD_SUPPORTED__ \
      35. # 0  0      ( ( (_TANDEM_ARCH_ == 2 && defined(__J_Series_RVU) &&  \
      36. # 0  0             __J_Series_RVU >= 622) || \
      37. # 0  0          (_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
      38. # 0  0             __L_Series_RVU >= 1802) || \
      39. # 0  0          (_TANDEM_ARCH_ > 3 ) ) && _XOPEN_SOURCE_EXTENDED == 1 )
      40.   0  0    #endif /* __DIRFD_SUPPORTED__ */
      41.   0  0    
      42.   0  0    #ifndef __PREAD_PWRITE_SUPPORTED__
      43.   0  0    #define __PREAD_PWRITE_SUPPORTED__ \
      44.   0  0      ( ( (_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
      45.   0  0             __L_Series_RVU >= 1802 ) || \
      46.   0  0          (_TANDEM_ARCH_ > 3 ) ) && _XOPEN_SOURCE_EXTENDED == 1 )
      47.   0  0    #endif /* __PREAD_PWRITE_SUPPORTED__ */
      48.   0  0    
      49. # 0  0    #ifndef __NOEXCEPT
      50. # 0  0    #if (__CPLUSPLUS_VERSION >= 4)
      51. # 0  0    #define __NOEXCEPT noexcept
      52. # 0  0    #elif (__CPLUSPLUS_VERSION == 3)
      53. # 0  0    #define __NOEXCEPT throw ()
      54. # 0  0    #else
      55. # 0  0    #define __NOEXCEPT
      56. # 0  0    #endif /* (__CPLUSPLUS_VERSION >= 4) */
      57.   0  0    #endif /* __NOEXCEPT */
      58.   0  0    
      59. # 0  0    #ifdef __cplusplus
      60. # 0  0       extern "C" {
      61.   0  0    #endif
      62.   0  0    
      63.   0  0    /*
      64.   0  0     * COPYRIGHT NOTICE
      65.   0  0     *
Page 35   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


      66.   0  0     * Copyright (c) 1990, 1991, 1992, 1993 Open Software Foundation, Inc.
      67.   0  0     * ALL RIGHTS RESERVED (OSF/1).  See /usr/include/COPYRIGHT.OSF1 .
      68.   0  0     */
      69.   0  0    /* OSF/1 1.3 (Revision 3.0.5.10) */
      70.   0  0    
      71.   0  0    /*
      72.   0  0     * (C) COPYRIGHT International Business Machines Corp. 1985, 1989
      73.   0  0     * All Rights Reserved
      74.   0  0     * Licensed Materials - Property of IBM
      75.   0  0     *
      76.   0  0     * US Government Users Restricted Rights - Use, duplication or
      77.   0  0     * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
      78.   0  0     */
      79.   0  0    
      80.   0  0    /*
      81.   0  0     * Copyright (c) 1984 AT&T
      82.   0  0     * All Rights Reserved
      83.   0  0     *
      84.   0  0     * THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF AT&T
      85.   0  0     * The copyright notice above does not evidence any
      86.   0  0     * actual or intended publication of such source code.
      87.   0  0     */
      88.   0  0    
      89.   0  0    #ifndef _GUARDIAN_HOST
      90.   0  0    #include <sys/types.h>
      91. # 0  0    #else
      92. # 0  0    #include <systype.h> nolist
      93.   0  0    #endif /* _GUARDIAN_HOST */
      94.   0  0    
      95. # 0  0    #ifndef NULL
      96. # 0  0    #if defined(_GUARDIAN_TARGET) && defined(__XMEM)
      97. # 0  0    #define NULL   0L
      98. # 0  0    #else
      99. # 0  0    #define NULL   0
     100. # 0  0    #endif
     101.   0  0    #endif /* NULL */
     102.   0  0    
     103.   0  0    /*
     104.   0  0     * Defines for access()
     105.   0  0     */
     106.   0  0    #define R_OK   4        /* Test for read access                   */
     107.   0  0    #define W_OK   2        /* Test for write access                  */
     108.   0  0    #define X_OK   1        /* Test for execute access                */
     109.   0  0    #define F_OK   0        /* Test for existence of the file         */
     110.   0  0    
     111.   0  0    /*
     112.   0  0     * Defines for lseek()
     113.   0  0     */
     114. # 0  0    #ifndef SEEK_SET
     115. # 0  0    #define SEEK_SET   0    /* Set file pointer to "offset"           */
     116.   0  0    #endif
     117.   0  0    
     118. # 0  0    #ifndef SEEK_CUR
     119. # 0  0    #define SEEK_CUR   1    /* Set file pointer to current + "offset" */
     120.   0  0    #endif
     121.   0  0    
     122. # 0  0    #ifndef SEEK_END
     123. # 0  0    #define SEEK_END   2    /* Set file pointer to EOF + "offset"     */
     124.   0  0    #endif
     125.   0  0    
     126.   0  0    /*
     127.   0  0     * File descriptors for stdin, stdout, and stderr
     128.   0  0     */
Page 36   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     129.   0  0    #define STDIN_FILENO    0
     130.   0  0    #define STDOUT_FILENO   1
     131.   0  0    #define STDERR_FILENO   2
     132.   0  0    
     133.   0  0    /*
     134.   0  0     * Compile-time symbolic constants -- can be interrogated by sysconf()
     135.   0  0     */
     136.   0  0    #define _POSIX_JOB_CONTROL   1  /* Implementation supports job control  */
     137.   0  0    #define _POSIX_SAVED_IDS     1  /* Each process has a saved set-user-ID */
     138.   0  0                                    /*   and saved set-group-ID             */
     139. # 0  0    #if defined(_PUT_MODEL_)|| defined(_KLT_MODEL_)
     140. # 0  0    #define _POSIX_VERSION  200112L /* POSIX Standard version               */
     141.   0  0    #else
     142.   0  0    #define _POSIX_VERSION  199009L /* POSIX Standard version               */
     143.   0  0    #endif 
     144.   0  0    
     145.   0  0    #if defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2
     146.   0  0    /*  All of the following are POSIX.2 additions to POSIX.1  */
     147.   0  0    
     148.   0  0    #define _POSIX2_C_BIND       1  /* Supports the C language bindings         */
     149.   0  0    #define _POSIX2_C_DEV        1  /* Supports the C development utilities     */
     150.   0  0    #undef  _POSIX2_FORT_DEV        /* No support for fortran dev utilities     */
     151.   0  0    #undef  _POSIX2_FORT_RUN        /* No support for fortran runtime utilities */
     152.   0  0    #undef  _POSIX2_LOCALEDEF       /* No support for the creation of locales   */
     153.   0  0    #define _POSIX2_SW_DEV       1  /* Supports software development utilities  */
     154.   0  0    #undef  _POSIX2_CHAR_TERM       /* Supports at least one terminal type      */
     155.   0  0    #undef  _POSIX2_UPE             /* Supports the User Portability Utilities  */
     156.   0  0    #define _POSIX2_C_VERSION 199209L  /* Supports ISO POSIX-2 DIS Version 1    */
     157.   0  0    #define _POSIX2_VERSION   199209L  /* POSIX.2 Standard                      */
     158.   0  0    
     159.   0  0    /*  POSIX threads symbols  */
     160.   0  0    
     161.   0  0    #if (_TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)) \
     162.   0  0        && !defined(_SPT_MODEL_)
     163.   0  0    /*  0 for supported, -1 for not supported  */
     164.   0  0    #define _POSIX_THREADS                     0
     165.   0  0    #define _POSIX_THREAD_ATTR_STACKADDR      -1
     166.   0  0    #define _POSIX_THREAD_ATTR_STACKSIZE       0
     167. # 0  0    #if defined(_KLT_MODEL_) && (_TANDEM_ARCH_ > 2)
     168. # 0  0    #define _POSIX_THREAD_PROCESS_SHARED       0
     169.   0  0    #else
     170.   0  0    #define _POSIX_THREAD_PROCESS_SHARED      -1
     171.   0  0    #endif /* defined(_KLT_MODEL_) && (_TANDEM_ARCH_ > 2) */
     172.   0  0    #define _POSIX_THREAD_SAFE_FUNCTIONS       0
     173.   0  0    #define _POSIX_THREAD_PRIORITY_SCHEDULING  0
     174.   0  0    #define _POSIX_THREAD_PRIO_INHERIT        -1
     175.   0  0    #define _POSIX_THREAD_PRIO_PROTECT        -1
     176.   0  0    #define _POSIX_THREAD_CPUTIME             -1
     177.   0  0    #define _POSIX_THREAD_SPORADIC_SERVER     -1
     178.   0  0    #define _POSIX_READER_WRITER_LOCKS        -1
     179.   0  0    #endif /* _TANDEM_ARCH_ >= 2 && !_SPT_MODEL_ */
     180.   0  0    
     181.   0  0    #endif /* _XOPEN_SOURCE || _POSIX_C_SOURCE == 2 */
     182.   0  0    
     183.   0  0    #ifdef _XOPEN_SOURCE
     184.   0  0    #undef _XOPEN_XCU_VERSION
     185.   0  0    /* Turn the line above off and the following line on when XPG4 fully supported
     186.   0  0    #define _XOPEN_XCU_VERSION      4
     187.   0  0    */
     188.   0  0    #define _XOPEN_ENH_I18N         1       /* Supports enhanced I18N */
     189.   0  0    #define _XOPEN_SHM              1       /* Supports shared memory */
     190.   0  0    #endif /* _XOPEN_SOURCE */
     191.   0  0    
Page 37   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     192.   0  0    /*
     193.   0  0     * Execution-time symbolic constants
     194.   0  0     * (can be interrogated using pathconf() and fpathconf())
     195.   0  0     */
     196.   0  0    /*
     197.   0  0     * chown() function is restricted on a fileset basis on later RVUs
     198.   0  0     */
     199.   0  0    #if ( (_TANDEM_ARCH_ == 2 && defined(__J_Series_RVU) &&  \
     200.   0  0              __J_Series_RVU >= 622) || \
     201.   0  0          (_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
     202.   0  0              __L_Series_RVU >= 1708) || \
     203.   0  0          (_TANDEM_ARCH_ > 3 ) )
     204.   0  0    #define _POSIX_CHOWN_RESTRICTED 0       /* Use pathconf() or fpathconf()
     205.   0  0                                                to obtain the value */
     206. # 0  0    #else
     207. # 0  0    #define _POSIX_CHOWN_RESTRICTED 1       /* Applies to all files */
     208.   0  0    #endif
     209.   0  0    
     210.   0  0    /*
     211.   0  0     * Path components greater than NAME_MAX are never truncated
     212.   0  0     */
     213.   0  0    #define _POSIX_NO_TRUNC           1
     214.   0  0    /*
     215.   0  0     * Value to use for disabling special character functions
     216.   0  0     */
     217.   0  0    #define _POSIX_VDISABLE  0xFF
     218.   0  0    /*
     219.   0  0     * Defines for sysconf() options
     220.   0  0     */
     221.   0  0    #define _SC_ARG_MAX     1
     222.   0  0    #define _SC_CHILD_MAX   2
     223.   0  0    #define _SC_CLK_TCK     3
     224.   0  0    #define _SC_JOB_CONTROL 4
     225.   0  0    #define _SC_NGROUPS_MAX 5
     226.   0  0    #define _SC_OPEN_MAX    6
     227.   0  0    #define _SC_SAVED_IDS   7
     228.   0  0    #define _SC_STREAM_MAX  8
     229.   0  0    #define _SC_TZNAME_MAX  9
     230.   0  0    #define _SC_VERSION    10
     231.   0  0    
     232.   0  0    #if defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2
     233.   0  0    #define _SC_BC_BASE_MAX         15
     234.   0  0    #define _SC_BC_DIM_MAX          16
     235.   0  0    #define _SC_BC_SCALE_MAX        17
     236.   0  0    #define _SC_BC_STRING_MAX       18
     237.   0  0    #define _SC_COLL_WEIGHTS_MAX    20
     238.   0  0    #define _SC_EXPR_NEST_MAX       21
     239.   0  0    #define _SC_LINE_MAX            22
     240.   0  0    #define _SC_2_C_DEV             23
     241.   0  0    #define _SC_2_FORT_DEV          24
     242.   0  0    #define _SC_2_FORT_RUN          25
     243.   0  0    #define _SC_2_LOCALEDEF         26
     244.   0  0    #define _SC_2_SW_DEV            27
     245.   0  0    #define _SC_2_VERSION           28
     246.   0  0    #define _SC_RE_DUP_MAX          29
     247.   0  0    #define _SC_2_C_BIND            30
     248.   0  0    #define _SC_2_UPE               31
     249.   0  0    #define _SC_XOPEN_VERSION       32
     250.   0  0    #define _SC_XOPEN_CRYPT         33
     251.   0  0    #define _SC_XOPEN_ENH_I18N      34
     252.   0  0    #define _SC_XOPEN_SHM           35
     253.   0  0    #define _SC_2_CHAR_TERM         36
     254.   0  0    #define _SC_PASS_MAX            37
Page 38   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     255.   0  0    #define _SC_XOPEN_XCU_VERSION   38
     256.   0  0    #define _SC_2_C_VERSION         39
     257.   0  0    #define _SC_GETGR_R_SIZE_MAX    40
     258.   0  0    #define _SC_GETPW_R_SIZE_MAX    41
     259.   0  0    #define _SC_THREADS             43
     260.   0  0    #define _SC_THREAD_ATTR_STACKSIZE      44
     261.   0  0    #define _SC_THREAD_SAFE_FUNCTIONS      45
     262.   0  0    #define _SC_THREAD_PRIORITY_SCHEDULING 46
     263.   0  0    #define _SC_THREAD_ATTR_STACKADDR      47
     264.   0  0    #define _SC_THREAD_CPUTIME             48
     265.   0  0    #define _SC_THREAD_PRIO_INHERIT        49
     266.   0  0    #define _SC_THREAD_PRIO_PROTECT        50
     267.   0  0    #define _SC_THREAD_PROCESS_SHARED      51
     268.   0  0    #define _SC_THREAD_SPORADIC_SERVER     52
     269.   0  0    #define _SC_READER_WRITER_LOCKS        53
     270.   0  0    #define _SC_PASS_MAX_LARGE             54
     271.   0  0    #endif /* _XOPEN_SOURCE || _POSIX_C_SOURCE == 2 */
     272.   0  0    
     273. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1
     274. # 0  0    #define _SC_IOV_MAX             42
     275.   0  0    #endif
     276.   0  0    
     277.   0  0    /*
     278.   0  0     * Defines for pathconf() options
     279.   0  0     */
     280.   0  0    #define _PC_CHOWN_RESTRICTED 1
     281.   0  0    #define _PC_LINK_MAX         2
     282.   0  0    #define _PC_MAX_CANON        3
     283.   0  0    #define _PC_MAX_INPUT        4
     284.   0  0    #define _PC_NAME_MAX         5
     285.   0  0    #define _PC_NO_TRUNC         6
     286.   0  0    #define _PC_PATH_MAX         7
     287.   0  0    #define _PC_PIPE_BUF         8
     288.   0  0    #define _PC_VDISABLE         9
     289.   0  0    #if ((_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
     290.   0  0          __L_Series_RVU >= 1903) || (_TANDEM_ARCH > 3))
     291.   0  0    #define _PC_REC_MAX_XFER_SIZE 10
     292.   0  0    #endif
     293.   0  0    
     294.   0  0    /* Arguments for the confstr() function */
     295.   0  0    #define _CS_PATH                1
     296.   0  0    
     297.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(_GUARDIAN_TARGET)
     298.   0  0    
     299.   0  0    int     close (int) __NOEXCEPT;
     300.   0  0    off_t   lseek (int, off_t, int) __NOEXCEPT;
     301. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     302. # 0  0    off64_t lseek64 (int, off64_t, int) __NOEXCEPT;
     303.   0  0    #endif
     304.   0  0    int     unlink(const char *) __NOEXCEPT;
     305. # 0  0    #if (__DIRFD_SUPPORTED__)
     306. # 0  0    int     unlinkat(int, const char *, int) __NOEXCEPT;
     307.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     308.   0  0    ssize_t read  (int, void *,size_t) __NOEXCEPT;
     309.   0  0    ssize_t write (int, const void *, size_t) __NOEXCEPT;
     310. # 0  0    #if (__PREAD_PWRITE_SUPPORTED__)
     311. # 0  0    ssize_t pread  (int, void *,size_t,off_t) __NOEXCEPT;
     312. # 0  0    ssize_t pwrite (int, const void *, size_t,off_t) __NOEXCEPT;
     313.   0  0    #endif /* __PREAD_PWRITE_SUPPORTED__ */
     314.   0  0    
     315.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 624)
     316.   0  0    long long read64_ (int, void _ptr64 *, unsigned long long) __NOEXCEPT;
     317.   0  0    long long write64_(int, void _ptr64 *, unsigned long long) __NOEXCEPT;
Page 39   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     318. # 0  0    #if (__PREAD_PWRITE_SUPPORTED__)
     319. # 0  0    long long pread64_(int, void _ptr64 *, unsigned long long, 
     320. # 0  0                       long long) __NOEXCEPT;
     321. # 0  0    long long pwrite64_(int, const void _ptr64 *, unsigned long long,
     322. # 0  0                        long long) __NOEXCEPT;
     323.   0  0    #endif /* __PREAD_PWRITE_SUPPORTED__ */
     324.   0  0    #endif /* _TANDEM_ARCH_ >= 2 */
     325.   0  0    
     326.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
     327.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     328. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     329. # 0  0    int usleep(useconds_t) __NOEXCEPT;   /* Free-standing usleep() not available */
     330. # 0  0    
     331. # 0  0    #if _FILE_OFFSET_BITS == 64 || defined(__LP64)
     332. # 0  0    #pragma function lseek    (alias("_TSL_lseek64"), unspecified)
     333. # 0  0    #else
     334. # 0  0    #pragma function lseek    (alias("_TSL_lseek")  , unspecified)
     335. # 0  0    #endif
     336. # 0  0    #if _LARGEFILE64_SOURCE == 1
     337. # 0  0    #pragma function lseek64  (alias("_TSL_lseek64"), unspecified)
     338. # 0  0    #endif
     339. # 0  0    #pragma function unlink   (alias("_TSL_unlink"), unspecified)
     340. # 0  0    #pragma function usleep   (alias("_TSL_usleep"), unspecified)
     341. # 0  0    #if (defined(_PRELOAD_SUPPORT_FUNCTIONS) && defined(__LP64) && \
     342. # 0  0         defined(_PUT_MODEL_))
     343. # 0  0    #pragma function close    (alias("_UIB_close") , unspecified)
     344. # 0  0    #pragma function read     (alias("_UIB_read")  , unspecified)
     345. # 0  0    #pragma function write    (alias("_UIB_write") , unspecified)
     346. # 0  0    #else
     347. # 0  0    #pragma function close    (alias("_TSL_close") , unspecified)
     348. # 0  0    #pragma function read     (alias("_TSL_read")  , unspecified)
     349. # 0  0    #pragma function write    (alias("_TSL_write") , unspecified)
     350. # 0  0    #if (__PREAD_PWRITE_SUPPORTED__)
     351. # 0  0     #if __L_Series_RVU == 1802 && (_FILE_OFFSET_BITS == 64 || defined (__LP64))
     352. # 0  0      #pragma function pread  (alias("pread64_"),  unspecified)
     353. # 0  0      #pragma function pwrite (alias("pwrite64_"), unspecified)
     354. # 0  0     #elif __L_Series_RVU >= 1808
     355. # 0  0      #pragma function pread64_  (alias("_TSL_pread64")  , unspecified)
     356. # 0  0      #pragma function pwrite64_ (alias("_TSL_pwrite64") , unspecified)
     357. # 0  0      #if _FILE_OFFSET_BITS == 64 || defined(__LP64)
     358. # 0  0       #pragma function pread  (alias("_TSL_pread64"),  unspecified)
     359. # 0  0       #pragma function pwrite (alias("_TSL_pwrite64"), unspecified)
     360. # 0  0      #else
     361. # 0  0       #pragma function pread  (alias("_TSL_pread")  , unspecified)
     362. # 0  0       #pragma function pwrite (alias("_TSL_pwrite") , unspecified)
     363. # 0  0      #endif /* _FILE_OFFSET_BITS==64 && defined(__LP64) */
     364. # 0  0     #endif /* RVU == L18.02 */
     365. # 0  0    #endif /* __PREAD_PWRITE_SUPPORTED__ */
     366. # 0  0    #endif /* _PRELOAD_SUPPORT_FUNCTIONS __LP64 _PUT_MODEL */
     367. # 0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 624)
     368. # 0  0    #if (defined(_PRELOAD_SUPPORT_FUNCTIONS) && defined(__LP64) && \
     369. # 0  0         defined(_PUT_MODEL_))
     370. # 0  0    #pragma function read64_  (alias("_UIB_read")  , unspecified)
     371. # 0  0    #pragma function write64_ (alias("_UIB_write") , unspecified)
     372. # 0  0    #else
     373. # 0  0    #pragma function read64_  (alias("_TSL_read")  , unspecified)
     374. # 0  0    #pragma function write64_ (alias("_TSL_write") , unspecified)
     375. # 0  0    #endif /* _PRELOAD_SUPPORT_FUNCTIONS __LP64 _PUT_MODEL */
     376. # 0  0    #endif /* _TANDEM_ARCH_ >= 2 */
     377. # 0  0    
     378.   0  0    #else  /* !_THREAD_SUPPORT_FUNCTIONS */
     379.   0  0    
     380. # 0  0    #if defined(__LP64) && _TANDEM_ARCH_ >= 2
Page 40   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     381. # 0  0       #pragma function lseek  (alias("lseek64"), unspecified)
     382. # 0  0       #pragma function read   (alias("read64_"),  unspecified)
     383. # 0  0       #pragma function write  (alias("write64_"), unspecified)
     384. # 0  0    #if (__PREAD_PWRITE_SUPPORTED__)
     385. # 0  0       #pragma function pread  (alias("pread64_"),  unspecified)
     386. # 0  0       #pragma function pwrite (alias("pwrite64_"), unspecified)
     387. # 0  0    #endif /* __PREAD_PWRITE_SUPPORTED__ */
     388. # 0  0    #elif _FILE_OFFSET_BITS == 64  && _TANDEM_ARCH_ != 0
     389. # 0  0     #if !defined(SPT_THREAD_AWARE_PRAGMA_XNONBLOCK)
     390. # 0  0       #pragma function lseek  (alias("lseek64"), unspecified)
     391. # 0  0     #endif /* ! SPT_THREAD_AWARE */
     392. # 0  0     #if (__PREAD_PWRITE_SUPPORTED__)
     393. # 0  0      #pragma function pread  (alias("pread64_"),  unspecified)
     394. # 0  0      #pragma function pwrite (alias("pwrite64_"), unspecified)
     395. # 0  0     #endif /* __PREAD_PWRITE_SUPPORTED__ */
     396.   0  0    #endif
     397.   0  0    #endif /* !_THREAD_SUPPORT_FUNCTIONS */
     398.   0  0    
     399. # 0  0    #if defined(_TANDEM_SOURCE) && _TANDEM_ARCH_ == 0 && defined(__INT32)
     400. # 0  0    int     unlink_guardian(const char *) __NOEXCEPT;
     401. # 0  0    int     unlink_oss     (const char *) __NOEXCEPT;
     402.   0  0    #endif
     403.   0  0    
     404. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0
     405. # 0  0    #pragma function close           (alias("PXFS_FILE_CLOSE_")  , tal)
     406. # 0  0    #pragma function lseek           (alias("PXFS_FILE_LSEEK_")  , tal)
     407. # 0  0    #pragma function read            (alias("PXFS_FILE_READ_")   , tal)
     408. # 0  0    #pragma function unlink          (alias("PXFS_FILE_UNLINK_") , tal)
     409. # 0  0    #pragma function write           (alias("PXFS_FILE_WRITE_")  , tal)
     410. # 0  0    #if defined(_TANDEM_SOURCE) && defined(__INT32)
     411. # 0  0    #pragma function unlink_guardian (alias("C_REMOVE_32_")      , tal)
     412. # 0  0    #pragma function unlink_oss      (alias("PXFS_FILE_UNLINK_") , tal)
     413. # 0  0    #endif /* _TANDEM_SOURCE && __INT32 */
     414.   0  0    #endif /* __TANDEM && _TANDEM_ARCH_ == 0 */
     415.   0  0    
     416.   0  0    #endif /* _TANDEM_ARCH_ != 0 || !_GUARDIAN_TARGET */
     417.   0  0    
     418.   0  0    void         _exit (int) __NOEXCEPT;
     419.   0  0    int          access(const char *, int) __NOEXCEPT;
     420. # 0  0    #if (__DIRFD_SUPPORTED__)
     421. # 0  0    int faccessat(int fd, const char *path, int amode, int flag) __NOEXCEPT;
     422.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     423.   0  0    unsigned int alarm (unsigned int) __NOEXCEPT;
     424.   0  0    int          chdir (const char *) __NOEXCEPT;
     425. # 0  0    #if (__DIRFD_SUPPORTED__)
     426. # 0  0    int          fchdir(int) __NOEXCEPT;
     427.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     428.   0  0    int          chown (const char *, uid_t, gid_t) __NOEXCEPT;
     429. # 0  0    #if (__DIRFD_SUPPORTED__)
     430. # 0  0    int          fchownat(int, const char *, uid_t, gid_t, int) __NOEXCEPT;
     431.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     432.   0  0    char *       ctermid (char *) __NOEXCEPT;
     433.   0  0    /*        -- cuserid() defined in stdio.h --        */
     434.   0  0    int          dup  (int) __NOEXCEPT;
     435.   0  0    int          dup2 (int, int) __NOEXCEPT;
     436.   0  0    int          execl (const char *, const char *, ...) __NOEXCEPT;
     437.   0  0    int          execle(const char *, const char *, ...) __NOEXCEPT;
     438.   0  0    int          execlp(const char *, const char *, ...) __NOEXCEPT;
     439.   0  0    int          execv (const char *, char * const []  ) __NOEXCEPT;
     440.   0  0    int          execve(const char *, char * const [], char *const[]) __NOEXCEPT;
     441.   0  0    int          execvp(const char *, char * const []  ) __NOEXCEPT;
     442.   0  0    #if (_TANDEM_ARCH_ == 3 && __L_Series_RVU >= 1802)
     443.   0  0    int          fexecve(int, char * const [], char *const[]) __NOEXCEPT;
Page 41   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     444.   0  0    #endif /* _TANDEM_ARCH_ == 3 && __L_Series_RVU >= 1802 */
     445.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 605) || \
     446.   0  0        (_TANDEM_ARCH_ == 1 && __G_Series_RVU >= 628)
     447.   0  0    int          fchown (int, uid_t, gid_t) __NOEXCEPT;
     448.   0  0    #endif
     449.   0  0    pid_t        fork  (void) __NOEXCEPT;
     450.   0  0    long         fpathconf (int, int) __NOEXCEPT;
     451.   0  0    char *       getcwd (char *, size_t) __NOEXCEPT;
     452.   0  0    gid_t        getegid (void) __NOEXCEPT;
     453.   0  0    uid_t        geteuid (void) __NOEXCEPT;
     454.   0  0    gid_t        getgid (void) __NOEXCEPT;
     455.   0  0    int          getgroups (int, gid_t[]) __NOEXCEPT;
     456.   0  0    char *       getlogin (void) __NOEXCEPT;
     457.   0  0    pid_t        getpgid(pid_t) __NOEXCEPT;
     458.   0  0    pid_t        getpgrp (void) __NOEXCEPT;
     459.   0  0    pid_t        getpid (void) __NOEXCEPT;
     460.   0  0    pid_t        getppid (void) __NOEXCEPT;
     461.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 607) || \
     462.   0  0        (_TANDEM_ARCH_ == 1 && __G_Series_RVU >= 629)
     463.   0  0    pid_t        getsid (pid_t) __NOEXCEPT;
     464.   0  0    #endif
     465.   0  0    uid_t        getuid (void) __NOEXCEPT;
     466.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 618)
     467.   0  0    int          initgroups (const char *, gid_t) __NOEXCEPT;
     468.   0  0    #endif
     469.   0  0    int          isatty (int) __NOEXCEPT;
     470.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 605) || \
     471.   0  0        (_TANDEM_ARCH_ == 1 && __G_Series_RVU >= 628)
     472.   0  0    int          lchown (const char *, uid_t, gid_t) __NOEXCEPT;
     473.   0  0    #endif
     474.   0  0    int          link (const char *,const char *) __NOEXCEPT;
     475. # 0  0    #if (__DIRFD_SUPPORTED__)
     476. # 0  0    int linkat(int, const char *, int, const char *, int) __NOEXCEPT;
     477.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     478.   0  0    long         pathconf (const char *, int) __NOEXCEPT;
     479.   0  0    int          pause (void) __NOEXCEPT;
     480.   0  0    int          pipe (int [2]) __NOEXCEPT;
     481.   0  0    int          rmdir (const char *) __NOEXCEPT;
     482.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 618)
     483.   0  0    int          setegid (gid_t) __NOEXCEPT;
     484.   0  0    int          seteuid (uid_t) __NOEXCEPT;
     485.   0  0    int          setgroups (int, const gid_t *) __NOEXCEPT;
     486.   0  0    #endif
     487.   0  0    int          setgid (gid_t) __NOEXCEPT;
     488.   0  0    int          setpgid (pid_t, pid_t) __NOEXCEPT;
     489.   0  0    #if _TANDEM_ARCH_ == 1 && __G_Series_RVU >= 629 || \
     490.   0  0        _TANDEM_ARCH_ == 2 && __H_Series_RVU >= 607 || _TANDEM_ARCH_ > 2
     491.   0  0    pid_t        setpgrp (void) __NOEXCEPT;
     492.   0  0    #endif
     493.   0  0    #if _TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 605) || \
     494.   0  0        (_TANDEM_ARCH_ == 1 && __G_Series_RVU >= 627)
     495.   0  0    int          setregid (gid_t, gid_t) __NOEXCEPT;
     496.   0  0    int          setreuid (uid_t, uid_t) __NOEXCEPT;
     497.   0  0    #endif
     498.   0  0    pid_t        setsid (void) __NOEXCEPT;
     499.   0  0    int          setuid (uid_t) __NOEXCEPT;
     500.   0  0    unsigned int sleep (unsigned int) __NOEXCEPT;
     501.   0  0    long         sysconf (int) __NOEXCEPT;
     502.   0  0    pid_t        tcgetpgrp (int) __NOEXCEPT;
     503.   0  0    int          tcsetpgrp (int, pid_t) __NOEXCEPT;
     504.   0  0    char *       ttyname (int) __NOEXCEPT;
     505.   0  0    
     506.   0  0    #if (_TANDEM_ARCH_ > 2 || (_TANDEM_ARCH_ == 2 && __H_Series_RVU >= 621)) \
Page 42   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     507.   0  0        && !defined(_SPT_MODEL_)
     508.   0  0    int getlogin_r(char *, size_t) __NOEXCEPT;
     509.   0  0    int ttyname_r(int, char *, size_t) __NOEXCEPT;
     510.   0  0    #endif /* _TANDEM_ARCH_ >= 2 && !_SPT_MODEL_ */
     511.   0  0    
     512.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
     513.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     514. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     515. # 0  0    #pragma function access   (alias("_TSL_access"), unspecified)
     516. # 0  0    #pragma function alarm    (alias("_TSL_alarm") , unspecified)
     517. # 0  0    #pragma function dup2     (alias("_TSL_dup2")  , unspecified)
     518. # 0  0    #pragma function fork     (alias("_TSL_fork")  , unspecified)
     519. # 0  0    #pragma function pause    (alias("_TSL_pause") , unspecified)
     520. # 0  0    #pragma function sleep    (alias("_TSL_sleep") , unspecified)
     521.   0  0    #endif /* _THREAD_SUPPORT_FUNCTIONS */
     522.   0  0    
     523.   0  0    #if defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2
     524.   0  0    size_t       confstr(int, char *, size_t) __NOEXCEPT;
     525.   0  0    int          getopt (int, char * const [], const char *) __NOEXCEPT;
     526.   0  0    #ifndef _LIBSPACE
     527.   0  0    /* getopt() declarations */
     528.   0  0    extern char *optarg;
     529.   0  0    extern int   optind;
     530.   0  0    extern int   optopt;
     531.   0  0    extern int   opterr;
     532.   0  0       #if defined(__TANDEM) && _TANDEM_ARCH_ != 0
     533.   0  0       #pragma extern_data no_gp optarg optind optopt opterr
     534.   0  0       #endif
     535.   0  0    #endif /* !_LIBSPACE */
     536.   0  0    
     537.   0  0    
     538.   0  0    
     539.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     540.   0  0    char  *crypt  (const char *, const char *) __NOEXCEPT;
     541.   0  0    void   encrypt(char [64], int) __NOEXCEPT;
     542.   0  0    int    nice   (int) __NOEXCEPT;
     543.   0  0    void   setkey (const char *) __NOEXCEPT;
     544.   0  0    #endif
     545.   0  0    
     546.   0  0    #endif /* _XOPEN_SOURCE || _POSIX_C_SOURCE == 2 */
     547.   0  0    
     548.   0  0    #ifdef _XOPEN_SOURCE
     549.   0  0    int          chroot (const char *) __NOEXCEPT;
     550.   0  0    int          fsync  (int) __NOEXCEPT;
     551.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     552.   0  0    char        *getpass(const char *) __NOEXCEPT;
     553.   0  0    #endif
     554.   0  0    #if ( ( (_TANDEM_ARCH_ == 2 && defined(__J_Series_RVU) &&  \
     555.   0  0             __J_Series_RVU >= 618) || \
     556.   0  0            (_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
     557.   0  0             __L_Series_RVU >= 1502) || \
     558. # 0  0            (_TANDEM_ARCH_ > 3 ) ) && defined(_TANDEM_SOURCE) )
     559. # 0  0    char        *getpass2(const char *) __NOEXCEPT;
     560. # 0  0    #if (defined(_PASS_MAX_LARGE))
     561. # 0  0    /* New sysconf variable mapping  */
     562. # 0  0    #undef _SC_PASS_MAX
     563. # 0  0    #define _SC_PASS_MAX   _SC_PASS_MAX_LARGE
     564. # 0  0    /* alias getpass to getpass2  */
     565. # 0  0    #pragma function getpass   (alias("getpass2"), unspecified)
     566. # 0  0    #endif  /* _PASS_MAX_LARGE */
     567.   0  0    #endif  /*  >=J0618 and >= L1502 arch */
     568.   0  0    void         swab   (const void *, void *, ssize_t) __NOEXCEPT;
     569.   0  0    #endif /* _XOPEN_SOURCE */
Page 43   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     570.   0  0    
     571. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1
     572. # 0  0    #if _TANDEM_ARCH_ != 0
     573. # 0  0    int          ftruncate(int, off_t) __NOEXCEPT;
     574. # 0  0    #if _LARGEFILE64_SOURCE == 1
     575. # 0  0    int          ftruncate64(int, off64_t) __NOEXCEPT;
     576. # 0  0    #endif
     577. # 0  0    int          getdtablesize(void) __NOEXCEPT;
     578. # 0  0    int          getpagesize(void) __NOEXCEPT;
     579. # 0  0    char        *getwd(char *) __NOEXCEPT;
     580. # 0  0    #endif /* _TANDEM_ARCH_ != 0 */
     581. # 0  0    int          readlink(const char *, char *, size_t) __NOEXCEPT;
     582. # 0  0    #if (__DIRFD_SUPPORTED__)
     583. # 0  0    ssize_t      readlinkat(int, const char *, char *, size_t) __NOEXCEPT;
     584. # 0  0    #endif /* __DIRFD_SUPPORTED__ */
     585. # 0  0    #if defined(__LP64) && _TANDEM_ARCH_ >= 2
     586. # 0  0    #pragma function readlink   (alias("readlinkLP64_"), unspecified)
     587. # 0  0    #if (__DIRFD_SUPPORTED__)
     588. # 0  0    #pragma function readlinkat   (alias("readlinkatLP64_"), unspecified)
     589. # 0  0    #endif /* __DIRFD_SUPPORTED__ */
     590. # 0  0    #endif
     591. # 0  0    int          symlink (const char *, const char *) __NOEXCEPT;
     592. # 0  0    #if (__DIRFD_SUPPORTED__)
     593. # 0  0    int          symlinkat(const char *, int, const char *) __NOEXCEPT;
     594. # 0  0    #endif /* __DIRFD_SUPPORTED__ */
     595.   0  0    #endif /* _XOPEN_SOURCE_EXTENDED == 1 */
     596.   0  0    
     597.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
     598.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     599. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     600. # 0  0    #ifdef _XOPEN_SOURCE
     601. # 0  0    #pragma function fsync       (alias("_TSL_fsync")    ,   unspecified)
     602. # 0  0    #endif
     603. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1
     604. # 0  0    #if _FILE_OFFSET_BITS == 64 || defined(__LP64)
     605. # 0  0    #pragma function ftruncate   (alias("_TSL_ftruncate64"), unspecified)
     606. # 0  0    #else
     607. # 0  0    #pragma function ftruncate   (alias("_TSL_ftruncate")  , unspecified)
     608. # 0  0    #endif
     609. # 0  0    #if _LARGEFILE64_SOURCE == 1
     610. # 0  0    #pragma function ftruncate64 (alias("_TSL_ftruncate64"), unspecified)
     611. # 0  0    #endif
     612. # 0  0    #endif /* _XOPEN_SOURCE_EXTENDED == 1 */
     613. # 0  0    
     614.   0  0    #else  /* !_THREAD_SUPPORT_FUNCTIONS */
     615.   0  0    
     616. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1
     617. # 0  0    #if defined(__LP64) && _TANDEM_ARCH_ >= 2
     618. # 0  0       #pragma function ftruncate  (alias("ftruncate64"), unspecified)
     619. # 0  0    #elif _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0 && \
     620. # 0  0           !defined(SPT_THREAD_AWARE_PRAGMA_XNONBLOCK)
     621. # 0  0       #pragma function ftruncate  (alias("ftruncate64"), unspecified)
     622. # 0  0    #endif
     623.   0  0    #endif /* _XOPEN_SOURCE_EXTENDED == 1 */
     624.   0  0    
     625.   0  0    #endif /* !_THREAD_SUPPORT_FUNCTIONS */
     626.   0  0    
     627.   0  0    #ifdef __TANDEM
     628. # 0  0    #if _TANDEM_ARCH_ == 0
     629. # 0  0    #pragma function access  (unspecified)
     630. # 0  0    #pragma function isatty  (unspecified)
     631. # 0  0    #pragma function fork    (unspecified)
     632. # 0  0    #pragma function _exit   (unspecified)
Page 44   2026 June 11, 11:03:05        [5] C:\NonStop\L25.02\usr\include\unistd.h


     633.   0  0    #endif /* _TANDEM_ARCH_ == 0 */
     634.   0  0    #if _TANDEM_ARCH_ != 0
     635.   0  0    #pragma function getpid  (unspecified)
     636.   0  0    #endif /* _TANDEM_ARCH_ != 0 */
     637. # 0  0    #if _TANDEM_ARCH_ == 0
     638. # 0  0    #pragma function alarm   (unspecified)
     639. # 0  0    #pragma function getpgrp (unspecified)
     640. # 0  0    #pragma function getppid (unspecified)
     641. # 0  0    #pragma function setpgid (unspecified)
     642. # 0  0    #pragma function setsid  (unspecified)
     643.   0  0    #endif /* _TANDEM_ARCH_ == 0 */
     644.   0  0    #endif /* __TANDEM */
     645.   0  0    
     646.   0  0    
     647. # 0  0    #ifdef __cplusplus
     648. # 0  0       }
     649.   0  0    #endif
     650.   0  0    #if _TANDEM_ARCH_ > 2
     651.   0  0    #pragma hpe_nonstop_standard_header_end
     652.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
     653.   0  0    
     654.   0  0    #endif  /* _UNISTD defined */
Source file:  [0] C:\ABM\T4\f1.c  2026-06-11 11:03:01
       5.   0  0    #include <fcntl.h>
Source file:  [6] C:\NonStop\L25.02\usr\include\fcntl.h  2025-03-07 13:25:11
       1.   0  0    #ifdef __TANDEM
       2.   0  0    #pragma columns 80
       3.   0  0    #if _TANDEM_ARCH_ != 0
       4.   0  0    #pragma ONCE
       5.   0  0    #endif
       6.   0  0    #endif
       7.   0  0    #ifndef _FCNTL
       8.   0  0    #define _FCNTL
       9.   0  0    #if _TANDEM_ARCH_ > 2
      10.   0  0    #pragma hpe_nonstop_standard_header
      11.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
      12. # 0  0    #ifndef __NOEXCEPT
      13. # 0  0    #if (__CPLUSPLUS_VERSION >= 4)
      14. # 0  0    #define __NOEXCEPT noexcept
      15. # 0  0    #elif (__CPLUSPLUS_VERSION == 3)
      16. # 0  0    #define __NOEXCEPT throw ()
      17. # 0  0    #else
      18. # 0  0    #define __NOEXCEPT
      19. # 0  0    #endif /* (__CPLUSPLUS_VERSION >= 4) */
      20.   0  0    #endif /* __NOEXCEPT */
      21.   0  0    
      22.   0  0    /* T8645L02 - (01FEB2025) - fcntl.h file control operation definitions */
      23.   0  0    
      24.   0  0    /*
      25.   0  0     Copyright 2011, 2014, 2017, 2018, 2020, 2021, 2024
      26.   0  0     Hewlett Packard Enterprise Development LP *
      27.   0  0     *     ALL RIGHTS RESERVED
      28.   0  0     */
      29.   0  0    
      30.   0  0    #if (_TANDEM_ARCH_ == 1 && __G_Series_RVU < 629 || \
      31.   0  0         _TANDEM_ARCH_ == 2 && __H_Series_RVU < 606) && \
      32. # 0  0            (_FILE_OFFSET_BITS == 64 || _LARGEFILE64_SOURCE == 1)
      33. # 0  0       #error 64-bit functions not available for target RVU
      34.   0  0    #endif /* 64-bit functions requested when not available */
      35.   0  0    
      36. # 0  0    #ifndef __DIRFD_SUPPORTED__
      37. # 0  0    #define __DIRFD_SUPPORTED__ \
      38. # 0  0      ( ( (_TANDEM_ARCH_ == 2 && defined(__J_Series_RVU) &&  \
Page 45   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


      39. # 0  0             __J_Series_RVU >= 622) || \
      40. # 0  0          (_TANDEM_ARCH_ == 3 && defined(__L_Series_RVU) &&  \
      41. # 0  0             __L_Series_RVU >= 1802) || \
      42. # 0  0          (_TANDEM_ARCH_ > 3 ) ) && _XOPEN_SOURCE_EXTENDED == 1 )
      43.   0  0    #endif /* __DIRFD_SUPPORTED__ */
      44.   0  0    
      45. # 0  0    #ifdef __cplusplus
      46. # 0  0       extern "C" {
      47.   0  0    #endif
      48.   0  0    
      49.   0  0    
      50. # 0  0    #ifndef SEEK_SET
      51. # 0  0    #define SEEK_SET       0
      52.   0  0    #endif
      53.   0  0    
      54. # 0  0    #ifndef SEEK_CUR
      55. # 0  0    #define SEEK_CUR       1
      56.   0  0    #endif
      57.   0  0    
      58. # 0  0    #ifndef SEEK_END
      59. # 0  0    #define SEEK_END       2
      60.   0  0    #endif
      61.   0  0    
      62.   0  0    /* ****************************************************
      63.   0  0       *  Open definitions (exclude only TNS Guardian C)  *
      64.   0  0       **************************************************** */
      65.   0  0    
      66.   0  0    #if _TANDEM_ARCH_ != 0 || !defined(_GUARDIAN_TARGET)
      67.   0  0    
      68.   0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
      69.   0  0        defined(_XOPEN_SOURCE) || _POSIX_C_SOURCE == 2 || \
      70.   0  0        defined(_TANDEM_SOURCE)
      71.   0  0    
      72.   0  0    #ifndef _GUARDIAN_HOST
      73.   0  0    #include <sys/types.h>
      74. # 0  0    #else
      75. # 0  0    #include <systype.h>  nolist
      76.   0  0    #endif /* _GUARDIAN_HOST */
      77.   0  0    
      78.   0  0    /* Flag values accessible to open() and fcntl() */
      79.   0  0    /*   (The first three can only be set by open)  */
      80.   0  0    #define O_RDONLY       0x0      /* Read only */
      81.   0  0    #define O_WRONLY       0x1      /* Write only */
      82.   0  0    #define O_RDWR         0x2      /* Read and Write */
      83.   0  0    #define O_ACCMODE      0x3      /* mask for access modes */
      84.   0  0    
      85.   0  0    #define O_NONBLOCK     0x4000   /* Non-blocking I/O */
      86.   0  0    #define O_APPEND       0x4      /* append (writes guaranteed at the end) */
      87.   0  0    
      88.   0  0    #ifdef _XOPEN_SOURCE
      89.   0  0    #define O_SYNC         0x10000  /* synchronous write option */
      90. # 0  0     #if (__DIRFD_SUPPORTED__)
      91. # 0  0     #define O_TTY_INIT     0x000    /* POSIX.1-2008 */
      92. # 0  0     #define O_SEARCH       0x040
      93. # 0  0     #define O_CLOEXEC      0x080    /* POSIX.1-2008 */
      94. # 0  0     #define O_DIRECTORY    0x100    /* POSIX.1-2008 */
      95. # 0  0     #define O_NOFOLLOW     0x200    /* POSIX.1-2008 */
      96. # 0  0     #define O_DSYNC        O_SYNC   /* POSIX.1-2008 */
      97. # 0  0     #define O_RSYNC        O_SYNC   /* POSIX.1-2008 */
      98. # 0  0     /* AT_ constants for directory-fd APIs */
      99. # 0  0    
     100. # 0  0     /* Most directory-fd APIs accept a special value of AT_FDCWD   */
     101. # 0  0     /* for a directory-fd parameter.  It indicates that the API    */
Page 46   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     102. # 0  0     /* should use the cwd as the directory to use for resolving    */
     103. # 0  0     /* relative pathnames.                                         */
     104. # 0  0     #define AT_FDCWD             -100   /* == 0xFFFFFF9C           */
     105. # 0  0    
     106. # 0  0     /* The following literals are values to be used with the flags */
     107. # 0  0     /* parameter for various POSIX.1-2008 directory-fd APIs.       */
     108. # 0  0     #define AT_EACCESS          0x100   /* Check access using the  */
     109. # 0  0                                         /* effective user & grp id.*/
     110. # 0  0     #define AT_SYMLINK_NOFOLLOW 0x200   /* Don't follow symbolic   */
     111. # 0  0                                         /* links. Used with        */
     112. # 0  0                                         /* fchmodat(), fchownat(), */
     113. # 0  0                                         /* fstatat().              */
     114. # 0  0     #define AT_SYMLINK_FOLLOW   0x400   /* Follow symbolic links.  */
     115. # 0  0                                         /* Used with linkat().     */
     116. # 0  0     #define AT_REMOVEDIR        0x800   /* Remove directory instead*/
     117. # 0  0                                         /* of unlinking file. Used */
     118. # 0  0                                         /* with unlinkat().        */
     119.   0  0     #endif /* __DIRFD_SUPPORTED__ */
     120.   0  0    #endif /* _XOPEN_SOURCE */
     121.   0  0    
     122.   0  0    /* Flag values accessible only to open() */
     123.   0  0    #define O_NOCTTY       0x8000   /* don't acquire controlling terminal */
     124.   0  0    #define O_CREAT        0x8      /* open with file create (uses third open
     125.   0  0                                       arg)*/
     126.   0  0    #define O_TRUNC        0x10     /* open with truncation */
     127.   0  0    #define O_EXCL         0x20     /* exclusive open */
     128.   0  0    
     129.   0  0    /* fcntl() requests */
     130.   0  0    #define F_DUPFD       0x100     /* Duplicate fildes */
     131.   0  0    #define F_GETFD       0x101     /* Get fildes flags */
     132.   0  0    #define F_SETFD       0x102     /* Set fildes flags */
     133.   0  0    #define F_GETFL       0x4       /* Get file flags */
     134.   0  0    #define F_SETFL       0x5       /* Set file flags */
     135.   0  0    #if (_FILE_OFFSET_BITS != 64 && !__LP64) || _TANDEM_ARCH_ == 0
     136.   0  0    #define F_GETLK       0x105     /* Get file lock */
     137.   0  0    #define F_SETLK       0x106     /* Set file lock */
     138.   0  0    #define F_SETLKW      0x107     /* Set file lock and wait */
     139. # 0  0    #else  /* (_FILE_OFFSET_BITS == 64 || __LP64) && _TANDEM_ARCH_ != 0 */
     140. # 0  0    #define F_GETLK       0x10a     /* Get file lock */
     141. # 0  0    #define F_SETLK       0x10b     /* Set file lock */
     142. # 0  0    #define F_SETLKW      0x10c     /* Set file lock and wait */
     143.   0  0    #endif /* (_FILE_OFFSET_BITS == 64 || __LP64) && _TANDEM_ARCH_ != 0 */
     144.   0  0    
     145. # 0  0    #if _XOPEN_SOURCE_EXTENDED == 1
     146. # 0  0    #define F_SETOWN      0x108     /* Set sigurg receiver */
     147. # 0  0    #define F_GETOWN      0x109     /* Get sigurg owner    */
     148.   0  0    #endif /* _XOPEN_SOURCE_EXTENDED == 1 */
     149.   0  0    
     150. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     151. # 0  0    #define F_GETLK64     0x10a     /* Get file lock */
     152. # 0  0    #define F_SETLK64     0x10b     /* Set file lock */
     153. # 0  0    #define F_SETLKW64    0x10c     /* Set file lock and wait */
     154.   0  0    #endif /* _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0 */
     155.   0  0    
     156.   0  0    /* file segment locking set data type - information passed to system by user */
     157.   0  0    #ifdef __TANDEM
     158. # 0  0    #ifdef __LP64
     159. # 0  0    #pragma fieldalign platform flock
     160.   0  0    #else
     161.   0  0    #pragma fieldalign shared8 flock
     162.   0  0    #endif
     163.   0  0    #endif
     164.   0  0    struct flock {
Page 47   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     165.   0  0            short   l_type;
     166.   0  0            short   l_whence;
     167. # 0  0    #if _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0
     168. # 0  0            char    filler1[4];
     169.   0  0    #endif
     170.   0  0            off_t   l_start;
     171.   0  0            off_t   l_len;     /* len = 0 means until end of file */
     172.   0  0            pid_t   l_pid;
     173.   0  0    
     174. # 0  0    #ifdef l_sysid
     175. # 0  0    #undef l_sysid
     176.   0  0    #endif /* l_sysid */
     177. # 0  0    #ifdef __LP64
     178. # 0  0            int     l_sysid;        /* nodenumber (LP64)  */
     179.   0  0    #else
     180.   0  0            long    l_sysid;        /* nodenumber (ILP32) */
     181.   0  0    #endif
     182.   0  0    };
     183.   0  0    
     184. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     185. # 0  0    #ifdef __TANDEM
     186. # 0  0    #pragma fieldalign shared8 flock64
     187. # 0  0    #endif
     188. # 0  0    struct flock64 {
     189. # 0  0            short   l_type;
     190. # 0  0            short   l_whence;
     191. # 0  0            char    filler1[4];
     192. # 0  0            off64_t l_start;
     193. # 0  0            off64_t l_len;  /* len = 0 means until end of file */
     194. # 0  0            pid_t   l_pid;
     195. # 0  0    
     196. # 0  0    #ifdef l_sysid
     197. # 0  0    #undef l_sysid
     198. # 0  0    #endif /* l_sysid */
     199. # 0  0    #ifdef __LP64
     200. # 0  0            int     l_sysid;        /* nodenumber (LP64)  */
     201. # 0  0    #else
     202. # 0  0            long    l_sysid;        /* nodenumber (ILP32) */
     203. # 0  0    #endif
     204. # 0  0    };
     205.   0  0    #endif /* _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0 */
     206.   0  0    
     207.   0  0    /* file segment locking types */
     208.   0  0    
     209.   0  0    #define F_RDLCK 01         /* Read lock */
     210.   0  0    #define F_WRLCK 02         /* Write lock */
     211.   0  0    #define F_UNLCK 03         /* Remove lock(s) */
     212.   0  0    
     213.   0  0    /* file descriptor flags */
     214.   0  0    
     215.   0  0    #define FD_CLOEXEC 1            /* close on exec */
     216.   0  0    
     217.   0  0    /* mode_t permission values */
     218.   0  0    
     219.   0  0    #ifndef __mode_t_NAMES
     220.   0  0    #define __mode_t_NAMES
     221.   0  0    #define S_ISUID 04000           /* set user id on execution */
     222.   0  0    #define S_ISGID 02000           /* set group id on execution */
     223.   0  0    #define         S_IRUSR 00400   /* read permission: owner */
     224.   0  0    #define         S_IWUSR 00200   /* write permission: owner */
     225.   0  0    #define         S_IXUSR 00100   /* execute permission: owner */
     226.   0  0    #define S_IRWXU (S_IRUSR | S_IWUSR | S_IXUSR) /* rwx mask for owner class */
     227.   0  0    
Page 48   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     228.   0  0    #define         S_IRGRP 00040   /* read permission: group */
     229.   0  0    #define         S_IWGRP 00020   /* write permission: group */
     230.   0  0    #define         S_IXGRP 00010   /* execute permission: group */
     231.   0  0    #define S_IRWXG (S_IRGRP | S_IWGRP | S_IXGRP) /* rwx mask for group class */
     232.   0  0    
     233.   0  0    #define         S_IROTH 00004   /* read permission: other */
     234.   0  0    #define         S_IWOTH 00002   /* write permission: other */
     235.   0  0    #define         S_IXOTH 00001   /* execute permission: other */
     236.   0  0    #define S_IRWXO (S_IROTH | S_IWOTH | S_IXOTH) /* rwx mask for other class */
     237.   0  0    #endif /* __mode_t_NAMES */
     238.   0  0    
     239.   0  0    int       creat (const char *, mode_t) __NOEXCEPT;
     240.   0  0    int       fcntl (int, int, ...) __NOEXCEPT;
     241.   0  0    int       open (const char *, int, ...) __NOEXCEPT;
     242. # 0  0    #if (__DIRFD_SUPPORTED__)
     243. # 0  0    int       openat (int, const char *, int, ...) __NOEXCEPT;
     244.   0  0    #endif /* __DIRFD_SUPPORTED__ */
     245.   0  0    
     246. # 0  0    #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     247. # 0  0    int       creat64 (const char *, mode_t) __NOEXCEPT;
     248. # 0  0    int       open64 (const char *, int, ...) __NOEXCEPT;
     249. # 0  0     #if (__DIRFD_SUPPORTED__)
     250. # 0  0     int      openat64 (int, const char *, int, ...) __NOEXCEPT;
     251. # 0  0     #endif /* __DIRFD_SUPPORTED__ */
     252.   0  0    #endif /* _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0 */
     253.   0  0    
     254.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
     255.   0  0        (defined(_THREAD_SUPPORT_FUNCTIONS) || defined(_PUT_MODEL_))) ||  \
     256. # 0  0        (_TANDEM_ARCH_ >= 3 && defined(_KLT_MODEL_))
     257. # 0  0    #pragma function fcntl    (alias("_TSL_fcntl")  , unspecified)
     258. # 0  0    #if _FILE_OFFSET_BITS == 64 || defined(__LP64)
     259. # 0  0    #pragma function creat    (alias("_TSL_creat64"), unspecified)
     260. # 0  0    #pragma function open     (alias("_TSL_open64") , unspecified)
     261. # 0  0     #if (__DIRFD_SUPPORTED__)
     262. # 0  0     #pragma function openat  (alias("_TSL_openat64") , unspecified)
     263. # 0  0     #endif /* __DIRFD_SUPPORTED__ */
     264. # 0  0    #else
     265. # 0  0    #pragma function creat    (alias("_TSL_creat")  , unspecified)
     266. # 0  0    #pragma function open     (alias("_TSL_open")   , unspecified)
     267. # 0  0     #if (__DIRFD_SUPPORTED__)
     268. # 0  0     #pragma function openat  (alias("_TSL_openat")   , unspecified)
     269. # 0  0     #endif /* __DIRFD_SUPPORTED__ */
     270. # 0  0    #endif
     271. # 0  0    #if _LARGEFILE64_SOURCE == 1
     272. # 0  0    #pragma function creat64  (alias("_TSL_creat64"), unspecified)
     273. # 0  0    #pragma function open64   (alias("_TSL_open64") , unspecified)
     274. # 0  0     #if (__DIRFD_SUPPORTED__)
     275. # 0  0     #pragma function openat64 (alias("_TSL_openat64") , unspecified)
     276. # 0  0     #endif /* __DIRFD_SUPPORTED__ */
     277. # 0  0    #endif
     278. # 0  0    
     279.   0  0    #else  /* !_THREAD_SUPPORT_FUNCTIONS */
     280.   0  0    
     281. # 0  0    #if defined(__LP64) && _TANDEM_ARCH_ >= 2
     282. # 0  0       #pragma function creat   (alias("creat64")   , unspecified)
     283. # 0  0       #pragma function fcntl   (alias("fcntlLP64_"), unspecified)
     284. # 0  0       #pragma function open    (alias("openLP64_") , unspecified)
     285. # 0  0        #if (__DIRFD_SUPPORTED__)
     286. # 0  0        #pragma function openat (alias("openatLP64_"), unspecified)
     287. # 0  0        #endif /* __DIRFD_SUPPORTED__ */
     288. # 0  0       #if _LARGEFILE64_SOURCE == 1 && _TANDEM_ARCH_ != 0
     289. # 0  0       #pragma function open64  (alias("openLP64_") , unspecified)
     290. # 0  0        #if (__DIRFD_SUPPORTED__)
Page 49   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     291. # 0  0        #pragma function openat64 (alias("openatLP64_"), unspecified)
     292. # 0  0        #endif /* __DIRFD_SUPPORTED__ */
     293. # 0  0       #endif
     294. # 0  0    #elif _FILE_OFFSET_BITS == 64 && _TANDEM_ARCH_ != 0
     295. # 0  0       #pragma function creat   (alias("creat64")   , unspecified)
     296. # 0  0       #pragma function open    (alias("open64")    , unspecified)
     297. # 0  0        #if (__DIRFD_SUPPORTED__)
     298. # 0  0        #pragma function openat  (alias("openat64")    , unspecified)
     299. # 0  0        #endif /* __DIRFD_SUPPORTED__ */
     300.   0  0    #endif
     301.   0  0    
     302.   0  0    #endif /* !_THREAD_SUPPORT_FUNCTIONS */
     303.   0  0    
     304. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0
     305. # 0  0    #pragma function creat  (alias("PXFS_FILE_CREAT_C_"), c  )
     306. # 0  0    #pragma function fcntl  (alias("PXFS_FILE_FCNTL_C_"), c  )
     307. # 0  0    #pragma function open   (alias("PXFS_FILE_OPEN_C_"),  c  )
     308.   0  0    #endif /* __TANDEM && _TANDEM_ARCH_ == 0 */
     309.   0  0    
     310.   0  0    #endif /* _POSIX_SOURCE || ... || _XOPEN_SOURCE || _TANDEM_SOURCE */
     311.   0  0    
     312.   0  0    /* *******************************************
     313.   0  0       *  Definitions for non-native Guardian C  *
     314.   0  0       ******************************************* */
     315.   0  0    
     316. # 0  0    #else /* _TANDEM_ARCH_ == 0 && _GUARDIAN_TARGET */
     317. # 0  0    
     318. # 0  0    #ifndef NULL
     319. # 0  0    #ifdef __XMEM
     320. # 0  0    #define NULL   0L
     321. # 0  0    #else
     322. # 0  0    #define NULL   0
     323. # 0  0    #endif
     324. # 0  0    #endif /* NULL */
     325. # 0  0    
     326. # 0  0    #ifndef __off_t_DEFINED
     327. # 0  0    #define __off_t_DEFINED
     328. # 0  0    typedef long off_t;
     329. # 0  0    #endif
     330. # 0  0    
     331. # 0  0    #ifndef __size_t_DEFINED
     332. # 0  0    #define __size_t_DEFINED
     333. # 0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     334. # 0  0    #ifdef __LP64
     335. # 0  0    typedef unsigned long  size_t;
     336. # 0  0    #else  /* !__LP64 */
     337. # 0  0    typedef unsigned int   size_t;
     338. # 0  0    #endif /* !__LP64 */
     339. # 0  0    #else /* _TANDEM_ARCH_ == 0 */
     340. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     341. # 0  0    typedef unsigned long  size_t;
     342. # 0  0    #else
     343. # 0  0    typedef unsigned short size_t;
     344. # 0  0    #endif
     345. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     346. # 0  0    #endif /* __size_t_DEFINED */
     347. # 0  0    
     348. # 0  0    #ifndef __ssize_t_DEFINED
     349. # 0  0    #define __ssize_t_DEFINED
     350. # 0  0    #if _TANDEM_ARCH_ != 0 || !defined(__TANDEM)
     351. # 0  0    #ifdef __LP64
     352. # 0  0    typedef long  ssize_t;
     353. # 0  0    #else  /* !__LP64 */
Page 50   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     354. # 0  0    typedef int   ssize_t;
     355. # 0  0    #endif /* !__LP64 */
     356. # 0  0    #else /* _TANDEM_ARCH_ == 0 */
     357. # 0  0    #if !defined(_GUARDIAN_TARGET) || defined(__XMEM)
     358. # 0  0    typedef long  ssize_t;
     359. # 0  0    #else
     360. # 0  0    typedef short ssize_t;
     361. # 0  0    #endif
     362. # 0  0    #endif /* _TANDEM_ARCH_ == 0 */
     363. # 0  0    #endif /* __ssize_t_DEFINED */
     364. # 0  0    
     365. # 0  0    #define O_RDWR         0x0
     366. # 0  0    #define O_RDONLY       0x1
     367. # 0  0    #define O_WRONLY       0x2
     368. # 0  0    #define O_APPEND       0x4
     369. # 0  0    #define O_CREAT        0x8
     370. # 0  0    #define O_TRUNC        0x10
     371. # 0  0    #define O_EXCL         0x20
     372. # 0  0    #define O_SYSMSG       0x100
     373. # 0  0    #define O_BINARY       0x200
     374. # 0  0    #define O_TEXT         0x400
     375. # 0  0    #define O_SHARED       0x800
     376. # 0  0    #define O_EXCLUSIVE    0x1000
     377. # 0  0    #define O_PROTECTED    0x1800
     378. # 0  0    #define O_ANY          0x2000
     379. # 0  0    
     380. # 0  0    #define F_FLUSH        1
     381. # 0  0    #define F_SETTAB       2
     382. # 0  0    #define F_SETBUF       3
     383. # 0  0    #define F_GETFL        4
     384. # 0  0    #define F_SETFL        5
     385. # 0  0    #define F_GETFCODE     6
     386. # 0  0    #define F_GETDTYPE     7
     387. # 0  0    #define F_GETFN        8
     388. # 0  0    #define F_ON           1
     389. # 0  0    #define F_OFF          0
     390. # 0  0    
     391. # 0  0    int       close (int) __NOEXCEPT;
     392. # 0  0    long      edlseek (short, long, short) __NOEXCEPT;
     393. # 0  0    int       fcntl (int, int, int) __NOEXCEPT;
     394. # 0  0    short     fdtogfn (short) __NOEXCEPT;
     395. # 0  0    off_t     lseek (int, off_t, int) __NOEXCEPT;
     396. # 0  0    ssize_t   read (int, void *, size_t) __NOEXCEPT;
     397. # 0  0    ssize_t   write (int, const void *, size_t) __NOEXCEPT;
     398. # 0  0    
     399. # 0  0    #ifdef __XMEM
     400. # 0  0    int   creat (const char *, int, int, int) __NOEXCEPT;
     401. # 0  0    short lastreceive (char *, short _near *) __NOEXCEPT;
     402. # 0  0    int   open (const char *, int, int, int, int, int) __NOEXCEPT;
     403. # 0  0    short readupdate (short, char *, short, long) __NOEXCEPT;
     404. # 0  0    short     receiveinfo (char *, short _near *, \
     405. # 0  0       long _near *, short _near *, short _near *, short _near *) __NOEXCEPT;
     406. # 0  0    short reply (char *, short, short, short) __NOEXCEPT;
     407. # 0  0    int   unlink (const char *) __NOEXCEPT;
     408. # 0  0    short writeread (short, char *, short, short) __NOEXCEPT;
     409. # 0  0    #else /* small model */
     410. # 0  0    int   creat (const char _far *, int, int, int) __NOEXCEPT;
     411. # 0  0    short lastreceive (char _far *, short *) __NOEXCEPT;
     412. # 0  0    int   open (const char _far *, int, int, int, int, int) __NOEXCEPT;
     413. # 0  0    short readupdate (short, char _far *, short, long) __NOEXCEPT;
     414. # 0  0    short     receiveinfo \
     415. # 0  0       (char _far *, short *, long *, short *, short *, short *) __NOEXCEPT;
     416. # 0  0    short reply (char _far *, short, short, short) __NOEXCEPT;
Page 51   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     417. # 0  0    int   unlink (const char _far *) __NOEXCEPT;
     418. # 0  0    short writeread (short, char _far *, short, short) __NOEXCEPT;
     419. # 0  0    #endif /* __XMEM */
     420. # 0  0    
     421. # 0  0    #if defined(_TANDEM_SOURCE) && defined(__INT32)
     422. # 0  0    int unlink_guardian(const char *) __NOEXCEPT;
     423. # 0  0    int unlink_oss     (const char *) __NOEXCEPT;
     424. # 0  0    #endif /* _TANDEM_SOURCE && __INT32 */
     425. # 0  0    
     426. # 0  0    
     427. # 0  0    /*
     428. # 0  0     * TNS C aliases and attributes
     429. # 0  0     */
     430. # 0  0    #if defined(__TANDEM) && _TANDEM_ARCH_ == 0
     431. # 0  0    #pragma function lastreceive     (alias("C_LASTRECEIVE_"),extensible,tal)
     432. # 0  0    #pragma function receiveinfo     (alias("C_RECEIVEINFO_"),extensible,tal)
     433. # 0  0    #pragma function writeread       (alias("C_WRITEREAD_")            , tal)
     434. # 0  0    #pragma function readupdate      (alias("C_READUPDATE_"),extensible, tal)
     435. # 0  0    #pragma function reply           (alias("C_REPLY_")    , extensible, tal)
     436. # 0  0    
     437. # 0  0    /*
     438. # 0  0     * Wide Model
     439. # 0  0     */
     440. # 0  0    #ifdef __XMEM
     441. # 0  0    #ifdef __INT32
     442. # 0  0    #pragma function close           (alias("C_CLOSE_32_")             , tal)
     443. # 0  0    #pragma function creat           (alias("C_CREAT_32_") , extensible, tal)
     444. # 0  0    #pragma function edlseek         (alias("C_EDLSEEK_")              , tal)
     445. # 0  0    #pragma function fcntl           (alias("C_FCNTL_32_") , extensible, tal)
     446. # 0  0    #pragma function fdtogfn         (alias("C_FDTOGFN_")              , tal)
     447. # 0  0    #pragma function lseek           (alias("C_LSEEK_32_")             , tal)
     448. # 0  0    #pragma function open            (alias("C_OPEN_32_")  , extensible, tal)
     449. # 0  0    #pragma function read            (alias("C_LG_READ_32_")           , tal)
     450. # 0  0    #pragma function unlink          (alias("C_REMOVE_32_")            , tal)
     451. # 0  0    #pragma function write           (alias("C_LG_WRITE_32_")          , tal)
     452. # 0  0    #ifdef _TANDEM_SOURCE
     453. # 0  0    #pragma function unlink_guardian (alias("C_REMOVE_32_")            , tal)
     454. # 0  0    #pragma function unlink_oss      (alias("PXFS_FILE_UNLINK_")       , tal)
     455. # 0  0    #endif /* _TANDEM_SOURCE */
     456. # 0  0    /*
     457. # 0  0     * Large Model
     458. # 0  0     */
     459. # 0  0    #else
     460. # 0  0    #pragma function close           (alias("C_CLOSE_")                , tal)
     461. # 0  0    #pragma function creat           (alias("C_CREAT_")    , extensible, tal)
     462. # 0  0    #pragma function edlseek         (alias("C_EDLSEEK_")              , tal)
     463. # 0  0    #pragma function fcntl           (alias("C_FCNTL_")    , extensible, tal)
     464. # 0  0    #pragma function fdtogfn         (alias("C_FDTOGFN_")              , tal)
     465. # 0  0    #pragma function lseek           (alias("C_LSEEK_")                , tal)
     466. # 0  0    #pragma function open            (alias("C_OPEN_")     , extensible, tal)
     467. # 0  0    #pragma function read            (alias("C_LG_READ_")              , tal)
     468. # 0  0    #pragma function unlink          (alias("C_REMOVE_")               , tal)
     469. # 0  0    #pragma function write           (alias("C_LG_WRITE_")             , tal)
     470. # 0  0    #endif
     471. # 0  0    /*
     472. # 0  0     * Small Model
     473. # 0  0     */
     474. # 0  0    #else
     475. # 0  0    #pragma function close           (alias("C_CLOSE_")                , tal)
     476. # 0  0    #pragma function creat           (alias("C_CREAT_")    , extensible, tal)
     477. # 0  0    #pragma function edlseek         (alias("C_EDLSEEK_")              , tal)
     478. # 0  0    #pragma function fcntl           (alias("C_FCNTL_")    , extensible, tal)
     479. # 0  0    #pragma function fdtogfn         (alias("C_FDTOGFN_")              , tal)
Page 52   2026 June 11, 11:03:05        [6] C:\NonStop\L25.02\usr\include\fcntl.h


     480. # 0  0    #pragma function lseek           (alias("C_LSEEK_")                , tal)
     481. # 0  0    #pragma function open            (alias("C_OPEN_")     , extensible, tal)
     482. # 0  0    #pragma function read            (alias("C_SM_READ_")              , tal)
     483. # 0  0    #pragma function unlink          (alias("C_REMOVE_")               , tal)
     484. # 0  0    #pragma function write           (alias("C_SM_WRITE_")             , tal)
     485. # 0  0    #endif  /* small model */
     486. # 0  0    #endif /* __TANDEM && _TANDEM_ARCH_ == 0 */
     487. # 0  0    
     488.   0  0    #endif /* _TANDEM_ARCH_ == 0 && _GUARDIAN_TARGET */
     489.   0  0    
     490. # 0  0    #if defined(_TANDEM_SOURCE) && defined(_GUARDIAN_TARGET)
     491. # 0  0    
     492. # 0  0    #if !defined(__TANDEM) || _TANDEM_ARCH_ != 0
     493. # 0  0    short chvol(char *) __NOEXCEPT;
     494. # 0  0    #else  /* __TANDEM && _TANDEM_ARCH_ == 0 */
     495. # 0  0    #ifdef __XMEM
     496. # 0  0    short chvol(char *) __NOEXCEPT;
     497. # 0  0    short extfname_to_intfname(char *, short *) __NOEXCEPT;
     498. # 0  0    #else /* small model */
     499. # 0  0    short chvol(char _far *) __NOEXCEPT;
     500. # 0  0    short extfname_to_intfname(char _far *, short _far *) __NOEXCEPT;
     501. # 0  0    #endif /* small model */
     502. # 0  0    #pragma function chvol                (alias("C_CHVOL_"),                tal)
     503. # 0  0    #pragma function extfname_to_intfname (alias("C_EXTFNAME_TO_INTFNAME_"), tal)
     504. # 0  0    #endif /* __TANDEM && _TANDEM_ARCH_ == 0 */
     505. # 0  0    
     506.   0  0    #endif /* _TANDEM_SOURCE && _GUARDIAN_TARGET */
     507.   0  0    
     508.   0  0    
     509. # 0  0    #ifdef __cplusplus
     510. # 0  0       }
     511.   0  0    #endif
     512.   0  0    #if _TANDEM_ARCH_ > 2
     513.   0  0    #pragma hpe_nonstop_standard_header_end
     514.   0  0    #endif /* _TANDEM_ARCH_ > 2 */
     515.   0  0    
     516.   0  0    #endif  /* _FCNTL defined */
Source file:  [0] C:\ABM\T4\f1.c  2026-06-11 11:03:01
       6.   0  0     
       7.   0  0    char buffer[1026]; /* allow for NULL termination of string in buffer */
       8.   0  0    char *filename;    /* filename pointer */
       9.   0  0    int fd;            /* file descriptor */
      10.   0  0    int nbytes;        /* number of bytes read */
      11.   0  0      
      12.   1  1    int main(int argc, char *argv[]) { 
      13.   1  1      
      14.   1  1    /* Check for the proper number of arguments; if no filename
      15.   1  1       is supplied, open the default file. */
      16.   1  1       if(argc > 1)
      17.   1  1          filename = argv[1];
      18.   1  1       else
      19.   1  1          filename = "/G/system/system/stdioh";  /* this file is opened if
      20.   1  1                                                    no name is supplied */
      21.   1  1       fd = open(filename, O_RDONLY);   /* open Guardian file for read */
      22.   1  1      
      23.   1  1    /* Check for the validity of the file descriptor; if it is not valid,
      24.   1  1       print a message and exit. */
      25.   1  2       if(fd < 0) {
      26.   1  2          fprintf(stderr,"Can't open %s\n", filename);
      27.   1  2          exit(1);
      28.   1  2       }
      29.   1  1      
      30.   1  1    /* If the read is unsuccessful, print an error message and exit. */
Page 53   2026 June 11, 11:03:05        [0] C:\ABM\T4\f1.c                     


      31.   1  1       nbytes = read(fd, buffer, 1024);
      32.   1  2       if (nbytes < 0) {
      33.   1  2           perror("File read error: ");
      34.   1  2           exit(1);
      35.   1  2        }
      36.   1  1      
      37.   1  1    /* Print the number of bytes read and the first part of the file. */
      38.   1  1       printf("Number of bytes read = %d\n", nbytes);
      39.   1  1       buffer[nbytes] = 0;   /* make string NULL-terminated */
      40.   1  1       printf("%s\n", buffer);
      41.   1  1       return(0);
      42.   1  1    }



















































Page 54   2026 June 11, 11:03:05     
          Source File Map

   File Num   Date       Time       File Name

        [0]   2026-06-11 11:03:01   C:\ABM\T4\f1.c
        [1]   2025-03-07 13:25:11   C:\NonStop\L25.02\usr\include\stdio.h
        [2]   2025-03-07 13:25:11   C:\NonStop\L25.02\usr\include\stdlib.h
        [3]   2025-03-07 13:25:12   C:\NonStop\L25.02\usr\include\sys/wait.h
        [4]   2025-03-07 13:25:12   C:\NonStop\L25.02\usr\include\sys/types.h
        [5]   2025-03-07 13:25:12   C:\NonStop\L25.02\usr\include\unistd.h
        [6]   2025-03-07 13:25:11   C:\NonStop\L25.02\usr\include\fcntl.h






















































Page 55   2026 June 11, 11:03:05     
          

0 remarks were issued during compilation.
0 warnings were issued during compilation.
0 errors were detected during compilation.
0 warnings were issued during inlining phase.
