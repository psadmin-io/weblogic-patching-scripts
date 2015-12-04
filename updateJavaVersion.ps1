# Parse setEnv.cmd and replace the Java version

(get-content e:\psoft\HR92DMO\webserv\hr92dmo\bin\setEnv.cmd) | foreach-object {$_ -replace "E:\\java\\jdk-1.7.0_09", "e:\java\jdk-1.7.0_79"} | set-content e:\psoft\HR92DMO\webserv\hr92dmo\bin\setEnv.cmd
