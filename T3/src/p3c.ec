
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

 EXEC SQL MODULE SAMDBCAT.PERSNL.LAB2 NAMES ARE ISO88591;

 EXEC SQL DECLARE NAMETYPE 'ANSI';
 
 EXEC SQL DECLARE SCHEMA 'SAMDBCAT.PERSNL';


 EXEC SQL BEGIN DECLARE SECTION;

 long   SQLCODE;
 char   SQLSTATE[6];

 struct {
    unsigned short   empnum;
    char             first_name[16];
    char             last_name[21];
    struct {
      short indicator;
      unsigned short valu;
    }jobcode;  
  }employee_rec;

 EXEC SQL INVOKE job AS job_rec;
 struct job_rec job_rec1;

 int emp_jobcode;

EXEC SQL END DECLARE SECTION;

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

   EXEC SQL BEGIN WORK;

   process_query ();

   EXEC SQL COMMIT WORK;

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
      EXEC SQL BEGIN DECLARE SECTION;

      int input_empnum;

      EXEC SQL END DECLARE SECTION;


      printf("Enter employee number (ctrl-y terminates) ");

      while (scanf ("%d", &input_empnum) != EOF)
      {

         EXEC SQL
           SELECT empnum, first_name, last_name, jobcode
             INTO  :employee_rec.empnum,
                   :employee_rec.first_name,
                   :employee_rec.last_name,
                   :emp_jobcode
             FROM employee
             WHERE empnum = :input_empnum
           ;

         NULL_TERMINATE(employee_rec.first_name);
         NULL_TERMINATE(employee_rec.last_name);

         /* checking status here */
            switch (SQLCODE)
            {
               case SQL_OPERATION_OK:

               {
                EXEC SQL
                SELECT jobdesc into :job_rec1.jobdesc
                  FROM job
                  WHERE jobcode = :emp_jobcode
                ;


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
