Page 1    2026 April 1, 16:43:44     


TNS/X C - T0878L02 - 01FEB2025 (Nov  8 2024 01:18:43)
Copyright (C) 2024 Hewlett Packard Enterprise Development LP
 
Options:
 
    systype=oss, env=common, nooverflow_traps, noinnerlist
    list, lines=66, nomap, nosymbols
 
Source file:  [0] C:\ABM\T1\HelloWorld.c  2026-03-31 15:15:22
       1.   0  0    #include <stdio.h>
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
      52. # 0  0    #if defined(_GUARDIAN_TARGET) && defined(__XMEM)
Page 2    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     115.   0  0    #endif /* !__LP64 */
Page 3    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     178.   0  0    
Page 4    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     241. # 0  0    int    edfseek(FILE _far *, long, int) __NOEXCEPT;
Page 5    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     304.   0  0    int    setvbuf(FILE *, char *, int, size_t) __NOEXCEPT;
Page 6    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     367.   0  0    #endif /* _TANDEM_ARCH_ != 0 */
Page 7    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     430.   0  0    #if (_TANDEM_ARCH_ >= 2 && \
Page 8    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     493.   0  0    #endif /* _XOPEN_SOURCE */
Page 9    2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     556. # 0  0    #pragma function fclose        (alias("C_FCLOSE_32_"),     tal)
Page 10   2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     619. # 0  0    #pragma function fileno        (alias("C_FILENO_"),        tal)
Page 11   2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     682. # 0  0    int    rename(const char _far *, const char _far *);
Page 12   2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     745. # 0  0    #if defined(_POSIX_SOURCE) || _POSIX_C_SOURCE == 1 || \
Page 13   2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
     808. # 0  0    #pragma function putc          (alias("_C_PX_putc_"),    unspecified)
Page 14   2026 April 1, 16:43:44        [1] C:\NonStop\L25.02\usr\include\stdio.h


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
Source file:  [0] C:\ABM\T1\HelloWorld.c  2026-03-31 15:15:22
       2.   1  1    int main() {
       3.   1  1       printf("Hello, World! \n");
       4.   1  1       return 0;
       5.   1  1    }













Page 15   2026 April 1, 16:43:44     
          Source File Map

   File Num   Date       Time       File Name

        [0]   2026-03-31 15:15:22   C:\ABM\T1\HelloWorld.c
        [1]   2025-03-07 13:25:11   C:\NonStop\L25.02\usr\include\stdio.h



























































Page 16   2026 April 1, 16:43:44     
          

0 remarks were issued during compilation.
0 warnings were issued during compilation.
0 errors were detected during compilation.
0 warnings were issued during inlining phase.
