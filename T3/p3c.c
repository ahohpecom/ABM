/* Hewlett Packard Enterprise NonStop(TM) SQL/MX C/C++ Preprocessor 3.9.1 generated C file. */

#ifdef __TANDEM
#ifndef __ILP32
#error *** ERROR[13082] Incompatible addressing model. This source file was generated for a 32-bit addressing model. Refer to the HP NonStop SQL/MX Messages Manual for more information.
#endif
#endif

#line 1 "C:\\Program Files (x86)\\HPE SQL-MX C Preprocessor 3.9.1\\\\include\\sqlcli.h"
/**********************************************************************
// Copyright (c) 1994-1998, 2003, 2014, 2016, 2019-2023, Hewlett Packard Enterprise Development LP
//
// +++ Code modified on 2003/10/13
**********************************************************************/
#ifndef SQLCLI_HDR
#define SQLCLI_HDR

/* -*-C-*-
******************************************************************************
*
* File:         SQLCLI.h
* Description:  Declarations for the NonStop SQL CLI
* Language:     C and C++.  The comment style herein must be C, not C++.
*
*
*
******************************************************************************
*/

#ifdef __TANDEM
#ifndef NA_C89
#define NA_C89
#define NA_NSK
#endif
#endif

#undef SQLCLI_LIB_FUNC

#ifdef NA_WINNT
  #ifdef SQLCLI_LIB
    #define SQLCLI_LIB_FUNC __declspec( dllexport )
  #else
    #if defined(NOIMPORT_DLL)
      #define SQLCLI_LIB_FUNC
    #elif !defined(EXP_DLL)
      #define SQLCLI_LIB_FUNC __declspec( dllimport )
    #else
      #define SQLCLI_LIB_FUNC
    #endif
  #endif
#else
    #define SQLCLI_LIB_FUNC
#endif /*NA_WINNT*/

/* Keep these declarations in sync with those in export/NABasicTypes.h.
 * The contents of NABasicTypes.h are duplicated in sqlcli.h to avoid
 * #include directives in sqlcli.h. Introducing such directives could
 * change the way we build and package the preprocessor and also the
 * way we generate C/ COBOL files from embedded SQL source code.
 */
#ifndef NA_BASIC_TYPES_H
#define NA_BASIC_TYPES_H

typedef signed char     SInt8;
typedef char            Int8;
typedef unsigned char   UInt8;
typedef unsigned char   UChar;
typedef short           Int16;
typedef unsigned short  UInt16;
typedef float           Float32;
typedef double          Float64;

#if defined (__TANDEM)
#if defined (__ILP32)
typedef long               Int32;
typedef unsigned long      UInt32;
typedef long long          Int64;
typedef unsigned long long UInt64;

#elif defined(__LP64)
typedef int                Int32;
typedef unsigned int       UInt32;
typedef long long          Int64;
typedef unsigned long long UInt64;

#else
        Error! Unsupported address model.
#endif              /* if defined (__ILP32) */

#define __ptr64 _ptr64
#define __ptr32 _ptr32

#define Ptr64   _ptr64
#define Ptr32   _ptr32

#elif defined (_MSC_VER)

typedef long              Int32;
typedef unsigned long     UInt32;
typedef _int64            Int64;
typedef unsigned _int64   UInt64;

#define __ptr64
#define __ptr32

#define Ptr64
#define Ptr32

#else
        Only support MSVC and Tandem C89 for now
#endif              /* if defined (__TANDEM) */
#endif              /* ifndef NA_BASIC_TYPES_H */

#ifdef __cplusplus
extern "C"
{
#endif

typedef Int32 SQLCTX_HANDLE;

/* Internal structure definitions version */
/*
 * The statememt versions used for Cobol/C/C++ and Java are different. 
 * All MX versions up to 2.3.4 use the following versions:
 * Version 1 - C/C++, Cobol, JDBC Type 4, OSS
 * Version 2 - JDBC Type 2 / No-waited

 * All MX versions from 3.0 use the following versions:
 * Version 11 - C/C++, Cobol, JDBC Type 4, OSS
 * Version 12 - JDBC Type 2 / No-waited
 */

#define SQLCLI_CURRENT_VERSION      11
#define SQLCLI_STATEMENT_VERSION_1   1
#define SQLCLI_STATEMENT_VERSION_2   2
#define SQLCLI_STATEMENT_VERSION_11 11

/* L3.6 - Return auto-generated identity values 
 * Ravi: This is a mistake caused by a misunderstanding of how these version
 * numbers work and the lack of sufficiently-expert experts for guiding and
 * reviewing the work. All that is needed is a single, monotonically increasing
 * version number. This can be used for both the waited as well as the no-waited
 * cases. The two cases are differentiated by the value of SQLCLI_OBJ_ID's tag
 * field. Version 1 structures do not have this field. It was introduced in
 * version 2 and has been present ever since. When we introduce a feature that
 * is incompatible with the current CLI, we should add one new version, not two.
 * Whenever backward compatibility requirements permit, we should change to use
 * just the current version and get rid of all the other numbers. We can retire
 * version numbers 1 and 2 right away. R3.x is not compatible with R2.x and so,
 * will never see these values. A U64 Executor might give us a chance to retire
 * version 11 as well and use just 12.
 */
#define SQLCLI_STATEMENT_VERSION_12 12

/* Functional conformance version */
#if defined (NA_NSK)
#define CLI_VERSION_R2 90L
#define CLI_VERSION_R21 91L
#define CLI_VERSION_R23 92L
#define CLI_VERSION 92L
#else
#define CLI_VERSION 100L
#endif

/* structure to identify a module */
struct SQLMODULE_ID_t
{
  Int32 version;
  char filler1[ sizeof( Int32 ) ];
  const char __ptr64 *module_name;
  Int64 creation_timestamp;
  const char __ptr64 *charset;  /* charset (encoded in ASCII,
                                 * and null terminated) of the module name.
                                 */
  Int32 module_name_len;        /* length of the module name (in bytes) */
  char filler2[ sizeof( Int32 ) ];
  Int64 handle;                 /* internal handle for automatic migration
                                 * between versions
                                 */
  Int64 timestamp;              /* internal timestamp for automatic migration
                                 * between versions */
 
};


/* typedef the structure so that C compilers can use it without the 'struct' */
typedef struct SQLMODULE_ID_t SQLMODULE_ID;

/* specifies the way of naming an object in the CLI */
enum SQLOBJ_ID_NAME_MODE {
  stmt_name     =   1,          /* statement name as char string            */
  cursor_name   =   2,          /* cursor name as char string               */
  desc_name     =   3,          /* descriptor name as char string           */
  string_data   =  50,          /* string data passed in without a          */
                                /* descriptor. Used in certain cli calls    */
                                /* improve performance.                     */
  stmt_handle   = 101,          /* statement handle (generated by CLI)      */
  desc_handle   = 102,          /* descriptor handle (generated by CLI)     */
  stmt_via_desc = 201,          /* descriptor for a statement name          */
  curs_via_desc = 202,          /* descriptor for a cursor name             */
  desc_via_desc = 203           /* descriptor for a descriptor name         */
};

/* generic structure to pass names to the SQLCLI */
struct SQLCLI_OBJ_ID
{
  Int32 version;                      /* set to SQLCLI_CURRENT_VERSION
                                       * if no tag
                                       */
  Int32 name_mode;                    /* see enum SQLOBJ_ID_NAME_MODE below */
  const SQLMODULE_ID __ptr64 *module; /* module name (leading part of name) */
  const char __ptr64 *identifier;     /* actual identifier (one part name) */
  Int64 handle;                       /* handle, in addition or
                                       * instead of a name
                                       */
  const char __ptr64 *charset;        /* charset (encoded in ASCII, and null
                                       * terminated) of the identifier.
                                       */
  Int32 identifier_len;               /* length of the identifier (in bytes) */
  Int32 tag;                          /* added in R1.8, used when
                                       * version >= SQLCLI_STATEMENT_VERSION_2.
                                       * tag must be non-zero for nowaited
                                       * operation and zero for waited.
                                       */
  Int64 loadTime;                     /* module load time
                                       * initialized to zero by the application
                                       * and used internally to validate the
                                       * handle field.
                                       */
};


/* structure to pass a statement identifier to the CLI             */
 
typedef struct SQLCLI_OBJ_ID SQLSTMT_ID;
typedef struct SQLCLI_OBJ_ID SQLCLI_STMT_ID;

/* structure to pass a descriptor name or handle to the CLI. */
typedef struct SQLCLI_OBJ_ID SQLDESC_ID;

/* specifies whether a descriptor is an input or output descriptor */
enum SQLWHAT_DESC {
  SQLWHAT_INPUT_DESC    =    1,
  SQLWHAT_OUTPUT_DESC   =    2
};

/* specifies a particular item in a descriptor entry */
enum SQLDESC_ITEM_ID {

  SQLDESC_TYPE          =    1, /* (numeric) data type, ANSI                */
  SQLDESC_DATETIME_CODE =    2, /* (numeric) datetime code a la ANSI        */

  SQLDESC_LENGTH        =    3, /* (numeric) length in chars, bits, ...     */
  SQLDESC_OCTET_LENGTH  =    4, /* (numeric) length in bytes                */
  SQLDESC_PRECISION     =    5, /* (numeric) precision (decimal or binary)  */
  SQLDESC_SCALE         =    7, /* (numeric) scale of the number            */
  SQLDESC_INT_LEAD_PREC =    8, /* (numeric) interval leading field precis. */

  SQLDESC_NULLABLE      =    9, /* (numeric) 0 = NOT NULL, 1 = nullable     */

  SQLDESC_CHAR_SET      =   10, /* (numeric) 1 part charset enum */
  SQLDESC_CHAR_SET_CAT  =   11, /* (string ) catalog part of the char set   */
  SQLDESC_CHAR_SET_SCH  =   12, /* (string ) schema part of the char set    */
  SQLDESC_CHAR_SET_NAM  =   13, /* (string ) 1 part charset name            */
  SQLDESC_COLLATION     =   14, /* (numeric) collation code                 */
  SQLDESC_COLL_CAT      =   15, /* (string ) catalog of the coll name       */
  SQLDESC_COLL_SCH      =   16, /* (string ) schema part of the coll name   */
  SQLDESC_COLL_NAM      =   17, /* (string ) 1 part collation name          */

  SQLDESC_NAME          =   18, /* (string ) column name                    */
  SQLDESC_UNNAMED       =   19, /* (numeric) 0 = named, 1 = unnamed col.    */
  SQLDESC_HEADING       =   20, /* (string ) heading of the column          */

  SQLDESC_IND_TYPE      =   21, /* (numeric) data type of the indicator var */
  SQLDESC_VAR_PTR       =   22, /* (numeric) pointer to the data            */
  SQLDESC_IND_PTR       =   23, /* (numeric) pointer to an indicator var.   */

  SQLDESC_RET_LEN       =   24, /* (numeric) actual char length of the data */
  SQLDESC_RET_OCTET_LEN =   25, /* (numeric) actual byte len of the data    */
  SQLDESC_VAR_DATA      =   26, /* (string ) the actual data                */
  SQLDESC_IND_DATA      =   27, /* (numeric) value of the indicator         */
  SQLDESC_TYPE_FS       =   28, /* (numeric) data type, SQL/MP FS internal  */

  SQLDESC_IND_LENGTH    =   29, /* (numeric) Length in chars of the ind var */
  SQLDESC_ROWSET_VAR_LAYOUT_SIZE   = 30,
  SQLDESC_ROWSET_IND_LAYOUT_SIZE   = 31,
  SQLDESC_ROWSET_SIZE              = 32,
  SQLDESC_ROWSET_HANDLE            = 33,
  SQLDESC_ROWSET_NUM_PROCESSED     = 34,
  SQLDESC_ROWSET_ADD_NUM_PROCESSED = 35,
  SQLDESC_ROWSET_STATUS_PTR        = 36,

  SQLDESC_TABLE_NAME               = 37,
  SQLDESC_SCHEMA_NAME              = 38,
  SQLDESC_CATALOG_NAME             = 39,

  SQLDESC_PARAMETER_MODE	   = 40, /* (numeric) the parameter mode
                         defined in enum PARAMETER_MODE */
  SQLDESC_ORDINAL_POSITION	   = 41, /* (numeric) the formal parameter
                         ordinal position */
  SQLDESC_PARAMETER_INDEX	   = 42, /* (numeric) the actual parameter
                        position */
  SQLDESC_DESCRIPTOR_TYPE          = 43, /* specify either the wide or narrow
                        descriptor type.
                        static descriptors default to wide,
                        dynamic descritpors default to
                        narrow. */
  SQLDESC_ROWSET_TYPE              = 44, /* of type enum ROWSET_TYPE.
                        Defined in SQLCLIdev.h(not 
                        externalized yet)
                        Specifies if this is a row-wise 
                        column-wise rowset */

  SQLDESC_ROWWISE_ROWSET_SIZE      = 45, /* number of rows in this rowset */
  SQLDESC_ROWWISE_ROWSET_ROW_LEN   = 46, /* length of each row */
  SQLDESC_ROWWISE_ROWSET_PTR       = 47, /* ptr to the start of rowset */
  SQLDESC_TEXT_FORMAT		   = 48, /* (string) Datatype in text format */
#ifdef _DEBUG
  SQLDESC_ROWWISE_VAR_OFFSET       = 49, /* testing logic offset of value in Attribute */
  SQLDESC_ROWWISE_IND_OFFSET       = 50, /* testing logic offset of indicator in Attributes */  
#endif
  SQLDESC_CASEINSENSITIVE          = 51, /* (numeric) 0 = casesensitive, 1 = caseinsensitive */
  SQLDESC_DATA_OFFSET              = 52, /* offset to actual data in the row */
  SQLDESC_NULL_IND_OFFSET          = 53, /* offset to null indicator in the row */
  SQLDESC_VC_IND_LENGTH            = 54, /* (numeric) Length of varchar length indicator */
  SQLDESC_ALIGNED_LENGTH           = 55, /* total aligned length: data + null + vclen + filler */
  SQLDESC_LOB_DATA_SOURCE          = 56,
  SQLDESC_BLOB_DATA_SOURCE         = 57, /* descriptor type for BLOB data */
  SQLDESC_CLOB_DATA_SOURCE         = 58  /* descriptor type for CLOB data */
};

enum DESCRIPTOR_TYPE {
  DESCRIPTOR_TYPE_WIDE = 0,
  DESCRIPTOR_TYPE_NARROW = 1
};
  
enum PARAMETER_MODE { 
  PARAMETER_MODE_UNDEFINED	=    0,
  PARAMETER_MODE_IN		=    1,
  PARAMETER_MODE_INOUT		=    2, 
  PARAMETER_MODE_OUT		=    4
};

/* specifies the character set names corresponding to SQLDESC_CHAR_SET_NAM */
#define SQLCHARSETSTRING_ISO88591          "ISO88591"
#define SQLCHARSETSTRING_KANJI             "KANJI"
#define SQLCHARSETSTRING_KSC5601           "KSC5601"
#define SQLCHARSETSTRING_UNICODE           "UCS2"
#define SQLCHARSETSTRING_LATIN             "LATIN"
#define SQLCHARSETSTRING_EUCJP             "EUCJP"
#define SQLCHARSETSTRING_GB2312            "GB2312"
#define SQLCHARSETSTRING_GBK               "GBK"
#define SQLCHARSETSTRING_GB18030           "GB18030"
#define SQLCHARSETSTRING_MB_KSC5601        "MB_KSC5601"
#define SQLCHARSETSTRING_SJIS              "SJIS"
#define SQLCHARSETSTRING_UTF8              "UTF8"
#define SQLCHARSETSTRING_BIG5              "BIG5"
#define SQLCHARSETSTRING_UCS2              SQLCHARSETSTRING_UNICODE
#define SQLCHARSETSTRING_ISO_MAPPING       "ISO_MAPPING"

/* specifies the supported character sets (for numeric value version of 
SQL_EXEC_GETDESCITEM() and SQL_EXEC_SETDESCITEM() corresponding to SQLDESC_CHAR_SET)
*/
enum SQLCHARSET_CODE {
  SQLCHARSETCODE_UNKNOWN        =  0,
  SQLCHARSETCODE_ISO88591       =  1,
  SQLCHARSETCODE_KANJI          = -1,
  SQLCHARSETCODE_KSC5601        = -2,
  SQLCHARSETCODE_SJIS           = 10,
  SQLCHARSETCODE_UCS2           = 11,
  SQLCHARSETCODE_EUCJP          = 12,
  SQLCHARSETCODE_BIG5           = 13,
  SQLCHARSETCODE_GB18030        = 14,
  SQLCHARSETCODE_UTF8           = 15,
  SQLCHARSETCODE_MB_KSC5601     = 16,
  SQLCHARSETCODE_GB2312         = 17,
  SQLCHARSETCODE_GBK            = 18,

  /* specifies that the user input string is in the same charset that is
     set as the value of the ISO_MAPPING default in the defaults table.
     Cli will pass in the input string as is to mxcmp without any translation.
     It will also tell mxcmp to treat any unprefixed literals in the 
     input string as iso88591. */
  SQLCHARSETCODE_ISO_MAPPING    = 9999
};

/* specifies the supported character set conversions that are allowed */
enum SQLCONVCHARSET_CODE {
  SQLCONVCHARSETCODE_UNKNOWN    = 0,
  SQLCONVCHARSETCODE_UTF8       = 1,
  SQLCONVCHARSETCODE_UTF16      = 2,
  SQLCONVCHARSETCODE_UTF32      = 3,
  SQLCONVCHARSETCODE_ISO88591   = 4,
  SQLCONVCHARSETCODE_SJIS       = 5,
  SQLCONVCHARSETCODE_EUCJP      = 6,
  SQLCONVCHARSETCODE_KSC        = 7,
  SQLCONVCHARSETCODE_BIG5       = 8,
  SQLCONVCHARSETCODE_2312       = 9,
  SQLCONVCHARSETCODE_GB18030    = 10,
  SQLCONVCHARSETCODE_GBK        = 11
};

#define SQLCONV_REVERSE_INBYTES    2

/* specifies the collation names corresponding to SQLDESC_COLL_NAM */
#define SQLCOLLATIONSTRING_DEFAULT         "DEFAULT"
#define SQLCOLLATIONSTRING_CZECH           "CZECH"
#define SQLCOLLATIONSTRING_CZECH_CI        "CZECH_CI"

#define SQLCHARSETSTRING_DEFINED   1
#define SQLCOLLATIONSTRING_DEFINED 1

/* struct to hold one item of a descriptor entry */
typedef struct
{
  Int32 item_id;                 /* which item (see SQLDESC_ITEM_ID)         */
  Int32 value_num_desc_entry;    /* value num's input descriptor entry num   */
  Int32 entry;                   /* number of the entry                      */
  Int32 num_val_or_len;          /* numeric value or length of string        */
  char __ptr32 * string_val;     /* string value (if not a numeric value)    */
}
SQLDESC_ITEM_32;

#ifdef __LP64
/* struct to hold one item of a descriptor entry */
typedef struct
{
  Int64 num_val_or_len;          /* numeric value or length of string        */
  char __ptr64 * string_val;     /* string value (if not a numeric value)    */
  Int32 item_id;                 /* which item (see SQLDESC_ITEM_ID)         */
  Int32 value_num_desc_entry;    /* value num's input descriptor entry num   */
  Int32 entry;                   /* number of the entry                      */
}
SQLDESC_ITEM_64;

#define SQLDESC_ITEM SQLDESC_ITEM_64
#else
#define SQLDESC_ITEM SQLDESC_ITEM_32
#endif

/*  ANSI datatype values for item descriptor areas
 *   - see ANSI-92 Spec. Section 17.1 - Table 18
 *   - includes tandem extensions (negative values)
 */
enum SQLTYPE_CODE {
    /* CHAR/CHARACTER */
    SQLTYPECODE_CHAR     = 1,

    /* NUMERIC */
    SQLTYPECODE_NUMERIC  = 2,
    SQLTYPECODE_NUMERIC_UNSIGNED = -201,

    /* DECIMAL */
    SQLTYPECODE_DECIMAL  = 3,

    /* DECIMAL Tandem extensions */
    SQLTYPECODE_DECIMAL_UNSIGNED       = -301,
    SQLTYPECODE_DECIMAL_LARGE          = -302,
    SQLTYPECODE_DECIMAL_LARGE_UNSIGNED = -303,

    /* INTEGER/INT */
    SQLTYPECODE_INTEGER  = 4,

    /* INTEGER/INT Tandem extensions */
    SQLTYPECODE_INTEGER_UNSIGNED       = -401,
    SQLTYPECODE_LARGEINT               = -402,

    /* SMALLINT */
    SQLTYPECODE_SMALLINT = 5,

    /* SMALLINT Tandem extensions */
    SQLTYPECODE_SMALLINT_UNSIGNED      = -502,

    /*  Bit Precision int, Tandem extensions */
    SQLTYPECODE_BPINT_UNSIGNED         = -503,

    /* IEEE FLOAT (precision,scale)
     *    Internally converted to REAL or DOUBLE depending on
     *                 precision
     */
    SQLTYPECODE_IEEE_FLOAT    = 6,

    /* IEEE REAL
     *    Tandem note: precision == 22
     */
    SQLTYPECODE_IEEE_REAL     = 7,

    /* IEEE DOUBLE PRECISION
     *    Tandem note: precision == 54
     */
    SQLTYPECODE_IEEE_DOUBLE   = 8,

    /* Tandem FLOAT (precision,scale)
     *    Internally converted to REAL or DOUBLE depending on
     *                 precision
     */
    SQLTYPECODE_TDM_FLOAT    = -411,
    SQLTYPECODE_FLOAT = SQLTYPECODE_TDM_FLOAT,

    /* Tandem REAL
     *    Tandem note: precision == 22
     */
    SQLTYPECODE_TDM_REAL     = -412,
    SQLTYPECODE_REAL = SQLTYPECODE_TDM_REAL,

    /* Tandem DOUBLE PRECISION
     *    Tandem note: precision == 54
     */
    SQLTYPECODE_TDM_DOUBLE   = -413,
    SQLTYPECODE_DOUBLE = SQLTYPECODE_TDM_DOUBLE,

    /* DATE,TIME,TIMESTAMP */
    SQLTYPECODE_DATETIME = 9,

    /* TIMESTAMP */
    SQLTYPECODE_INTERVAL = 10,

    /* no ANSI value 11 */

    /* VARCHAR/CHARACTER VARYING */
    SQLTYPECODE_VARCHAR  = 12,

    /* SQL/MP stype VARCHAR with length prefix: Tandem Extension */
    SQLTYPECODE_VARCHAR_WITH_LENGTH = -601,

    /* Varchar2 */
    SQLTYPECODE_VARCHAR2_WITH_LENGTH = -602,

    /* LONG VARCHAR/ODBC CHARACTER VARYING */
    SQLTYPECODE_VARCHAR_LONG  = -1,		/* ## NEGATIVE??? */

    /* no ANSI value 13 */

    /* BIT */
    SQLTYPECODE_BIT      = 14,  /* not supported */

    /* BIT VARYING */
    SQLTYPECODE_BITVAR   = 15,   /* not supported */

    /* BINARY and VARBINARY */
    SQLTYPECODE_BINARY                  = -603,
    SQLTYPECODE_VARBINARY_WITH_LENGTH   = -604,
    SQLTYPECODE_BLOB                    =  30,
    SQLTYPECODE_BLOB_LOCATOR            =  31,
    SQLTYPECODE_CLOB                    =  40,
    SQLTYPECODE_CLOB_LOCATOR            =  41
};

/* #ifndef SQLDTCODE_DATE */
/* specifies the type of datetime data type */
enum SQLDATETIME_CODE {
  SQLDTCODE_DATE      = 1,
  SQLDTCODE_TIME      = 2,
  SQLDTCODE_TIMESTAMP = 3,
  SQLDTCODE_MPDATETIME = 4,

  /* R3.5 Added SQLDTCODEs to match dfs2rec.h REC_DATETIME_CODE */                                
  SQLDTCODE_YEAR_MONTH    = 5,                                          
  SQLDTCODE_YEAR_DAY      = 6,   
  SQLDTCODE_YEAR_HOUR     = 7,                                          
  SQLDTCODE_YEAR_MINUTE   = 8,                                          
  SQLDTCODE_YEAR_SECOND   = 9,    
  SQLDTCODE_MONTH         = 10,                                         
  SQLDTCODE_MONTH_DAY     = 11,                                         
  SQLDTCODE_MONTH_HOUR    = 12,                                         
  SQLDTCODE_MONTH_MINUTE  = 13,                                         
  SQLDTCODE_MONTH_SECOND  = 14,                                         
  SQLDTCODE_DAY           = 15,                                         
  SQLDTCODE_DAY_HOUR      = 16,                                         
  SQLDTCODE_DAY_MINUTE    = 17,                                         
  SQLDTCODE_DAY_SECOND    = 18,                                         
  SQLDTCODE_HOUR          = 19,                                         
  SQLDTCODE_HOUR_MINUTE   = 20,                                         
  SQLDTCODE_HOUR_SECOND   = 21,   
  SQLDTCODE_MINUTE        = 22,                                         
  SQLDTCODE_MINUTE_SECOND = 23,                                         
  SQLDTCODE_SECOND        = 24,                                         
  SQLDTCODE_FRACTION      = 25,
  SQLDTCODE_DC_DATETIME   = 26     /* R3.5-DC Compatibility */
};
/* #endif */

/* specifies the type of interval data type */
enum SQLINTERVAL_CODE {
  SQLINTCODE_YEAR          =  1,
  SQLINTCODE_MONTH         =  2,
  SQLINTCODE_DAY           =  3,
  SQLINTCODE_HOUR          =  4,
  SQLINTCODE_MINUTE        =  5,
  SQLINTCODE_SECOND        =  6,
  SQLINTCODE_YEAR_MONTH    =  7,
  SQLINTCODE_DAY_HOUR      =  8,
  SQLINTCODE_DAY_MINUTE    =  9,
  SQLINTCODE_DAY_SECOND    = 10,
  SQLINTCODE_HOUR_MINUTE   = 11,
  SQLINTCODE_HOUR_SECOND   = 12,
  SQLINTCODE_MINUTE_SECOND = 13
};

/* type codes from SQL/MP include file sql.h, for TYPE_FS
   descriptor fields (with additional SQL/MX datatypes)             */

#ifndef _SQLDT_ASCII_F

#define _SQLDT_ASCII_F      0   /* CHAR datatype                    */
#define _SQLDT_ASCII_F_UP   1   /* CHAR datatype, UPSHIFTed         */
#define _SQLDT_DOUBLE_F     2   /* DOUBLE CHAR datatype             */
#define _SQLDT_ASCII_V     64   /* VARCHAR datatype                 */
#define _SQLDT_ASCII_V_UP  65   /* VARCHAR datatype, UPSHIFted      */
#define _SQLDT_DOUBLE_V    66   /* DOUBLE VARCHAR datatype          */
#define _SQLDT_TDM_V2      71   /* VARCHAR2 datatype                */
#define _SQLDT_TDM_DOUBLE_V2   72   /* DOUBLE VARCHAR2 datatype     */
#define _SQLDT_16BIT_S    130   /* 16 bit signed binary number      */
                                /* SMALLINT, NUMERIC(1-4, <scale>)  */
#define _SQLDT_16BIT_U    131   /* 16 bit unsigned binary number    */
                                /* unsigned NUMERIC(1-4, <scale>)   */
#define _SQLDT_32BIT_S    132   /* 32 bit signed binary number      */
                                /* INTEGER, NUMERIC(5-9, <scale>)   */
#define _SQLDT_32BIT_U    133   /* 32 bit unsigned binary number    */
                                /* unsigned NUMERIC(5-9, <scale>)   */
#define _SQLDT_64BIT_S    134   /* 64 bit signed binary number      */
                                /* LARGEINT, NUMERIC(10-18,<scale>) */
#define _SQLDT_TDM_REAL   140   /* 32 bit TANDEM FLOAT              */
#define _SQLDT_TDM_DOUBLE 141   /* 64 bit TANDEM FLOAT              */
#define _SQLDT_IEEE_REAL  142   /* 32 bit IEEE FLOAT (SQL/MX only)  */
#define _SQLDT_IEEE_DOUBLE 143  /* 64 bit IEEE FLOAT (SQL/MX only)  */
#define _SQLDT_DEC_U      150   /* DECIMAL datatype: unsigned       */
#define _SQLDT_DEC_LSS    151   /* DECIMAL datatype:                */
                                /* leading sign is separate         */
#define _SQLDT_DEC_LSE    152   /* DECIMAL datatype:                */
                                /* leading sign is embedded         */
#define _SQLDT_DEC_TSS    153   /* DECIMAL datatype:                */
                                /* trailing sign separate           */
#define _SQLDT_DEC_TSE    154   /* DECIMAL datatype:                */
                                /* trailing sign embedded           */
#define _SQLDT_NUM_BIG_U  155   /* BigNum unsigned NUMERIC datatype */
                                /* NUMERIC(N) where N > 9           */
#define _SQLDT_NUM_BIG_S  156   /* BigNum signed NUMERIC datatype   */
                                /* NUMERIC(N) where N > 18          */
#define _SQLDT_DATETIME   192   /* DATETIME datatype                */

/*
 * INTERVAL datatype:
 */
#define _SQLDT_INT_Y_Y    195     /* YEAR TO YEAR         */
#define _SQLDT_INT_MO_MO  196     /* MONTH TO MONTH       */
#define _SQLDT_INT_Y_MO   197     /* YEAR TO MONTH        */
#define _SQLDT_INT_D_D    198     /* DAY TO DAY           */
#define _SQLDT_INT_H_H    199     /* HOUR TO HOUR         */
#define _SQLDT_INT_D_H    200     /* DAY TO HOUR          */
#define _SQLDT_INT_MI_MI  201     /* MINUTE TO MINUTE     */
#define _SQLDT_INT_H_MI   202     /* HOUR TO MINUTE       */
#define _SQLDT_INT_D_MI   203     /* DAY TO MINUTE        */
#define _SQLDT_INT_S_S    204     /* SECOND TO SECOND     */
#define _SQLDT_INT_MI_S   205     /* MINUTE TO SECOND     */
#define _SQLDT_INT_H_S    206     /* HOUR TO SECOND       */
#define _SQLDT_INT_D_S    207     /* DAY TO SECOND        */
#define _SQLDT_INT_F_F    208     /* FRACTION TO FRACTION */
#define _SQLDT_INT_S_F    209     /* SECOND TO FRACTION   */
#define _SQLDT_INT_MI_F   210     /* MINUTE TO FRACTION   */
#define _SQLDT_INT_H_F    211     /* HOUR TO FRACTION     */
#define _SQLDT_INT_D_F    212     /* DAY TO FRACTION      */
#define _SQLDT_BIN        213     /* BINARY               */
#define _SQLDT_BIN_V      214     /* VARBINARY            */

#endif /* ifndef _SQLDT_ASCII_F */


/* constant char strings that can be used to indicate charset sets for
   object and module names (from common/charinfo.cpp)
*/
#define MAX_CHAR_SET_STRING_LENGTH 128
#ifdef NA_C89
#pragma push extern_data
#pragma extern_data no_gp
#endif /* NA_C89 */

#ifdef NA_C89
#pragma pop extern_data
#endif /* NA_C89 */

/* specifies a particular statement information item in the diagnostics area */
enum SQLDIAG_STMT_INFO_ITEM_ID {

  /* ANSI */
  SQLDIAG_NUMBER        =    1, /* (numeric) number of conditions stored    */
  SQLDIAG_MORE          =    2, /* (string ) Y = all conditions not stored  */
  SQLDIAG_COMMAND_FUNC  =    3, /* (string ) type of statement executed     */
  SQLDIAG_DYNAMIC_FUNC  =    4, /* (string ) type of prepared stmt executed */
  SQLDIAG_ROW_COUNT     =    5, /* (numeric) number of rows affected        */

  /* SQL/MX */
  SQLDIAG_AVERAGE_STREAM_WAIT  =  101, /* (numeric) avg wait time for stream */
  SQLDIAG_ROWSET_ROW_COUNT     =  102, /* (numeric) array containing number 
                       of rows affected by each rowset row  */

  /* SQL/MP */
  SQLDIAG_COST          =  201, /* (numeric) estimated query cost           */
  SQLDIAG_FIRST_FSCODE  =  202, /* (numeric) first file system error        */
  SQLDIAG_LAST_FSCODE   =  203, /* (numeric) last file system error         */
  SQLDIAG_LAST_SYSKEY   =  204  /* (numeric) SYSKEY of last record inserted */
};

/* specifies a particular condition information item in the diagnostics area */
enum SQLDIAG_COND_INFO_ITEM_ID {

  /* ANSI */
  SQLDIAG_COND_NUMBER   =    1, /* (numeric) condition number               */
  SQLDIAG_RET_SQLSTATE  =    2, /* (string ) returned SQLSTATE              */
  SQLDIAG_CLASS_ORIG    =    3, /* (string ) class origin, e.g. ISO 9075    */
  SQLDIAG_SUBCLASS_ORIG =    4, /* (string ) subclass origin, e.g. ISO 9075 */
  SQLDIAG_SERVER_NAME   =    5, /* (string ) SQL server name                */
  SQLDIAG_CONNECT_NAME  =    6, /* (string ) connection name                */
  SQLDIAG_CONSTR_CAT    =    7, /* (string ) constraint catalog name        */
  SQLDIAG_CONSTR_SCHEMA =    8, /* (string ) constraint schema name         */
  SQLDIAG_CONSTR_NAME   =    9, /* (string ) constraint name                */
  SQLDIAG_CATALOG_NAME  =   10, /* (string ) catalog name                   */
  SQLDIAG_SCHEMA_NAME   =   11, /* (string ) schema name                    */
  SQLDIAG_TABLE_NAME    =   12, /* (string ) table name                     */
  SQLDIAG_COLUMN_NAME   =   13, /* (string ) column name                    */
  SQLDIAG_CURSOR_NAME   =   14, /* (string ) cursor name                    */
  SQLDIAG_MSG_TEXT      =   15, /* (string ) message text                   */
  SQLDIAG_MSG_LEN       =   16, /* (numeric) message length in characters   */
  SQLDIAG_MSG_OCTET_LEN =   17, /* (numeric) message length in bytes        */
  SQLDIAG_TRIGGER_CAT   =   18, /* (string ) trigger catalog name           */
  SQLDIAG_TRIGGER_SCHEMA =  19, /* (string ) trigger schema name            */
  SQLDIAG_TRIGGER_NAME   =  20, /* (string ) trigger name                   */ 

  /* ODBC */
  SQLDIAG_COLUMN_NUMBER =  101, /* (numeric) column number                  */
  SQLDIAG_NATIVE        =  102, /* (numeric) native error code              */
  SQLDIAG_ROW_NUMBER    =  103, /* (numeric) row number                     */

  /* SQL/MP */
  SQLDIAG_SOURCE_FILE   =  201, /* (string ) source file name               */
  SQLDIAG_LINE_NUMBER   =  202, /* (numeric) source code line number        */
  SQLDIAG_SUBSYSTEM_ID  =  203, /* (string ) component that issued error    */
  SQLDIAG_SQLCODE       =  204, /* (numeric) SQLCODE of this condition      */
  SQLDIAG_NSK_CODE      =  205 /* (numeric) NSK code FExxx from NSK/FS/DP2 */
};

/* struct to specify one condition information item of a diagnostics entry */
typedef struct {
  Int32 item_id; /* item id (SQLDIAG_COND_INFO_ITEM_ID) */
  Int32 cond_number_desc_entry;  /* cond. num's input descriptor entry num   */
} SQLDIAG_COND_INFO_ITEM;

/* struct to hold one item value of a diagnostic condition */
typedef struct
{
  /* which condition and which item in that condition */ 
  SQLDIAG_COND_INFO_ITEM item_id_and_cond_number;   

  /* numeric value or length of string        */
  Int32 __ptr32 *num_val_or_len;  

  /* string value (if not a numeric value)    */          
  char __ptr32 *string_val;   
}
SQLDIAG_COND_INFO_ITEM_VALUE_32;

#ifdef __LP64
/* equivalent of SQLDIAG_COND_INFO_ITEM_VALUE_32 for U64 management */
typedef struct
{
  Int32 __ptr64 *num_val_or_len;  
  char __ptr64 *string_val;   
  SQLDIAG_COND_INFO_ITEM item_id_and_cond_number;   
}
SQLDIAG_COND_INFO_ITEM_VALUE_64;

#define SQLDIAG_COND_INFO_ITEM_VALUE SQLDIAG_COND_INFO_ITEM_VALUE_64
#else
#define SQLDIAG_COND_INFO_ITEM_VALUE SQLDIAG_COND_INFO_ITEM_VALUE_32
#endif

/* struct to return query cost information to caller after prepare of a stmt */
typedef struct {
  Float64 cpuTime;
  Float64 ioTime;
  Float64 msgTime;
  Float64 idleTime;
  Float64 totalTime;
  Float64 cardinality;
  Float64 estimatedTotalMem;
  Int16  resourceUsage;
} SQL_QUERY_COST_INFO;

/* struct to return details about a query after prepare. 
   Will be used by caller(mxcs/wms) to determine how/when/if to run the 
   query */
typedef struct {
  UInt32 affinityNumber;
  Int32 dop; /* degree of parallel execution */
  Int16 xnNeeded;
  Int16 mandatoryCrossProduct;
  Int16 missingStats;
  Int16 numOfJoins;
  Int16 fullScanOnTable;
  Int16 highDp2MxBufferUsage;
  Float64 rowsAccessedForFullScan;
  Float64 dp2RowsAccessed;
  Float64 dp2RowsUsed;
} SQL_QUERY_COMPILER_STATS_INFO;

/* struct to hold statistics to be returned. */
typedef struct {
  Int64 prepareTime;
  Int64 fixupTime;
  Int64 freeupTime;
  Int64 returnedRowsIOTime;
  Int64 elapsedTime;
  Int64 rowsAffected;
  Int16 compilerCacheHit;
  Int16 executorCacheHit;
} SQL_QUERY_STATISTICS;

/* specifies an SQL transaction command */
enum SQLTRANS_COMMAND {
  /* The only commands currently supported are transaction       */
  /* status and quiesce (prepare for a REPLY call).              */
  /* Use static SQL or a dynamic prepare or execute immediate to */
  /* perform all other SQL transaction statements.               */
  /* SQLTRANS_BEGIN            =    1, */
  /* SQLTRANS_COMMIT           =    2, */
  /* SQLTRANS_ROLLBACK         =    3, */
  /* SQLTRANS_ROLLBACK_WAITED  =    4, */
  SQLTRANS_STATUS           =    5,
  /* SQLTRANS_SET              =    6, */
  SQLTRANS_QUIESCE          =    7,
  /* currently, called only by mxci after a BREAK key is hit
     to abort any implicit transactions started by cli */
  SQLTRANS_ROLLBACK_IMPLICIT_XN = 8
};

/* specifies the type/format of an AUTHID */
enum SQLAUTHID_TYPE {
  SQLAUTHID_TYPE_ASCII_USERNAME = 7777,
  SQLAUTHID_TYPE_ASCII_SID      = 8888,
  SQLAUTHID_TYPE_INVALID        = 9999
};

/* struct to specify an array of pointer pairs without using a va list.*/
typedef struct
{
  Int32 var_ptr; /* pointer to the data variable */
  Int32 ind_ptr; /* pointer to indicator variable; -1 is NULL */
}
SQLCLI_PTR_PAIRS_32;

#ifdef __LP64
/* struct to specify an array of pointer pairs without using a va list.*/
typedef struct
{
  Int64 var_ptr; /* pointer to the data variable */
  Int64 ind_ptr; /* pointer to indicator variable; -1 is NULL */
}
SQLCLI_PTR_PAIRS_64;

#define SQLCLI_PTR_PAIRS SQLCLI_PTR_PAIRS_64
#else
#define SQLCLI_PTR_PAIRS SQLCLI_PTR_PAIRS_32
#endif

/* struct to specify an array of quad fields without using a va list. */
struct SQLCLI_QUAD_FIELDS_32
{
  Int32 var_layout; /* data variable layout size */
  Int32 var_ptr;    /* pointer to the data variable */  
  Int32 ind_layout; /* indicator variable layout size */
  Int32 ind_ptr;    /* pointer to indicator variable; -1 is NULL */
};

#ifdef __LP64
/* The 64-bit equivalent of SQLCLI_QUAD_FIELDS_32.
 * The fields are arranged in a different order compared to the 32-bit one.
 * This is to ensure there are no fillers in between the fields.
 */
struct SQLCLI_QUAD_FIELDS_64
{
  Int64 var_ptr;    /* pointer to the data variable */ 
  Int64 ind_ptr;    /* pointer to indicator variable; -1 is NULL */
  Int32 var_layout; /* data variable layout size */
  Int32 ind_layout; /* indicator variable layout size */
};

#define SQLCLI_QUAD_FIELDS SQLCLI_QUAD_FIELDS_64
#else
#define SQLCLI_QUAD_FIELDS SQLCLI_QUAD_FIELDS_32
#endif

/* For the GetStmtAttr and SetStmtAttr interfaces.  */

enum SQLATTR_TYPE {
  SQL_ATTR_CURSOR_HOLDABLE = -3,
  SQL_ATTR_INPUT_ARRAY_MAXSIZE = -2,
  SQL_ATTR_QUERY_TYPE = -4,
  SQL_ATTR_ROWSET_ATOMICITY = -5,
  SQL_ATTR_NOT_ATOMIC_FAILURE_LIMIT = -6,
  SQL_ATTR_XN_NEEDED = -7,
  SQL_ATTR_UNIQUE_STMT_ID = -8,
  SQL_ATTR_UNIQUE_QUERY_ID = -8,
  SQL_ATTR_MAX_RESULT_SETS = -9,
  SQL_ATTR_UNIQUE_STMT_ID_NO_DIAGS = -10,
  SQL_ATTR_RS_PROXY_SYNTAX = -11,
  SQL_ATTR_CONSUMER_QUERY_TEXT = -12,
  SQL_ATTR_CONSUMER_CPU = -13,
  SQL_ATTR_COPY_STMT_ID_TO_DIAGS = -14,
  SQL_ATTR_PARENT_QID = -15,
  SQL_ATTR_STMT_TYPE = -16,
  SQL_ATTR_LOB_REDRIVE = -17,
  SQL_ATTR_STREAM_QUERY = -18 /* Soln 10-221004-6340 */ 
};

enum LOB_REDRIVE_ATTR
{
    REDRIVE_OFF = 0, REDRIVE_ON = 1, REDRIVE_CANCEL = 2
};

enum SQLSTMT_TYPE {
  NOT_SET_BY_USER=-1,     
  SQL_USER_STMT = 0,              /* Default */
  SQL_INTERNAL_STMT = 1,
  SQL_SENSITIVE_INTERNAL_STMT = 2
};


/* A container for a single statement attribute. For use with
   the SQL_EXEC_GetStmtAttrs function that returns multiple
   attributes in one call. */
typedef struct {
  Int32  attr_type;      /* IN:    which attr, from the         */
                         /*        SQLATTR_TYPE enum            */
  Int32  index;          /* IN:    optional index if attr       */
                         /*        is a collection              */
  Int32 *numeric_value;  /* INOUT: if attr is numeric, address  */
                         /*        of target buffer for the     */
                         /*        attr value                   */
  char *string_value;    /* INOUT: if attr is string, address   */
                         /*        of target buffer for the     */
                         /*        attr value                   */
  Int32  max_string_len; /* IN:    if attr is string, max len   */
                         /*        of buffer pointed to by      */
                         /*        string_val                   */
  Int32 *len_of_item;    /* INOUT OPTIONAL: if attr is string,  */
                         /*        address of target buffer to  */
                         /*        hold actual len of item      */
                         /*        returned. If error returned  */
                         /*        because string_value buffer  */
                         /*        too small then len_of_item   */
                         /*        holds the required size      */
} SQLSTMT_ATTR;

enum SQLATTRHOLDABLE_TYPE {
  SQL_NONHOLDABLE = 0,
  SQL_HOLDABLE    = 1
};

enum SESSIONATTR_TYPE {
  SESSION_ATTR_ID = 1,
  SESSION_PARENT_QID = 2

};

/* this list and their values must be the same as the
   enum QueryType in comexe/ComTdbRoot.h */
enum SQLATTRQUERY_TYPE {
  SQL_OTHER = -1,
  SQL_UNKNOWN = 0,
  SQL_SELECT_UNIQUE = 1,
  SQL_SELECT_NON_UNIQUE = 2,
  SQL_INSERT_UNIQUE = 3,
  SQL_INSERT_NON_UNIQUE = 4,
  SQL_UPDATE_UNIQUE = 5,
  SQL_UPDATE_NON_UNIQUE = 6,
  SQL_DELETE_UNIQUE = 7,
  SQL_DELETE_NON_UNIQUE = 8,
  SQL_CONTROL = 9,
  SQL_SET_TRANSACTION = 10,
  SQL_SET_CATALOG = 11,
  SQL_SET_SCHEMA = 12,
  SQL_CALL_NO_RESULT_SETS = 13,
  SQL_CALL_WITH_RESULT_SETS = 14,
  SQL_SP_RESULT_SET = 15,
  SQL_INSERT_RWRS = 16,

  /* same value as RWRS insert. identifier rowset_sidetree is obsolete and
     will be removed in future when no callers use this identifier.*/
  SQL_INSERT_ROWSET_SIDETREE = 16,

  /* utilities, like DUP, POPULATE, etc...implemented in catman. See
     sqlcomp/parser.cpp for complete list */
  SQL_CAT_UTIL = 17,

  /* complex util statements implemented in executor by converting them
     to multiple sql queries. See optimizer/RelMisc.h, class ExeUtilExpr */
  SQL_EXE_UTIL = 18, 

  /* R36 - Merge statement */
  SQL_MERGE = 19

};

enum SQLATTRATOMIC_TYPE {
  SQL_NOT_SPECIFIED = 0,
  SQL_ATOMIC = 1,
  SQL_NOT_ATOMIC = 2
};

enum SQLSTMT_STATE_TYPE {
  SQLSTMT_STATE_INITIAL = 0,
  SQLSTMT_STATE_OPEN = 1,
  SQLSTMT_STATE_EOF = 2,
  SQLSTMT_STATE_CLOSE = 3,
  SQLSTMT_STATE_DEALLOCATED = 4,
  SQLSTMT_STATE_FETCH = 5,
  SQLSTMT_STATE_CLOSE_TABLES = 6,
  SQLSTMT_STATE_PREPARE = 7,
  SQLSTMT_STATE_PROCESS_ENDED = 8,
  SQLSTMT_STATE_UNKNOWN
};

/* Neon: MXCI AUDIT RFE (Soln 10-051027-2235)
   Add new stats type for MEASURE_AND_PERTABLE option */
enum SQLSTATS_TYPE {
  
  SQLCLI_SAME_STATS    = 999,
  SQLCLI_NO_STATS      = 0,
  SQLCLI_MEASURE_STATS = 1,     
  SQLCLI_ACCUMULATED_STATS = 2, 
  SQLCLI_PERTABLE_STATS   = 3,  
  SQLCLI_ALL_STATS     = 4,
  SQLCLI_OPERATOR_STATS = 5,
  SQLCLI_CPU_OFFENDER_STATS = 6,
  SQLCLI_QID_DETAIL_STATS = 7,
  SQLCLI_DISK_OFFENDER_STATS = 8,
  SQLCLI_MEASURE_AND_PERTABLE = 9 
};
/* For the GetUniqueQueryIdAttrs interfaces.  */

enum UNIQUEQUERYID_ATTR_TYPE {
  /* segment number                                       */
  UNIQUEQUERYID_SEGMENTNUM   = 0,  

  /* segment name: max 10 bytes                           */
  UNIQUEQUERYID_SEGMENTNAME  = 1,  

  /* cpu number                                           */
  UNIQUEQUERYID_CPU          = 2,  

  /* pin of master exe process                            */
  UNIQUEQUERYID_PIN          = 3,  

  /* starttime of master exe process                      */
  UNIQUEQUERYID_EXESTARTTIME = 4,  

  /* unique session number                                */
  UNIQUEQUERYID_SESSIONNUM   = 5,
  
  /* null terminated user name: max 32 bytes              */
  UNIQUEQUERYID_USERNAME     = 6,  

  /* null terminated session name: max 24 bytes           */
  UNIQUEQUERYID_SESSIONNAME  = 7,  

  /* unique query num within a process                    */
  UNIQUEQUERYID_QUERYNUM     = 8,  

  /* null terminated user statement name: max 110 bytes   */
  UNIQUEQUERYID_STMTNAME     = 9,   

  /* null terminated session id:          max 104 bytes   */
  UNIQUEQUERYID_SESSIONID    = 10
};

typedef struct {
  Int32 attr_type;            /* IN: which attr (UNIQUEQUERYID_ATTR_TYPE)     */
  Int64 num_val_or_len;      /* IN: if string value, max length of string 
                    to return in string_val
                              Note: string_val buffer size should be one more than
                                     num_val_or_len to allow for a null terminator
                                OUT: if numeric value, the value. 
                                     if string value, the actual length of string_val returned */
  char * string_val;         /* OUT: if string value, null terminated string */
} UNIQUEQUERYID_ATTR;
  
#define MAX_TDB_NAME_LEN		35

enum STATS_REQ_TYPE {
    SQLCLI_STATS_REQ_NONE = -1,
    SQLCLI_STATS_REQ_STMT = 0,
    SQLCLI_STATS_REQ_CPU = 1,
    SQLCLI_STATS_REQ_PID = 2,
    SQLCLI_STATS_REQ_QID = 3,
    SQLCLI_STATS_REQ_QID_CURRENT = 4,
    SQLCLI_STATS_REQ_CPU_OFFENDER = 5,
    SQLCLI_STATS_REQ_QID_DETAIL = 6,
    SQLCLI_STATS_REQ_DISK_OFFENDER = 7,
    SQLCLI_STATS_REQ_FOR_RTSCLIENT = 8,
    SQLCLI_STATS_REQ_CONTROL_DS = 9,
    SQLCLI_STATS_REQ_UNIQUE = 10
};

/* 
R3.7 Graceful Query Cancel.
A new operand type for query cancel.
This is used while sending cancel message
to SSMP 
*/
 
enum CONTROL_REQ_TYPE {
  SQLCLI_CANCEL_REQ_QID    = 0,
  SQLCLI_CANCEL_REQ_MESQID = 1 
};


typedef struct {
  Int16 tdb_id;
  Int16 stats_type;
  char  tdb_name[MAX_TDB_NAME_LEN+1];
} SQLSTATS_DESC;

/* SQLSTATS_DESC stats type returned for various SQLSTATS_TYPE
  SQLSTATS_TYPE             Returned SQLSTATS_DESC_STATS_TYPEs

  SQLCLI_ACCUMULATED_STATS  SQLSTATS_DESC_MASTER_STATS
                            SQLSTATS_DESC_MEAS_STATS

  SQLCLI_PERTABLE_STATS     SQLSTATS_DESC_MASTER_STATS
                            SQLSTATS_DESC_ROOT_OPER_STATS
                            SQLSTATS_DESC_PERTABLE_STATS as many as the no. of tables in the query
                            
  SQLCLI_OPERATOR_STATS     SQLSTATS_DESC_MASTER_STATS
                            as many of the following as the no. of operators in the query
                            SQLSTATS_DESC_DP2_INSERT_STATS
                            SQLSTATS_DESC_DP2_LEAF_STATS
                            SQLSTATS_DESC_ESP_STATS
                            SQLSTATS_DESC_GROUP_BY_STATS
                            SQLSTATS_DESC_HASH_JOIN_STATS
                            SQLSTATS_DESC_OPER_STATS
                            SQLSTATS_DESC_PARTITION_ACCESS_STATS
                            SQLSTATS_DESC_PROBE_CACHE_STATS
                            SQLSTATS_DESC_ROOT_OPER_STATS                           
                            SQLSTATS_DESC_SORT_STATS
                            SQLSTATS_DESC_SPLIT_TOP_STATS
                            SQLSTATS_DESC_UDR_STATS,

*/
enum SQLSTATS_DESC_STATS_TYPE {
  SQLSTATS_DESC_OPER_STATS = 0,
  SQLSTATS_DESC_ROOT_OPER_STATS = 1,
  SQLSTATS_DESC_DP2_LEAF_STATS = 2,
  SQLSTATS_DESC_DP2_INSERT_STATS = 3,
  SQLSTATS_DESC_PARTITION_ACCESS_STATS = 4,
  SQLSTATS_DESC_GROUP_BY_STATS = 5,
  SQLSTATS_DESC_HASH_JOIN_STATS = 6,
  SQLSTATS_DESC_PROBE_CACHE_STATS = 7,
  SQLSTATS_DESC_ESP_STATS = 8,
  SQLSTATS_DESC_SPLIT_TOP_STATS = 9,
  SQLSTATS_DESC_MEAS_STATS = 10,
  SQLSTATS_DESC_PERTABLE_STATS = 11,
  SQLSTATS_DESC_SORT_STATS = 12,
  SQLSTATS_DESC_UDR_STATS = 13,
  SQLSTATS_DESC_NO_OP = 14,  
  SQLSTATS_DESC_MASTER_STATS = 15  
};


enum SQLSTATS_ITEM_ID {
/* SQLSTATS_ITEM_ID for SQLSTATS_DESC_MASTER_STATS */
  SQLSTATS_QUERY_ID = 0,
  SQLSTATS_COMP_START_TIME = 1,
  SQLSTATS_COMP_END_TIME = 2,
  SQLSTATS_COMP_TIME = 3,
  SQLSTATS_EXECUTE_START_TIME  = 4,
  SQLSTATS_FIRST_ROW_RET_TIME = 5,
  SQLSTATS_EXECUTE_END_TIME = 6,
  SQLSTATS_EXECUTE_TIME = 7,
  SQLSTATS_FIXUP_TIME = 8,
  SQLSTATS_STMT_STATE = 9,
  SQLSTATS_ROWS_AFFECTED = 10,
  SQLSTATS_SQL_ERROR_CODE = 11,
  SQLSTATS_STATS_ERROR_CODE = 12,
  SQLSTATS_QUERY_TYPE = 13,
  SQLSTATS_PARENT_QUERY_ID = 14,
  SQLSTATS_NUM_SQLPROCS = 15,
  SQLSTATS_NUM_CPUS = 16,
  SQLSTATS_SOURCE_STR = 17,
  SQLSTATS_MASTER_PRIORITY = 18,
  SQLSTATS_TRANSID = 19,
/* SQLSTATS_ITEM_ID for SQLSTATS_DESC_MASTER_STATS and SQLSTATS_DESC_PERTABLE_STATS */
  SQLSTATS_EST_ROWS_ACCESSED = 20,
  SQLSTATS_EST_ROWS_USED = 21,
/* SQLSTATS_ITEM_ID for SQLSTATS_DESC_MEAS_STATS and SQLSTATS_DESC_PERTABLE_STATS */
  SQLSTATS_ACT_ROWS_ACCESSED = 30,
  SQLSTATS_ACT_ROWS_USED = 31,
  SQLSTATS_MSG_COUNT = 32,
  SQLSTATS_MSG_BYTES = 33,
  SQLSTATS_STATS_BYTES = 34,
  SQLSTATS_DISK_IOS = 35,
  SQLSTATS_LOCK_WAITS = 36,
  SQLSTATS_LOCK_ESCALATIONS = 37,
  SQLSTATS_DP2_CPU_BUSY_TIME = 38,
/* SQLSTATS_ITEM_ID for SQLSTATS_DESC_MEAS_STATS and SQLSTATS_DESC_ROOT_OPER_STATS */
  SQLSTATS_SQL_CPU_BUSY_TIME = 50,
  SQLSTATS_SQL_SPACE_ALLOC = 51,
  SQLSTATS_SQL_SPACE_USED = 52,
  SQLSTATS_SQL_HEAP_ALLOC = 53,
  SQLSTATS_SQL_HEAP_USED = 54,
  SQLSTATS_EID_SPACE_ALLOC = 55,
  SQLSTATS_EID_SPACE_USED = 56,
  SQLSTATS_EID_HEAP_ALLOC = 57,
  SQLSTATS_EID_HEAP_USED = 58,
  SQLSTATS_OPENS = 59,
  SQLSTATS_OPEN_TIME = 60,
  SQLSTATS_PROCESS_CREATED = 61,
  SQLSTATS_PROCESS_CREATE_TIME = 62,
  SQLSTATS_REQ_MSG_CNT = 63,
  SQLSTATS_REQ_MSG_BYTES = 64,
  SQLSTATS_REPLY_MSG_CNT = 65,
  SQLSTATS_REPLY_MSG_BYTES = 66,
/* SQLSTATS_ITEM_ID for SQLSTATS_DESC_PERTABLE_STATS */
  SQLSTATS_TABLE_ANSI_NAME = 70,
/* SQLSTATS_ITEM_ID for Operator level Stats */
  SQLSTATS_EXPLAIN_NODE_ID = 80,
  SQLSTATS_NUM_CALLS = 81,
  SQLSTATS_TDB_ID = 82,
  SQLSTATS_TDB_NAME = 83,
  SQLSTATS_LEFT_CHILD = 84,
  SQLSTATS_RIGHT_CHILD = 85
 
};

typedef struct {
    Int16  tdb_id;
    Int16  stats_type;
    Int16  statsItem_id; /* SQLSTATS_ITEM_ID */
    Int64 int64_value;
    Float64 double_value;
    char   *str_value;
    Int32   str_max_len;
    Int32   str_ret_len;
    Int32   error_code;
} SQLSTATS_ITEM;


/* used in call to SQLCLI_Prepare2 */
enum PREPARE_FLAGS
{
  /* A standalone and not an explicitely PREPAREd query */
  PREPARE_STANDALONE_QUERY   = 0x0001,

  /* prepare being issued as part of an internal AQR */
  PREPARE_AUTO_QUERY_RETRY   = 0x0002,

  /* prepare for old style automatic recomp */
  PREPARE_RECOMP             = 0x0004,

  /* prepare should deallocate and reload cache in mxcmp */
  PREPARE_WITH_DECACHE       = 0x0008,

  /* prepare should not use query text cache */
  PREPARE_NO_TEXT_CACHE      = 0x0010,

  /* set when prepare is redriven for nowaited case */
  PREPARE_NOT_A_NEW_OPERATION = 0x0020,

  /* set when IOP static compilation is required */
  PREPARE_IOP_STATIC_COMPILE  = 0x0040
};

#define MAX_DBNAME_LEN    128
#define MAX_DSNAME_LEN    128
#define MAX_WMSNAME_LEN   96
#define MAX_APPNAME_LEN   120
#define MAX_SYSNAME_LEN   64
#define MAX_SESS_USERNAME_LEN  128
#define MAX_PROCNAME_LEN 6
typedef struct 
{
  /* !!! Do not reorder below items, make sure the order is sync with struct
         RTS_Session_Info
  */
  Int64   tenantId; 
  short   wmsServiceNameLen;
  short   applicationNameLen;
  short   computerNameLen;
  char    tenantDbName[MAX_DBNAME_LEN + 1];
  char    dataSourceName[MAX_DSNAME_LEN + 1];
  char    wmsServiceName[MAX_WMSNAME_LEN];
  char    applicationName[MAX_APPNAME_LEN];
  char    computerName[MAX_SYSNAME_LEN];
  char    userName[MAX_SESS_USERNAME_LEN + 1];
  Int32   dataSourceId;
  char    mxcsName[MAX_PROCNAME_LEN+ 1];
} SQLSESSION_INFO; 


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AddModule (
        /*IN*/ SQLMODULE_ID * module_name);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ADDMODULE (
        /*IN*/ SQLMODULE_ID * module_name);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DropModule(
        /*IN*/ SQLMODULE_ID * module_name);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DROPMODULE(
        /*IN*/ SQLMODULE_ID * module_name);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AllocDesc (
            /*INOUT*/ SQLDESC_ID * desc_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ALLOCDESC (
            /*INOUT*/ SQLDESC_ID * desc_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AllocDescBasic (
            /*INOUT*/ SQLDESC_ID * desc_id,
        /*IN OPTIONAL*/ Int32 max_entries);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AssocFileNumber (
                /*IN*/ SQLSTMT_ID * statement_id,
            /*IN*/ Int16        file_number);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ASSOCFILENUMBER (
                /*IN*/ SQLSTMT_ID * statement_id,
            /*IN*/ Int16        file_number);

 /* R3.5 DC DATE */
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ReadSessionDefault(
    /*IN*/ Int32 attr,
    /*OUT*/ char * attrValue, 
    /*OUT*/ Int32 * attrValueLen,
    /*OUT*/ Int32 * displayLen);

enum SessionDefaultType{
    SESSIONDEFAULT_DATEFORMAT = 1

};

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AllocStmt (
        /*INOUT*/ SQLSTMT_ID * new_statement_id,
        /*IN OPTIONAL*/ SQLSTMT_ID * cloned_statement);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ALLOCSTMT (
        /*INOUT*/ SQLSTMT_ID * new_statement_id,
        /*IN OPTIONAL*/ SQLSTMT_ID * cloned_statement);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AllocStmtForRS (
                /*IN*/ SQLSTMT_ID *callStmtId,
                /*IN*/ Int32 resultSetIndex,
                /*INOUT*/ SQLSTMT_ID *resultSetStmtId);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ALLOCSTMTFORRS (
                /*IN*/ SQLSTMT_ID *callStmtId,
                /*IN*/ Int32 resultSetIndex,
                /*INOUT*/ SQLSTMT_ID *resultSetStmtId);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ClearDiagnostics (/*IN*/ SQLSTMT_ID *statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_CLEARDIAGNOSTICS (/*IN*/ SQLSTMT_ID *statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_CLI_VERSION ();

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_CloseStmt (
        /*IN*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_CLOSESTMT (
        /*IN*/ SQLSTMT_ID * statement_id);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_CreateContext(/*OUT*/ SQLCTX_HANDLE * context_handle,
                /*IN OPTIONAL*/ char* sqlAuthId, 
                /*IN OPTIONAL*/ Int32 suppressAutoXactStart);
  
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_CREATECONTEXT(/*OUT*/ SQLCTX_HANDLE * context_handle,
                /*IN OPTIONAL*/ char* sqlAuthId, 
                /*IN OPTIONAL*/ Int32 suppressAutoXactStart);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_CurrentContext(/*OUT*/ SQLCTX_HANDLE * contextHandle);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_CURRENTCONTEXT(/*OUT*/ SQLCTX_HANDLE * contextHandle);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_DeleteContext(/*IN*/ SQLCTX_HANDLE contextHandle);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_DELETECONTEXT(/*IN*/ SQLCTX_HANDLE contextHandle);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_ResetContext(/*IN*/ SQLCTX_HANDLE contextHandle, /*IN*/ void *contextMsg);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_RESETCONTEXT(/*IN*/ SQLCTX_HANDLE contextHandle, /*IN*/ void *contextMsg);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DeallocDesc (
        /*IN*/ SQLDESC_ID * desc_id );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DEALLOCDESC (
        /*IN*/ SQLDESC_ID * desc_id );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DeallocStmt (
        /*IN*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DEALLOCSTMT (
        /*IN*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DefineDesc (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN* (SQLWHAT_DESC) */ Int32 what_descriptor,
        /*IN*/ SQLDESC_ID * sql_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DEFINEDESC (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN* (SQLWHAT_DESC) */ Int32 what_descriptor,
        /*IN*/ SQLDESC_ID * sql_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DescribeStmt (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DESCRIBESTMT (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_DisassocFileNumber(/*IN*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC
Int32 SQL_EXEC_DISASSOCFILENUMBER(/*IN*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DropContext (
        /*IN*/ SQLCTX_HANDLE context_handle );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DROPCONTEXT (
        /*IN*/ SQLCTX_HANDLE context_handle );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_Exec (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_EXEC (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ExecClose (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_EXECCLOSE (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ExecDirect(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLDESC_ID * sql_source,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_EXECDIRECT (
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLDESC_ID * sql_source,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ExecDirectDealloc(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLDESC_ID * sql_source,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_EXECDIRECTDEALLOC(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLDESC_ID * sql_source,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ExecFetch(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_EXECFETCH(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
/*
    New CLI interface introduced for MXCS , SOl 10-140602-2127
*/
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ExecFetch2(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_EXECFETCH2(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ClearExecFetchClose(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor,
        /*IN*/ Int32 num_input_ptr_pairs,
        /*IN*/ Int32 num_output_ptr_pairs,
        /*IN*/ Int32 num_total_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_CLEAREXECFETCHCLOSE(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * input_descriptor,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor,
        /*IN*/ Int32 num_input_ptr_pairs,
        /*IN*/ Int32 num_output_ptr_pairs,
        /*IN*/ Int32 num_total_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS input_ptr_pairs[],
        /*IN*/ SQLCLI_PTR_PAIRS output_ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_Fetch(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_FETCH(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_FetchClose(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_FETCHCLOSE(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN OPTIONAL*/ SQLDESC_ID * output_descriptor,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_FetchMultiple(/*IN*/ SQLSTMT_ID * statement_id,
                            /*IN  OPTIONAL*/ SQLDESC_ID * output_descriptor,
                            /*IN*/                 Int32   rowset_size,
                            /*IN*/                 Int32 * rowset_status_ptr,
                            /*OUT*/                Int32 * rowset_nfetched,
                            /*IN*/                 Int32   num_quadruple_fields,
                                            ...);
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_FETCHMULTIPLE(/*IN*/ SQLSTMT_ID * statement_id,
                            /*IN  OPTIONAL*/ SQLDESC_ID * output_descriptor,
                            /*IN*/                 Int32   rowset_size,
                            /*IN*/                 Int32 * rowset_status_ptr,
                            /*OUT*/                Int32 * rowset_nfetched,
                            /*IN*/                 Int32   num_quadruple_fields,
                            /*IN*/   struct SQLCLI_QUAD_FIELDS   quad_fields[]);
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_Cancel (
        /*IN OPTIONAL*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_CANCEL (
        /*IN OPTIONAL*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescEntryCount(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDESCENTRYCOUNT(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif

SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescEntryCountBasic(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*OUT*/ Int32 * num_entries);
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescItem(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 entry,
        /*IN* (SQLDESC_ITEM_ID) */ Int32 what_to_get,
        /*OUT OPTIONAL*/ Int32 * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL*/ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item,
        /*IN OPTIONAL*/ Int32 start_from_offset);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDESCITEM(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 entry,
        /*IN* (SQLDESC_ITEM_ID) */ Int32 what_to_get,
        /*OUT OPTIONAL*/ Int32 * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL*/ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item,
        /*IN OPTIONAL*/ Int32 start_from_offset);

/* EXE64 */
#ifdef __LP64

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif

SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescItem2(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 entry,
        /*IN* (SQLDESC_ITEM_ID) */ Int32 what_to_get,
        /*OUT OPTIONAL*/ long * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL*/ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item,
        /*IN OPTIONAL*/ Int32 start_from_offset);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDESCITEM2(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 entry,
        /*IN* (SQLDESC_ITEM_ID) */ Int32 what_to_get,
        /*OUT OPTIONAL*/ long * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL*/ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item,
        /*IN OPTIONAL*/ Int32 start_from_offset);


#else

#define SQL_EXEC_GetDescItem2 SQL_EXEC_GetDescItem
#define SQL_EXEC_GETDESCITEM2 SQL_EXEC_GETDESCITEM

#endif

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescItems(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ITEM desc_items[],
        /*IN*/ SQLDESC_ID * value_num_descriptor,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDESCITEMS(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ITEM desc_items[],
        /*IN*/ SQLDESC_ID * value_num_descriptor,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescItems2(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 no_of_desc_items,
        /*IN*/ SQLDESC_ITEM desc_items[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDESCITEMS2(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 no_of_desc_items,
        /*IN*/ SQLDESC_ITEM desc_items[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDiagnosticsStmtInfo(
        /*IN*/ Int32 *stmt_info_items,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDIAGNOSTICSSTMTINFO(
        /*IN*/ Int32 *stmt_info_items,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDiagnosticsStmtInfo2(
        /*IN OPTIONAL*/ SQLSTMT_ID * statement_id,
        /*IN* (SQLDIAG_STMT_INFO_ITEM_ID) */ Int32 what_to_get,
        /*OUT OPTIONAL*/ Int32 * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL*/ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDIAGNOSTICSSTMTINFO2(
        /*IN OPTIONAL*/ SQLSTMT_ID * statement_id,
        /*IN* (SQLDIAG_STMT_INFO_ITEM_ID) */ Int32 what_to_get,
        /*OUT OPTIONAL*/ Int32 * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL*/ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDiagnosticsCondInfo(
        /*IN*/ SQLDIAG_COND_INFO_ITEM *cond_info_items,
        /*IN*/ SQLDESC_ID * cond_num_descriptor,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDIAGNOSTICSCONDINFO(
        /*IN*/ SQLDIAG_COND_INFO_ITEM *cond_info_items,
        /*IN*/ SQLDESC_ID * cond_num_descriptor,
        /*IN*/ SQLDESC_ID * output_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDiagnosticsCondInfo2(
        /*IN* (SQLDIAG_COND_INFO_ITEM_ID) */ Int32 what_to_get,
        /*IN*/ Int32 conditionNum,
        /*OUT OPTIONAL*/ Int32 * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL */ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETDIAGNOSTICSCONDINFO2(
        /*IN* (SQLDIAG_COND_INFO_ITEM_ID) */ Int32 what_to_get,
        /*IN*/ Int32 conditionNum,
        /*OUT OPTIONAL*/ Int32 * numeric_value,
        /*OUT OPTIONAL*/ char * string_value,
        /*IN OPTIONAL */ Int32 max_string_len,
        /*OUT OPTIONAL*/ Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC	Int32 SQL_EXEC_GetDiagnosticsCondInfo3 (
        /*IN*/ Int32 no_of_condition_items,
        /*IN*/ SQLDIAG_COND_INFO_ITEM_VALUE
              diag_cond_info_item_values[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC	Int32 SQL_EXEC_GETDIAGNOSTICSCONDINFO3 (
        /*IN*/ Int32 no_of_condition_items,
        /*IN*/ SQLDIAG_COND_INFO_ITEM_VALUE
              diag_cond_info_item_values[]);

/* This function retrieves the SQLSTATE from the statement diagnostics area
   if possible */  
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetMainSQLSTATE(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/  Int32 sqlcode,
        /*OUT*/ char * sqlstate /* assumed to be char[6] */);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETMAINSQLSTATE(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/  Int32 sqlcode,
        /*OUT*/ char * sqlstate /* assumed to be char[6] */);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetCSQLSTATE(
        /*OUT*/ char * sqlstate /* assumed to be char[6] */,
        /*IN*/  Int32 sqlcode);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETCSQLSTATE(
        /*OUT*/ char * sqlstate /* assumed to be char[6] */,
        /*IN*/  Int32 sqlcode);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetCobolSQLSTATE(
        /*OUT*/ char * sqlstate /* assumed to be char[5] */,
        /*IN*/  Int32 sqlcode);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETCOBOLSQLSTATE(
        /*OUT*/ char * sqlstate /* assumed to be char[5] */,
        /*IN*/  Int32 sqlcode);
        
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetSQLSTATE(
        /*OUT*/ char * sqlstate /* assumed to be char[6] */);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETSQLSTATE(
        /*OUT*/ char * sqlstate /* assumed to be char[6] */);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetStatistics(
                /*IN OPTIONAL*/ SQLSTMT_ID * statement_id,
        /*INOUT*/ SQL_QUERY_STATISTICS *query_statistics);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETSTATISTICS(
        /*IN OPTIONAL*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetSessionAttr(
        /*IN* (SESSIONATTR_TYPE) */ Int32 attrName,
        /*OUT OPTIONAL*/        Int32 * numeric_value,
        /*OUT OPTIONAL*/        char * string_value,
        /*IN OPTIONAL*/         Int32   max_string_len,
        /*OUT OPTIONAL*/        Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC	Int32 SQL_EXEC_GetUniqueQueryIdAttrs (
                /*IN*/    char * uniqueQueryId,
        /*IN*/    Int32 uniqueQueryIdLen,
        /*IN*/    Int32 no_of_attrs,
        /*INOUT*/ UNIQUEQUERYID_ATTR unique_queryid_attrs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetStmtAttr(
                /*IN*/                  SQLSTMT_ID * statement_id,
        /*IN* (SQLATTR_TYPE) */ Int32 attrName,
        /*OUT OPTIONAL*/        Int32 * numeric_value,
        /*OUT OPTIONAL*/        char * string_value,
        /*IN OPTIONAL*/         Int32   max_string_len,
        /*OUT OPTIONAL*/        Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETSTMTATTR(
                /*IN*/                  SQLSTMT_ID * statement_id,
        /*IN* (SQLATTR_TYPE) */ Int32 attrName,
        /*OUT OPTIONAL*/        Int32 * numeric_value,
        /*OUT OPTIONAL*/        char * string_value,
        /*IN OPTIONAL*/         Int32   max_string_len,
        /*OUT OPTIONAL*/        Int32 * len_of_item);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetStmtAttrs(
                /*IN*/                  SQLSTMT_ID * statement_id,
                /*IN*/                  Int32 number_of_attrs,
        /*INOUT*/               SQLSTMT_ATTR attrs[],
        /*OUT OPTIONAL*/        Int32 * num_returned);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETSTMTATTRS(
                /*IN*/                  SQLSTMT_ID * statement_id,
                /*IN*/                  Int32 number_of_attrs,
        /*INOUT*/               SQLSTMT_ATTR attrs[],
        /*OUT OPTIONAL*/        Int32 * num_returned);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GETMPCATALOG(
        /*IN*/    char * AnsiObjName,
        /*INOUT*/ char * MPObjName,
        /*IN*/    Int32   MPObjNameMaxLen,
        /*INOUT*/ Int32 * MPObjNameLen,
        /*OUT*/   char * MPCatalogName,
        /*IN*/    Int32   MPCatalogNameMaxLen,
        /*OUT*/   Int32 * MPCatalogNameLen);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GoAway(
                /*IN*/ SQLDESC_ID * tableNameDesc);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GOAWAY(
                /*IN*/ SQLDESC_ID * tableNameDesc);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_Prepare(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLDESC_ID * sql_source);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_PREPARE(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLDESC_ID * sql_source);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_Prepare2(
     /*IN*/    SQLSTMT_ID * statement_id,
     /*IN*/    SQLDESC_ID * sql_source,
     /*INOUT*/ char * gencode_ptr,
     /*IN*/    Int32   gencode_len,
     /*INOUT*/ Int32 * ret_gencode_len,
     /*INOUT*/ SQL_QUERY_COST_INFO *query_cost_info,
     /*INOUT*/ SQL_QUERY_COMPILER_STATS_INFO *comp_stats_info,
     /*INOUT*/ char * uniqueQueryId,
     /*INOUT*/ Int32 * uniqueQueryIdLen);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ResDescName(
        /*INOUT*/ SQLDESC_ID * statement_id,
        /*IN OPTIONAL*/ SQLSTMT_ID * from_statement,
        /*IN OPTIONAL (SQLWHAT_DESC) */ Int32 what_desc);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_RESDESCNAME(
        /*INOUT*/ SQLDESC_ID * statement_id,
        /*IN OPTIONAL*/ SQLSTMT_ID * from_statement,
        /*IN OPTIONAL (SQLWHAT_DESC) */ Int32 what_desc);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_ResStmtName(
        /*INOUT*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_RESSTMTNAME(
        /*INOUT*/ SQLSTMT_ID * statement_id);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetCursorName(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLSTMT_ID * cursor_name);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETCURSORNAME(
        /*IN*/ SQLSTMT_ID * statement_id,
        /*IN*/ SQLSTMT_ID * cursor_name);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescEntryCount(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ID * input_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETDESCENTRYCOUNT(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ID * input_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescEntryCountBasic(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 num_entries);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescItem(
                /*IN*/ SQLDESC_ID * sql_descriptor,
                /*IN*/ Int32 entry,
                /*IN* (SQLDESC_ITEM_ID) */ Int32 what_to_set,
                /*IN OPTIONAL*/ long   numeric_value,
                /*IN OPTIONAL*/ char * string_value);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETDESCITEM(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 entry,
        /*IN* (SQLDESC_ITEM_ID) */ Int32 what_to_set,
        /*IN OPTIONAL*/ Int32 numeric_value,
        /*IN OPTIONAL*/ char * string_value);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescItems(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ITEM desc_items[],
        /*IN*/ SQLDESC_ID * value_num_descriptor,
        /*IN*/ SQLDESC_ID * input_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETDESCITEMS(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ SQLDESC_ITEM desc_items[],
        /*IN*/ SQLDESC_ID * value_num_descriptor,
        /*IN*/ SQLDESC_ID * input_descriptor);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescItems2(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 no_of_desc_items,
        /*IN*/ SQLDESC_ITEM desc_items[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETDESCITEMS2(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 no_of_desc_items,
        /*IN*/ SQLDESC_ITEM desc_items[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescPointers(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 starting_entry,
        /*IN*/ Int32 num_ptr_pairs,
                ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETDESCPOINTERS(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 starting_entry,
        /*IN*/ Int32 num_ptr_pairs,
        /*IN*/ SQLCLI_PTR_PAIRS ptr_pairs[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetRowsetDescPointers(SQLDESC_ID * desc_id,
                                           Int32    rowset_size,
                                           Int32    *rowset_status_ptr,
                                           Int32    starting_entry,
                                           Int32    num_quadruple_fields,
                                           ...);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETROWSETDESCPOINTERS(SQLDESC_ID * desc_id,
                                           Int32    rowset_size,
                                           Int32    *rowset_status_ptr,
                                           Int32    starting_entry,
                                           Int32    num_quadruple_fields,
                             struct SQLCLI_QUAD_FIELDS    quad_fields[]);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetStmtAttr(
                /*IN*/                  SQLSTMT_ID * statement_id,
        /*IN* (SQLATTR_TYPE) */ Int32 attrName,
        /*IN OPTIONAL*/         Int32 numeric_value,
        /*IN OPTIONAL*/         char * string_value);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETSTMTATTR(
                /*IN*/                  SQLSTMT_ID * statement_id,
        /*IN* (SQLATTR_TYPE) */ Int32 attrName,
        /*IN OPTIONAL*/         Int32 numeric_value,
        /*IN OPTIONAL*/         char * string_value);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SwitchContext(
        /*IN*/ SQLCTX_HANDLE context_handle,
        /*OUT OPTIONAL*/ SQLCTX_HANDLE * prev_context_handle);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SWITCHCONTEXT(
        /*IN*/ SQLCTX_HANDLE context_handle,
        /*OUT OPTIONAL*/ SQLCTX_HANDLE * prev_context_handle);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_Xact(
        /*IN* (SQLTRANS_COMMAND) */ Int32 command,
        /*OUT OPTIONAL*/ SQLDESC_ID * transid_descriptor); 

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_XACT(
        /*IN* (SQLTRANS_COMMAND) */ Int32 command,
        /*OUT OPTIONAL*/ SQLDESC_ID * transid_descriptor); 

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetAuthID(
        /*IN*/                 char   * authID,
        /*IN SQLAUTHID_TYPE */ Int32     authIDType);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SETAUTHID(
        /*IN*/                 char   * authID,
        /*IN SQLAUTHID_TYPE */ Int32     authIDType);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_DecodeAndFormatKey(
               /*IN*/Int32    RCB_Pointer_Addr,    
           /*IN*/Int32    KeyAddr,             
           /*IN*/Int32    KeyLength,          
           /*INOUT*/Int32 DecodedKeyBufAddr,   
           /*INOUT*/Int32 FormattedKeyBufAddr, 
           /*IN*/Int32    FormattedKeyBufLen,  
           /*OUT*/Int32 * NeededKeyBufLen  );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetPartitionKeyFromRow(
           /*IN*/Int32    RCB_Pointer_Addr,    
           /*IN*/Int32    Row_Addr,          
           /*IN*/Int32    Row_Length,        
           /*INOUT*/Int32 KeyAddr,
           /*IN*/Int32    KeyLength);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_LocaleToUTF8 (
               /*IN*/Int32 conv_charset,
               /*IN*/Int32 Input_Buffer_Addr,
               /*IN*/Int32 Input_Buffer_Length,
               /*IN/OUT*/Int32 Output_Buffer_Addr,
               /*IN*/Int32 Output_Buffer_Length,
               /*OUT*/Int32 * First_Untranslated_Char_Addr,
               /*OUT*/Int32 *Output_Data_Length,
               /*IN*/Int32 add_null_at_end_Flag,
               /*OUT*/Int32 *num_translated_char
   );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_UTF8ToLocale(
               /*IN*/Int32 conv_charset,
               /*IN*/Int32 Input_Buffer_Addr,
               /*IN*/Int32 Input_Buffer_Length,
               /*IN/OUT*/Int32 Output_Buffer_Addr,
               /*IN*/Int32 Output_Buffer_Length,
               /*OUT*/Int32 * First_Untranslated_Char_Addr,
               /*OUT*/Int32 *Output_Data_Length,
               /*IN*/Int32 add_null_at_end_Flag,
               /*IN*/Int32 allow_invalids,
               /*OUT*/Int32 *num_translated_char,
               /*IN*/Int32 substitution_char_addr
   );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_LocaleToUTF16 (
               /*IN*/Int32 conv_charset,
               /*IN*/Int32 Input_Buffer_Addr,
               /*IN*/Int32 Input_Buffer_Length,
               /*IN/OUT*/Int32 Output_Buffer_Addr,
               /*IN*/Int32 Output_Buffer_Length,
               /*OUT*/Int32 * First_Untranslated_Char_Addr,
               /*OUT*/Int32 *Output_Data_Length,
               /*IN*/Int32 conv_flags,
               /*IN*/Int32 add_null_at_end_Flag,
               /*OUT*/Int32 *num_translated_char
   );

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_UTF16ToLocale(
               /*IN*/Int32 conv_charset,
               /*IN*/long Input_Buffer_Addr,
               /*IN*/Int32 Input_Buffer_Length,
               /*IN/OUT*/long Output_Buffer_Addr,
               /*IN*/Int32 Output_Buffer_Length,
               /*OUT*/Int32 * First_Untranslated_Char_Addr,
               /*OUT*/Int32 *Output_Data_Length,
               /*IN*/Int32 conv_flags,
               /*IN*/Int32 add_null_at_end_Flag,
               /*IN*/Int32 allow_invalids,
               /*OUT*/Int32 *num_translated_char,
               /*IN*/Int32 substitution_char_addr
   );
#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetStatistics2(
            /* IN */  	Int16 statsReqType,
        /* IN */  	char *statsReqStr,
        /* IN */  	Int32 statsReqStrLen,
        /* IN */	Int16 activeQueryNum,
        /* IN */ 	Int16 statsMergeType,
        /* OUT */ 	Int16 *statsCollectType,
        /* IN/OUT */ 	SQLSTATS_DESC sqlstats_desc[],
        /* IN */ 	Int32 max_stats_desc,
        /* OUT */	Int32 *no_returned_stats_desc);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetStatisticsItems(
            /* IN */  	Int16 statsReqType,
        /* IN */  	char *queryId,
        /* IN */  	Int32 queryIdLen,
            /* IN */	Int32 no_of_stats_items,
        /* IN/OUT */   SQLSTATS_ITEM sqlstats_items[]);

/* Wrapper methods over the BigNumHelper class to provide some limited support
 * for operations on bignum data outside the database.
 */

/* Representation of a bignum.
 * A bignum is represented as an array of shorts. Each array element is called a
 * chunk. Data is stored in the chunks in hexadecimal format. The chunks are in
 * little-endian order - the first chunk is the least significant one. The sign
 * of the bignum is stored in the last chunk's sign bit. The number of chunks is
 * maintained separately.
 *
 * There is no separate representation for an unsigned bignum. The parameters to
 * these methods do not specify whether the bignum was declared as unsigned. All
 * bignums are treated as signed data and so, it is possible to assign negative
 * values to an unsigned bignum.
 */
typedef Int16 *BignumExt;

/* Assign one bignum to another. */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumAssign(BignumExt result, UInt16 resultLen,
                       BignumExt valOp, UInt16 valOpLen);

/* Assign a signed Int64 to a bignum.
 * This method is useful for setting the bignum to a constant value, like 0.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumAssignI64(BignumExt result, UInt16 resultLen, Int64 valOp);

/* Convert a bignum to a signed Int64.
 * This can result in a numeric overflow error if the value is too big to fit
 * in an Int64.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumI64Assign(Int64 *result, BignumExt valOp, UInt16 valOpLen);

/* Compare one bignum with another and return the result in result.
 * result is 0, if operand1 is equal to operand2.
 * result is 1, if operand1 is greater than operand2.
 * result is -1, if operand1 is lesser than operand2.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumCmp(Int16 *result,
                    BignumExt operand1, UInt16 operand1Len,
                    BignumExt operand2, UInt16 operand2Len);

/* Convert a string to a bignum.
 * The string represents the number in ASCII format. It may contain a leading
 * sign. It must not contain a decimal point - the scale is implicit and must
 * be handled by the caller. It must not be null-terminated.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumFromStr(BignumExt result, UInt16 resultLen,
                        char const *str, UInt16 strLen);

/* Convert a bignum to its string format.
 * The string is returned in ASCII format. The required size for the output
 * buffer is precision + 1 byte for the sign. If the buffer is bigger than
 * the size required to represent the bignum value, it is blank-padded to the
 * right. The buffer is not null-terminated. The output will not contain a
 * decimal point - the scale is implicit and must be handled by the caller.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumToStr(char *result, UInt16 resultLen,
                      BignumExt bnValue, UInt16 bnValueLen);

/* Compute the storage length, in bytes, for a given precision.
 * This can be used by dynamic programs to determine how big a buffer to
 * allocate.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
UInt16 SQL_BignumSize(UInt16 precision);

/* Add operand2 to operand1 and return the sum in result.
 * operand1, operand2 and result must have the same length and scale.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumAdd(BignumExt result,
                    BignumExt operand1,
                    BignumExt operand2,
                    UInt16 len);

/* Subtract operand2 from operand1 and return the difference in result.
 * operand1, operand2 and result must have the same length and scale.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumSub(BignumExt result,
                    BignumExt operand1,
                    BignumExt operand2,
                    UInt16 len);

/* Multiply operand1 by operand2 and return the product in result. */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumMul(BignumExt result, UInt16 resultLen,
                    BignumExt operand1, UInt16 operand1Len,
                    BignumExt operand2, UInt16 operand2Len);

/* Divide operand1 by operand2 and return the quotient in result.
 * If the return code is 0, the division did not produce a remainder.
 * If the return code is 1, the division resulted in a remainder.
 * If the return code is negative, an error occurred during the processing.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumDiv(BignumExt result, UInt16 resultLen,
                    BignumExt operand1, UInt16 operand1Len,
                    BignumExt operand2, UInt16 operand2Len);

/* Return the sign of the bignum in sign.
 * sign is set to 0 for positive values and -1 for negative ones.
 */
#if (defined (NA_NSK)) && defined (CLI_LIB) /* Cognac */
export$
#endif
SQLCLI_LIB_FUNC
Int32 SQL_BignumSign(Int16 *sign, BignumExt value, UInt16 valueLen);

#ifdef __cplusplus
}

/* temporary functions -- for use by sqlcat simulator only */

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_AllocDesc (
            /*INOUT*/ SQLDESC_ID * desc_id,
        /*IN OPTIONAL*/ Int32 max_entries);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_GetDescEntryCount(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*OUT*/ Int32 * num_entries);

#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetDescEntryCount(
        /*IN*/ SQLDESC_ID * sql_descriptor,
        /*IN*/ Int32 num_entries);


#if defined (NA_MIPS) && (CLI_LIB)
#pragma srlexports
#endif
SQLCLI_LIB_FUNC Int32 SQL_EXEC_SetSessionInfo(SQLSESSION_INFO* info);

#endif /*__cplusplus*/

#endif /*SQLCLI_HDR*/

/* Hewlett Packard Enterprise NonStop(TM) SQL/MX C/C++ Preprocessor 3.9.1 -- main body of generated source. */

#pragma push warn
#pragma nowarn
static long __SQL_internal_retcode;
#pragma pop warn
extern SQLMODULE_ID __SQL_mod_123456091462969012;
#line 1 "c:\\ABM\\T3\\src\\p3c.ec"

/***************************************************** 
*              SQL/MX Programming Class              * 
*       Lab 3 C Source File Using ANSI Names         *
******************************************************/

/* Standard includes                                */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/*    Function prototypes,                          */

void process_query (void);


/*  Global declarations                             */

#define NULL_TERMINATE(x)  x[sizeof(x) -1] = '\0'
#define SQL_OPERATION_OK 0
#define ROW_NOT_FOUND      100


/*   Global host variable declarations               */

 /* EXEC SQL MODULE SAMDBCAT.PERSNL.LAB2 NAMES ARE ISO88591; */
#line 29 "c:\\ABM\\T3\\src\\p3c.ec"

 /* EXEC SQL DECLARE NAMETYPE 'ANSI'; */
#line 31 "c:\\ABM\\T3\\src\\p3c.ec"
 
 /* EXEC SQL DECLARE SCHEMA 'SAMDBCAT.PERSNL'; */
#line 33 "c:\\ABM\\T3\\src\\p3c.ec"


 /* EXEC SQL BEGIN DECLARE SECTION; */
#line 36 "c:\\ABM\\T3\\src\\p3c.ec"

 long   SQLCODE;
 char SQLSTATE[6];

 struct {
    unsigned short   empnum;
    char first_name[16];
    char last_name[21];
    struct {
      short indicator;
      unsigned short valu;
    }jobcode;  
  }employee_rec;

 /* EXEC SQL  INVOKE job AS job_rec; *//* Beginning of generated code for SQL INVOKE */
struct  job_rec{
  unsigned short jobcode;
  char /* CHARACTER SET ISO88591 */ jobdesc[19];
 };


#line 51 "c:\\ABM\\T3\\src\\p3c.ec"
 struct job_rec job_rec1;

 int emp_jobcode;

/* EXEC SQL END DECLARE SECTION; */
#line 56 "c:\\ABM\\T3\\src\\p3c.ec"

 int count;

/************************************************************
*
*                 Main Function
*
*************************************************************/

int main (void)
{
   count = 0;
   SQLSTATE[5] = '\0';

   /* EXEC SQL BEGIN WORK; */
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
{
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id0 = {
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
11, stmt_name, &__SQL_mod_123456091462969012, "SQLMX_DEFAULT_STATEMENT_4"
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
,0, 0, 
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
25, 0, 0};
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
if (SQLCODE = SQL_EXEC_ClearExecFetchClose(&__SQL_id0,0,0,0,0,0))
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
{}
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"

#line 70 "c:\\ABM\\T3\\src\\p3c.ec"
SQL_EXEC_GetCSQLSTATE(SQLSTATE,SQLCODE);}
#line 70 "c:\\ABM\\T3\\src\\p3c.ec"


   process_query ();

   /* EXEC SQL COMMIT WORK; */
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
{
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id0 = {
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
11, stmt_name, &__SQL_mod_123456091462969012, "SQLMX_DEFAULT_STATEMENT_5"
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
,0, 0, 
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
25, 0, 0};
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
if (SQLCODE = SQL_EXEC_ClearExecFetchClose(&__SQL_id0,0,0,0,0,0))
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
{}
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"

#line 74 "c:\\ABM\\T3\\src\\p3c.ec"
SQL_EXEC_GetCSQLSTATE(SQLSTATE,SQLCODE);}
#line 74 "c:\\ABM\\T3\\src\\p3c.ec"


   printf("For this query session, %d employees records are found \n",count);

   exit(0);
}


/*************************************************************
*
*   Do the actual work
*
**************************************************************/

   void process_query (void)
   {
      /* EXEC SQL BEGIN DECLARE SECTION; */
#line 91 "c:\\ABM\\T3\\src\\p3c.ec"

      int input_empnum;

      /* EXEC SQL END DECLARE SECTION; */
#line 95 "c:\\ABM\\T3\\src\\p3c.ec"


      printf("Enter employee number (ctrl-y terminates) ");

      while (scanf ("%d", &input_empnum) != EOF)
      {

         /* EXEC SQL
           SELECT empnum, first_name, last_name, jobcode
             INTO  :employee_rec.empnum,
                   :employee_rec.first_name,
                   :employee_rec.last_name,
                   :emp_jobcode
             FROM employee
             WHERE empnum = :input_empnum
           ; */
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
{
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id0 = {
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
11, stmt_name, &__SQL_mod_123456091462969012, "SQLMX_DEFAULT_STATEMENT_6"
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
,0, 0, 
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
25, 0, 0};
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id1 = {
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
11, desc_name, &__SQL_mod_123456091462969012, 
"SQLMX_DEFAULT_STATEMENT_6_0_IVAR",0, 0, 
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
32, 0, 0};
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id2 = {
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
11, desc_name, &__SQL_mod_123456091462969012, 
"SQLMX_DEFAULT_STATEMENT_6_0_OVAR",0, 0, 
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
32, 0, 0};
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
if (SQLCODE = SQL_EXEC_ClearExecFetchClose(&__SQL_id0,&__SQL_id1,
&__SQL_id2,1,4,5,&(input_empnum),0,&(employee_rec.empnum),0,
&(employee_rec.first_name[0]),0,&(employee_rec.last_name[0]),0,
&(emp_jobcode),0))
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
{}
#line 102 "c:\\ABM\\T3\\src\\p3c.ec"

#line 102 "c:\\ABM\\T3\\src\\p3c.ec"
SQL_EXEC_GetCSQLSTATE(SQLSTATE,SQLCODE);}
#line 110 "c:\\ABM\\T3\\src\\p3c.ec"


         NULL_TERMINATE(employee_rec.first_name);
         NULL_TERMINATE(employee_rec.last_name);

         /* checking status here */
            switch (SQLCODE)
            {
               case SQL_OPERATION_OK:

               {
                /* EXEC SQL
                SELECT jobdesc into :job_rec1.jobdesc
                  FROM job
                  WHERE jobcode = :emp_jobcode
                ; */
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
{
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id0 = {
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
11, stmt_name, &__SQL_mod_123456091462969012, "SQLMX_DEFAULT_STATEMENT_7"
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
,0, 0, 
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
25, 0, 0};
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id1 = {
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
11, desc_name, &__SQL_mod_123456091462969012, 
"SQLMX_DEFAULT_STATEMENT_7_0_IVAR",0, 0, 
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
32, 0, 0};
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
static struct SQLCLI_OBJ_ID __SQL_id2 = {
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
11, desc_name, &__SQL_mod_123456091462969012, 
"SQLMX_DEFAULT_STATEMENT_7_0_OVAR",0, 0, 
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
32, 0, 0};
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
if (SQLCODE = SQL_EXEC_ClearExecFetchClose(&__SQL_id0,&__SQL_id1,
&__SQL_id2,1,1,2,&(emp_jobcode),0,&(job_rec1.jobdesc[0]),0))
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
{}
#line 121 "c:\\ABM\\T3\\src\\p3c.ec"

#line 121 "c:\\ABM\\T3\\src\\p3c.ec"
SQL_EXEC_GetCSQLSTATE(SQLSTATE,SQLCODE);}
#line 125 "c:\\ABM\\T3\\src\\p3c.ec"



                printf("First Name       Last Name     Job Title\n");
                printf("----------       ---------     ---------\n");
                printf("%16s   %12s   %s\n",
                            employee_rec.first_name ,
                            employee_rec.last_name ,
                            job_rec1.jobdesc);
                printf("\n");
                count++;
               }
               break;
               case ROW_NOT_FOUND:

                  printf("Employee record: %d not in the database\n", input_empnum);
                  printf("\n");

                  break;

              default:
                printf("Error in retrieving employee record: %d\n", input_empnum);
                printf("\n");

                break;
           }
              printf ("Enter employee number (ctrl-y terminates) ");
         }
       }
/* End of source code */
SQLMODULE_ID __SQL_mod_123456091462969012 = {
/* version */    	11,
/* filler1 */    	{0,0,0,0},
/* module name */	"SAMDBCAT.PERSNL.LAB2",
/* timestamp */  	123456091462969012,
/* char set */   	"ISO88591",
/* name len */   	20,
/* filler2 */    	{0,0,0,0},
/* handle */     	0,
/* timestamp */  	0,
 };

/* #pragma sql module identification function */

unsigned char* 
c__ABM_T3_p3c_c123456091462969012()
{
 static unsigned char buffer[] = {
 45,45,66,69,71,73,78,95,83,81,76,47,77,88,43
 ,109,79,68,85,108,201,32,100,101,102,42,48,49,50,51
 ,52,53,54,55,56,57,97,98,99,103,104,105,106,107,110
 ,111,112,113,114,115,116,117,118,119,120,121,122,65,67,70
 ,72,74,75,80,82,84,86,87,89,90,33,35,36,37,39
 ,40,41,44,46,58,59,60,61,62,63,64,91,92,93,94
 ,96,123,124,125,126,0,20,83,65,77,68,66,67,65,84
 ,46,80,69,82,83,78,76,46,76,65,66,50,45,45,45
 ,32,72,101,119,108,101,116,116,32,80,97,99,107,97,114
 ,100,32,69,110,116,101,114,112,114,105,115,101,32,78,111
 ,110,83,116,111,112,40,84,77,41,32,83,81,76,47,77
 ,88,32,67,47,67,43,43,32,80,114,101,112,114,111,99
 ,101,115,115,111,114,32,51,46,57,46,49,32,103,101,110
 ,101,114,97,116,101,100,32,109,111,100,117,108,101,32,100
 ,101,102,105,110,105,116,105,111,110,32,102,105,108,101,46
 ,10,10,77,79,68,85,76,69,32,83,65,77,68,66,67
 ,65,84,46,80,69,82,83,78,76,46,76,65,66,50,32
 ,78,65,77,69,83,32,65,82,69,32,73,83,79,56,56
 ,53,57,49,59,10,84,73,77,69,83,84,65,77,80,32
 ,68,69,70,73,78,73,84,73,79,78,32,40,49,50,51
 ,52,53,54,48,57,49,52,54,50,57,54,57,48,49,50
 ,41,59,10,83,79,85,82,67,69,95,70,73,76,69,32
 ,39,92,92,92,99,58,92,65,66,77,92,84,51,92,115
 ,114,99,92,112,51,99,46,101,99,39,59,10,10,45,45
 ,45,45,45,45,45,45,45,32,83,84,65,84,69,77,69
 ,78,84,32,73,78,68,69,88,32,48,32,45,45,45,45
 ,45,45,45,45,45,10,80,82,79,67,69,68,85,82,69
 ,32,83,81,76,77,88,95,68,69,70,65,85,76,84,95
 ,83,84,65,84,69,77,69,78,84,95,50,32,40,41,10
 ,32,68,69,67,76,65,82,69,32,78,65,77,69,84,89
 ,80,69,32,39,65,78,83,73,39,59,10,10,45,45,45
 ,45,45,45,45,45,45,32,83,84,65,84,69,77,69,78
 ,84,32,73,78,68,69,88,32,49,32,45,45,45,45,45
 ,45,45,45,45,10,80,82,79,67,69,68,85,82,69,32
 ,83,81,76,77,88,95,68,69,70,65,85,76,84,95,83
 ,84,65,84,69,77,69,78,84,95,51,32,40,41,10,32
 ,68,69,67,76,65,82,69,32,83,67,72,69,77,65,32
 ,39,83,65,77,68,66,67,65,84,46,80,69,82,83,78
 ,76,39,59,10,10,45,45,45,45,45,45,45,45,45,32
 ,83,84,65,84,69,77,69,78,84,32,73,78,68,69,88
 ,32,50,32,45,45,45,45,45,45,45,45,45,10,80,82
 ,79,67,69,68,85,82,69,32,83,81,76,77,88,95,68
 ,69,70,65,85,76,84,95,83,84,65,84,69,77,69,78
 ,84,95,52,32,40,41,10,32,66,69,71,73,78,32,87
 ,79,82,75,59,10,10,45,45,45,45,45,45,45,45,45
 ,32,83,84,65,84,69,77,69,78,84,32,73,78,68,69
 ,88,32,51,32,45,45,45,45,45,45,45,45,45,10,80
 ,82,79,67,69,68,85,82,69,32,83,81,76,77,88,95
 ,68,69,70,65,85,76,84,95,83,84,65,84,69,77,69
 ,78,84,95,53,32,40,41,10,32,67,79,77,77,73,84
 ,32,87,79,82,75,59,10,10,65,76,76,79,67,65,84
 ,69,32,83,84,65,84,73,67,32,73,78,80,85,84,32
 ,68,69,83,67,82,73,80,84,79,82,32,83,81,76,77
 ,88,95,68,69,70,65,85,76,84,95,83,84,65,84,69
 ,77,69,78,84,95,54,95,48,95,73,86,65,82,32,70
 ,79,82,32,83,84,65,84,69,77,69,78,84,32,83,81
 ,76,77,88,95,68,69,70,65,85,76,84,95,83,84,65
 ,84,69,77,69,78,84,95,54,32,40,73,78,84,69,71
 ,69,82,32,78,79,84,32,78,85,76,76,41,59,10,10
 ,65,76,76,79,67,65,84,69,32,83,84,65,84,73,67
 ,32,79,85,84,80,85,84,32,68,69,83,67,82,73,80
 ,84,79,82,32,83,81,76,77,88,95,68,69,70,65,85
 ,76,84,95,83,84,65,84,69,77,69,78,84,95,54,95
 ,48,95,79,86,65,82,32,70,79,82,32,83,84,65,84
 ,69,77,69,78,84,32,83,81,76,77,88,95,68,69,70
 ,65,85,76,84,95,83,84,65,84,69,77,69,78,84,95
 ,54,32,40,83,77,65,76,76,73,78,84,32,85,78,83
 ,73,71,78,69,68,32,78,79,84,32,78,85,76,76,44
 ,67,72,65,82,65,67,84,69,82,40,49,53,41,32,78
 ,79,84,32,78,85,76,76,44,67,72,65,82,65,67,84
 ,69,82,40,50,48,41,32,78,79,84,32,78,85,76,76
 ,44,73,78,84,69,71,69,82,32,78,79,84,32,78,85
 ,76,76,41,59,10,10,45,45,45,45,45,45,45,45,45
 ,32,83,84,65,84,69,77,69,78,84,32,73,78,68,69
 ,88,32,52,32,45,45,45,45,45,45,45,45,45,10,80
 ,82,79,67,69,68,85,82,69,32,83,81,76,77,88,95
 ,68,69,70,65,85,76,84,95,83,84,65,84,69,77,69
 ,78,84,95,54,32,40,34,101,109,112,108,111,121,101,101
 ,95,114,101,99,46,101,109,112,110,117,109,34,32,83,77
 ,65,76,76,73,78,84,32,85,78,83,73,71,78,69,68
 ,44,34,101,109,112,108,111,121,101,101,95,114,101,99,46
 ,102,105,114,115,116,95,110,97,109,101,34,32,67,72,65
 ,82,65,67,84,69,82,40,49,53,41,44,34,101,109,112
 ,108,111,121,101,101,95,114,101,99,46,108,97,115,116,95
 ,110,97,109,101,34,32,67,72,65,82,65,67,84,69,82
 ,40,50,48,41,44,34,101,109,112,95,106,111,98,99,111
 ,100,101,34,32,73,78,84,69,71,69,82,44,34,105,110
 ,112,117,116,95,101,109,112,110,117,109,34,32,73,78,84
 ,69,71,69,82,41,10,10,32,32,32,32,32,32,32,32
 ,32,32,32,83,69,76,69,67,84,32,101,109,112,110,117
 ,109,44,32,102,105,114,115,116,95,110,97,109,101,44,32
 ,108,97,115,116,95,110,97,109,101,44,32,106,111,98,99
 ,111,100,101,10,32,32,32,32,32,32,32,32,32,32,32
 ,32,32,73,78,84,79,32,32,58,34,101,109,112,108,111
 ,121,101,101,95,114,101,99,46,101,109,112,110,117,109,34
 ,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32
 ,32,32,32,32,32,32,58,34,101,109,112,108,111,121,101
 ,101,95,114,101,99,46,102,105,114,115,116,95,110,97,109
 ,101,34,44,10,32,32,32,32,32,32,32,32,32,32,32
 ,32,32,32,32,32,32,32,32,58,34,101,109,112,108,111
 ,121,101,101,95,114,101,99,46,108,97,115,116,95,110,97
 ,109,101,34,44,10,32,32,32,32,32,32,32,32,32,32
 ,32,32,32,32,32,32,32,32,32,58,34,101,109,112,95
 ,106,111,98,99,111,100,101,34,10,32,32,32,32,32,32
 ,32,32,32,32,32,32,32,70,82,79,77,32,101,109,112
 ,108,111,121,101,101,10,32,32,32,32,32,32,32,32,32
 ,32,32,32,32,87,72,69,82,69,32,101,109,112,110,117
 ,109,32,61,32,58,34,105,110,112,117,116,95,101,109,112
 ,110,117,109,34,10,32,32,32,32,32,32,32,32,32,32
 ,32,59,10,10,65,76,76,79,67,65,84,69,32,83,84
 ,65,84,73,67,32,73,78,80,85,84,32,68,69,83,67
 ,82,73,80,84,79,82,32,83,81,76,77,88,95,68,69
 ,70,65,85,76,84,95,83,84,65,84,69,77,69,78,84
 ,95,55,95,48,95,73,86,65,82,32,70,79,82,32,83
 ,84,65,84,69,77,69,78,84,32,83,81,76,77,88,95
 ,68,69,70,65,85,76,84,95,83,84,65,84,69,77,69
 ,78,84,95,55,32,40,73,78,84,69,71,69,82,32,78
 ,79,84,32,78,85,76,76,41,59,10,10,65,76,76,79
 ,67,65,84,69,32,83,84,65,84,73,67,32,79,85,84
 ,80,85,84,32,68,69,83,67,82,73,80,84,79,82,32
 ,83,81,76,77,88,95,68,69,70,65,85,76,84,95,83
 ,84,65,84,69,77,69,78,84,95,55,95,48,95,79,86
 ,65,82,32,70,79,82,32,83,84,65,84,69,77,69,78
 ,84,32,83,81,76,77,88,95,68,69,70,65,85,76,84
 ,95,83,84,65,84,69,77,69,78,84,95,55,32,40,65
 ,78,83,73,86,65,82,67,72,65,82,40,49,56,41,32
 ,67,72,65,82,65,67,84,69,82,32,83,69,84,32,73
 ,83,79,56,56,53,57,49,32,78,79,84,32,78,85,76
 ,76,41,59,10,10,45,45,45,45,45,45,45,45,45,32
 ,83,84,65,84,69,77,69,78,84,32,73,78,68,69,88
 ,32,53,32,45,45,45,45,45,45,45,45,45,10,80,82
 ,79,67,69,68,85,82,69,32,83,81,76,77,88,95,68
 ,69,70,65,85,76,84,95,83,84,65,84,69,77,69,78
 ,84,95,55,32,40,34,106,111,98,95,114,101,99,49,46
 ,106,111,98,100,101,115,99,34,32,65,78,83,73,86,65
 ,82,67,72,65,82,40,49,56,41,32,67,72,65,82,65
 ,67,84,69,82,32,83,69,84,32,73,83,79,56,56,53
 ,57,49,44,34,101,109,112,95,106,111,98,99,111,100,101
 ,34,32,73,78,84,69,71,69,82,41,10,10,32,32,32
 ,32,32,32,32,32,32,32,32,32,32,32,32,32,83,69
 ,76,69,67,84,32,106,111,98,100,101,115,99,32,105,110
 ,116,111,32,58,34,106,111,98,95,114,101,99,49,46,106
 ,111,98,100,101,115,99,34,10,32,32,32,32,32,32,32
 ,32,32,32,32,32,32,32,32,32,32,32,70,82,79,77
 ,32,106,111,98,10,32,32,32,32,32,32,32,32,32,32
 ,32,32,32,32,32,32,32,32,87,72,69,82,69,32,106
 ,111,98,99,111,100,101,32,61,32,58,34,101,109,112,95
 ,106,111,98,99,111,100,101,34,10,32,32,32,32,32,32
 ,32,32,32,32,32,32,32,32,32,32,59,10,10,45,45
 ,70,73,78,105,115,95,83,81,76,47,77,88,43,109,79
 ,68,85,108,69,32,100,101,102,42,57,56,55,54,53,52
 ,51,50,49,48,90,89,87,86,84,82,80,75,74,72,71
 ,67,66,65,122,121,120,119,118,117,116,114,113,112,111,110
 ,107,106,104,103,102,99,98,97,126,123,124,125,96,94,91
 ,92,93,64,63,60,61,62,59,58,46,44,40,41,39,37
 ,36,35,33 };
 return buffer;
} /*c__ABM_T3_p3c_c123456091462969012*/
