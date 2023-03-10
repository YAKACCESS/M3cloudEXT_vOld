@echo off
cls
call refreshenv
call mvn clean %1
echo.
mkdir target
mkdir target\exported
echo Errors on Clean are *normally* not an issue
echo Make sure you Save all first! 
pause
echo Starting Copy ...
mkdir src\main\groovy
for /R .\src\main\Code %%f in (*.groovy) do copy "%%f" src\main\groovy\ >>nul
del src\main\groovy\XtendM3ExtensionsApplication.groovy >>nul
xcopy src\main\Code\XtendM3ExtensionsApplication.groovy src\main\groovy\com\wheelerfleet\ /Y >>nul
echo Starting Build ...
call mvn -U -B package --file pom.xml %1
echo.
echo This step must be successful for the export to be functional
rmdir src\main\groovy /s /q
for /R .\src\main\tables %%f in (*.json) do copy "%%f" target\exported >>nul
rem pause
REM "%JAVA_HOME%\bin\java.exe" "-Dtools.jar=%JAVA_HOME%\lib\tools.jar" -Dgroovy.home=%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy\2.5.11 "-javaagent:C:\Program Files\JetBrains\IntelliJ IDEA 2020.1.4\lib\idea_rt.jar=6354:C:\Program Files\JetBrains\IntelliJ IDEA 2020.1.4\bin" -Dfile.encoding=UTF-8 -classpath %USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy\2.5.11\groovy-2.5.11.jar org.codehaus.groovy.tools.GroovyStarter --main groovy.ui.GroovyMain --classpath .;.\target\classes;%USERPROFILE%\.m2\repository\org\springframework\boot\spring-boot-starter\2.3.0.RELEASE\spring-boot-starter-2.3.0.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\boot\spring-boot\2.3.0.RELEASE\spring-boot-2.3.0.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-context\5.2.6.RELEASE\spring-context-5.2.6.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-aop\5.2.6.RELEASE\spring-aop-5.2.6.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-beans\5.2.6.RELEASE\spring-beans-5.2.6.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-expression\5.2.6.RELEASE\spring-expression-5.2.6.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\boot\spring-boot-autoconfigure\2.3.0.RELEASE\spring-boot-autoconfigure-2.3.0.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\boot\spring-boot-starter-logging\2.3.0.RELEASE\spring-boot-starter-logging-2.3.0.RELEASE.jar;%USERPROFILE%\.m2\repository\ch\qos\logback\logback-classic\1.2.3\logback-classic-1.2.3.jar;%USERPROFILE%\.m2\repository\ch\qos\logback\logback-core\1.2.3\logback-core-1.2.3.jar;%USERPROFILE%\.m2\repository\org\apache\logging\log4j\log4j-to-slf4j\2.13.2\log4j-to-slf4j-2.13.2.jar;%USERPROFILE%\.m2\repository\org\apache\logging\log4j\log4j-api\2.13.2\log4j-api-2.13.2.jar;%USERPROFILE%\.m2\repository\org\slf4j\jul-to-slf4j\1.7.30\jul-to-slf4j-1.7.30.jar;%USERPROFILE%\.m2\repository\jakarta\annotation\jakarta.annotation-api\1.3.5\jakarta.annotation-api-1.3.5.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-core\5.2.6.RELEASE\spring-core-5.2.6.RELEASE.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-jcl\5.2.6.RELEASE\spring-jcl-5.2.6.RELEASE.jar;%USERPROFILE%\.m2\repository\org\yaml\snakeyaml\1.26\snakeyaml-1.26.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy\2.5.11\groovy-2.5.11.jar;%USERPROFILE%\.m2\repository\com\infor\m3\xtendm3-sdk\0.17.0\xtendm3-sdk-0.17.0.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-ant\2.5.11\groovy-ant-2.5.11.jar;%USERPROFILE%\.m2\repository\org\apache\ant\ant\1.9.13\ant-1.9.13.jar;%USERPROFILE%\.m2\repository\org\apache\ant\ant-junit\1.9.13\ant-junit-1.9.13.jar;%USERPROFILE%\.m2\repository\org\apache\ant\ant-launcher\1.9.13\ant-launcher-1.9.13.jar;%USERPROFILE%\.m2\repository\org\apache\ant\ant-antlr\1.9.13\ant-antlr-1.9.13.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-cli-commons\2.5.11\groovy-cli-commons-2.5.11.jar;%USERPROFILE%\.m2\repository\commons-cli\commons-cli\1.4\commons-cli-1.4.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-cli-picocli\2.5.11\groovy-cli-picocli-2.5.11.jar;%USERPROFILE%\.m2\repository\info\picocli\picocli\4.0.1\picocli-4.0.1.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-console\2.5.11\groovy-console-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-datetime\2.5.11\groovy-datetime-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-docgenerator\2.5.11\groovy-docgenerator-2.5.11.jar;%USERPROFILE%\.m2\repository\com\thoughtworks\qdox\qdox\1.12.1\qdox-1.12.1.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-groovydoc\2.5.11\groovy-groovydoc-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-groovysh\2.5.11\groovy-groovysh-2.5.11.jar;%USERPROFILE%\.m2\repository\jline\jline\2.14.6\jline-2.14.6.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-jmx\2.5.11\groovy-jmx-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-json\2.5.11\groovy-json-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-jsr223\2.5.11\groovy-jsr223-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-macro\2.5.11\groovy-macro-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-nio\2.5.11\groovy-nio-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-servlet\2.5.11\groovy-servlet-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-sql\2.5.11\groovy-sql-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-swing\2.5.11\groovy-swing-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-templates\2.5.11\groovy-templates-2.5.11.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-test\2.5.11\groovy-test-2.5.11.jar;%USERPROFILE%\.m2\repository\junit\junit\4.13\junit-4.13.jar;%USERPROFILE%\.m2\repository\org\hamcrest\hamcrest-core\2.2\hamcrest-core-2.2.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-test-junit5\2.5.11\groovy-test-junit5-2.5.11.jar;%USERPROFILE%\.m2\repository\org\junit\platform\junit-platform-launcher\1.6.2\junit-platform-launcher-1.6.2.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-testng\2.5.11\groovy-testng-2.5.11.jar;%USERPROFILE%\.m2\repository\org\testng\testng\6.13.1\testng-6.13.1.jar;%USERPROFILE%\.m2\repository\com\beust\jcommander\1.72\jcommander-1.72.jar;%USERPROFILE%\.m2\repository\org\codehaus\groovy\groovy-xml\2.5.11\groovy-xml-2.5.11.jar;%USERPROFILE%\.m2\repository\org\slf4j\slf4j-api\1.7.30\slf4j-api-1.7.30.jar;%USERPROFILE%\.m2\repository\org\hamcrest\hamcrest\2.2\hamcrest-2.2.jar;%USERPROFILE%\.m2\repository\org\junit\jupiter\junit-jupiter-api\5.6.2\junit-jupiter-api-5.6.2.jar;%USERPROFILE%\.m2\repository\org\apiguardian\apiguardian-api\1.1.0\apiguardian-api-1.1.0.jar;%USERPROFILE%\.m2\repository\org\opentest4j\opentest4j\1.2.0\opentest4j-1.2.0.jar;%USERPROFILE%\.m2\repository\org\junit\platform\junit-platform-commons\1.6.2\junit-platform-commons-1.6.2.jar;%USERPROFILE%\.m2\repository\org\junit\jupiter\junit-jupiter-engine\5.6.2\junit-jupiter-engine-5.6.2.jar;%USERPROFILE%\.m2\repository\org\junit\platform\junit-platform-engine\1.6.2\junit-platform-engine-1.6.2.jar --encoding=UTF-8 