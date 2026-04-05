set MXSQLC=C:\Program Files (x86)\HPE SQL-MX C Preprocessor 3.9.1\mxsqlcnt.dll
mxsqlc src\p3c.ec -c src\p3c.c -g moduleCatalog=SAMDBCAT -g moduleSchema=PERSNL -Q invokeCatalog=SAMDBCAT -Q invokeSchema=PERSNL -s DEMO22 -r 28650 -y SUPER.AHO -W \home\aho\DEMO22 -S \home\aho\ssl\ca.pem
