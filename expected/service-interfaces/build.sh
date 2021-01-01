
HOME=~

echo 0 ;
rm -rf target/test-classes ;
mkdir -p target/test-classes ;

JAVA_HOME=`/usr/libexec/java_home -v "1.8"` ;

echo 1 ;
javac -source 1.8 -target 1.8 \
	-cp ./target/classes/:../service-interfaces/target/test-classes:${HOME}/.m2/repository/org/junit/jupiter/junit-jupiter-api/5.6.2/junit-jupiter-api-5.6.2.jar:${HOME}/.m2/repository/org/apiguardian/apiguardian-api/1.0.0/apiguardian-api-1.0.0.jar \
	-d target/test-classes \
	src/test/java/tld/example/interfaces/tests/ExampleServiceTest.java


JAVA_HOME=`/usr/libexec/java_home -v "11"` ;

echo 2 ;
#javac --release 11 \
#	-cp ./target/test-classes/ \
#	--module-path ${HOME}/.m2/repository/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar:${HOME}/.m2/repository/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10.jar:${HOME}/.m2/repository/org/junit/jupiter/junit-jupiter-api/5.6.2/junit-jupiter-api-5.6.2.jar \
#	-d target/test-classes/META-INF/versions/11 \
#	src/test/java11/module-info.java

javac -version ;

#javac --release 11 \
#	--module-path ../target/MCOMPILER-422_workaround-with-provides-service-interfaces-1.jar:${HOME}/.m2/repository/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar:${HOME}/.m2/repository/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10.jar \
#	--module-source-path ./target/classes \
#	--patch-module workaround.service.implementation=./target/classes \
#	-d target/classes \
#	src/main/java11/tld/example/implementation/ModuleInfoHack.java \
#	src/main/java11/module-info.java

echo 3
javac --release 11 \
	--module-path ./target/classes:${HOME}/.m2/repository/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar:${HOME}/.m2/repository/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10.jar:${HOME}/.m2/repository/org/junit/jupiter/junit-jupiter-api/5.6.2/junit-jupiter-api-5.6.2.jar:${HOME}/.m2/repository/org/apiguardian/apiguardian-api/1.0.0/apiguardian-api-1.0.0.jar:${HOME}/.m2/repository/org/junit/platform/junit-platform-commons/1.6.2/junit-platform-commons-1.6.2.jar:${HOME}/.m2/repository/org/opentest4j/opentest4j/1.2.0/opentest4j-1.2.0.jar \
	--patch-module expected.service.implementation.tests=./target/test-classes \
	-d target/test-classes/META-INF/versions/11 \
	src/test/java11/module-info.java

echo done ;

find target/test-classes ;

#-patch-module <modulename>=./target/classes