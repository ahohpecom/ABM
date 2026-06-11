#include<stdio.h>
#include<string.h>

  EXEC SQL MODULE INSERTjob NAMES ARE ISO88591;

  EXEC SQL DECLARE NAMETYPE 'ANSI';

int main()
 {
  EXEC SQL BEGIN DECLARE SECTION;
  int    jobcode;
  char jobdesc[18];
  char SQLSTATE[6];
  long  SQLCODE;
  EXEC SQL END DECLARE SECTION;

  printf("\n enter job number :");
  scanf("%d",&jobcode);

  printf("\n enter job name :");
  scanf("%s",jobdesc);

  EXEC SQL BEGIN WORK;
  EXEC SQL INSERT INTO  SAMDBCAT.PERSNL.JOB (jobcode,jobdesc)
                     VALUES (:jobcode,:jobdesc);
/* printf("\n SQLSTATE = %s ",SQLSTATE);
   printf("\n SQLCODE  = %d". SQLCODE);
*/
  EXEC SQL COMMIT WORK;
  printf("Insert into SAMDBCAT.PERSNL.JOB table.\n");
}