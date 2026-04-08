set MXSQLC=C:\Program Files (x86)\HPE SQL-MX C Preprocessor 3.9.1\mxsqlcnt.dll
%COMP_ROOT%\usr\bin\c89 -Wverbose -Wsqlmx -Wmxcmp -Wsqlmxadd="-g moduleCatalog=SAMDBCAT -g moduleSchema=PERSNL -Q invokeCatalog=SAMDBCAT -Q invokeSchema=PERSNL" -Wmxcmp_add="-g moduleLocal" -Wsqlhost=10.85.235.130 -Wsqluser=SUPER.AHO -Wsqlmx_port=28650 -Wsshkey=/home/aho/DEMO22 -Wsqlloc=/home/aho/ABM -Wsslcertificate=\home\aho\ssl\ca.pem -o build/INSjob.exe src/INSjob.ec
ssh -i /home/aho/DEMO22 SUPER.AHO@DEMO22 "chmod u+x /home/aho/ABM/INSjob.exe"
