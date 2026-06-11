/* Reading a Guardian File With an OSS Function Call */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
 
char buffer[1026]; /* allow for NULL termination of string in buffer */
char *filename;    /* filename pointer */
int fd;            /* file descriptor */
int nbytes;        /* number of bytes read */
  
int main(int argc, char *argv[]) { 
  
/* Check for the proper number of arguments; if no filename
   is supplied, open the default file. */
   if(argc > 1)
      filename = argv[1];
   else
      filename = "/G/system/system/stdioh";  /* this file is opened if
                                                no name is supplied */
   fd = open(filename, O_RDONLY);   /* open Guardian file for read */
  
/* Check for the validity of the file descriptor; if it is not valid,
   print a message and exit. */
   if(fd < 0) {
      fprintf(stderr,"Can't open %s\n", filename);
      exit(1);
   }
  
/* If the read is unsuccessful, print an error message and exit. */
   nbytes = read(fd, buffer, 1024);
   if (nbytes < 0) {
       perror("File read error: ");
       exit(1);
    }
  
/* Print the number of bytes read and the first part of the file. */
   printf("Number of bytes read = %d\n", nbytes);
   buffer[nbytes] = 0;   /* make string NULL-terminated */
   printf("%s\n", buffer);
   return(0);
}
