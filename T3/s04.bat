echo put C:\ABM\T3\build\p3c.exe | sftp -i /home/aho/DEMO22 SUPER.AHO@DEMO22:/home/aho/ABM
ssh -i /home/aho/DEMO22 SUPER.AHO@DEMO22 "chmod a+x /home/aho/ABM/p3c.exe" 

ssh -i /home/aho/DEMO22 SUPER.AHO@DEMO22 "/usr/tandem/sqlmx/bin/mxCompileUserModule -g moduleLocal -d CATALOG=SAMDBCAT -d SCHEMA=PERSNL /home/aho/ABM/p3c.exe"