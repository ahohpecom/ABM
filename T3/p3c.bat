C:\MXSQLC\mxsqlc src\p3c.ec -c src\p3c.c -g moduleCatalog=SAMDBCAT -g moduleSchema=PERSNL -Q invokeCatalog=SAMDBCAT -Q invokeSchema=PERSNL -s DEMO22 -r 28650 -y SUPER.AHO -W \home\aho\DEMO22 -S \home\aho\ssl\ca.pem

%COMP_ROOT%\usr\bin\c89 -Wextensions -c src/p3c.c -o build/p3c.o

REM ---------------------------------
REM use ^ as continuation character
REM ---------------------------------
%COMP_ROOT%\usr\bin\xld %COMP_ROOT%/usr/lib/ccpmainx.o build/p3c.o -o build/p3c.exe ^
 -set systype oss ^
 -lxcppcdll -lxcpp2dll -lxcredll ^
 -lxcrtldll -lxosskdll -lxi18ndll ^
 -lxicnvdll -lxclidll -lxtlh7dll

REM ssh -i /home/aho/DEMO22 SUPER.AHO@DEMO22 "/usr/bin/xld /usr/lib/ccpmainx.o /home/aho/ABM/p3c.o -o /home/aho/ABM/p3c.exe -lxcredll -lxcrtldll -lxosskdll -lxi18ndll -lxicnvdll -lxclidll"

echo put C:\ABM\T3\build\p3c.exe | sftp -i /home/aho/DEMO22 SUPER.AHO@DEMO22:/home/aho/ABM
ssh -i /home/aho/DEMO22 SUPER.AHO@DEMO22 "chmod a+x /home/aho/ABM/p3c.exe" 

ssh -i /home/aho/DEMO22 SUPER.AHO@DEMO22 "/usr/tandem/sqlmx/bin/mxCompileUserModule -g moduleLocal -d CATALOG=SAMDBCAT -d SCHEMA=PERSNL /home/aho/ABM/p3c.exe"