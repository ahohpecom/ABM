set MXSQLC=C:\MXSQLC\mxsqlcnt.dll
mxsqlc src\INSERTjob.ec -c src\INSERTjob.c -g moduleCatalog=SAMDBCAT -g moduleSchema=PERSNL -Q invokeCatalog=SAMDBCAT -Q invokeSchema=PERSNL -s DEMO22 -r 28650 -y SUPER.AHO -W \home\aho\DEMO22 -S \home\aho\ssl\ca.pem
