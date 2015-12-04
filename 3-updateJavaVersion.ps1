# Parse setEnv.cmd and replace the Java version
(get-content e:\psoft\ELM92DEV\webserv\elm92dev\bin\setEnv.cmd) | foreach-object {$_ -replace "E:\\java\\jdk-1.7.0_09", "e:\java\jdk-1.7.0_79"} | set-content e:\psoft\ELM92DEV\webserv\elm92dev\bin\setEnv.cmd

(get-content e:\psoft\HR92DMO\webserv\hr92dmo\bin\setEnv.cmd) | foreach-object {$_ -replace "E:\\java\\jdk-1.7.0_09", "e:\java\jdk-1.7.0_79"} | set-content e:\psoft\HR92DMO\webserv\hr92dmo\bin\setEnv.cmd
(get-content e:\psoft\HR92SBX\webserv\hr92sbx\bin\setEnv.cmd) | foreach-object {$_ -replace "E:\\java\\jdk-1.7.0_09", "e:\java\jdk-1.7.0_79"} | set-content e:\psoft\HR92SBX\webserv\hr92sbx\bin\setEnv.cmd
(get-content e:\psoft\HR92DEV\webserv\hr92dev\bin\setEnv.cmd) | foreach-object {$_ -replace "E:\\java\\jdk-1.7.0_09", "e:\java\jdk-1.7.0_79"} | set-content e:\psoft\HR92DEV\webserv\hr92dev\bin\setEnv.cmd
(get-content e:\psoft\HR92TST\webserv\hr92tst\bin\setEnv.cmd) | foreach-object {$_ -replace "E:\\java\\jdk-1.7.0_09", "e:\java\jdk-1.7.0_79"} | set-content e:\psoft\HR92TST\webserv\hr92tst\bin\setEnv.cmd
