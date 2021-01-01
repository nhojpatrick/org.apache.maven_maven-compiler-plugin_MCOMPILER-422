
HOME=~

echo 0 ;
rm -rf target/classes ;
mkdir -p target/classes ;

JAVA_HOME=`/usr/libexec/java_home -v "1.8"` ;

echo 1 ;
javac -source 1.8 -target 1.8 \
	-cp ./target/classes/:../service-interfaces/target/classes \
	-d target/classes \
	src/main/java/tld/example/implementation/ExampleServiceImpl.java


JAVA_HOME=`/usr/libexec/java_home -v "11"` ;

echo 2 ;
javac --release 11 \
	-cp ./target/classes/ \
	--module-path ../service-interfaces/target/MCOMPILER-422_workaround-with-provides-service-interfaces-1.jar:${HOME}/.m2/repository/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar:${HOME}/.m2/repository/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10.jar \
	-d target/classes/META-INF/versions/11 \
	src/main/java11/tld/example/implementation/ModuleInfoHack.java \
	src/main/java11/module-info.java

javac -version ;

#javac --release 11 \
#	--module-path ../target/MCOMPILER-422_workaround-with-provides-service-interfaces-1.jar:${HOME}/.m2/repository/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar:${HOME}/.m2/repository/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10.jar \
#	--module-source-path ./target/classes \
#	--patch-module workaround.service.implementation=./target/classes \
#	-d target/classes \
#	src/main/java11/tld/example/implementation/ModuleInfoHack.java \
#	src/main/java11/module-info.java

javac --release 11 \
	--module-path ../service-interfaces/target/MCOMPILER-422_workaround-with-provides-service-interfaces-1.jar:${HOME}/.m2/repository/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar:${HOME}/.m2/repository/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10.jar \
	--patch-module workaround.service.implementation=./target/classes \
	-d target/classes/META-INF/versions/11 \
	src/main/java11/tld/example/implementation/ModuleInfoHack.java \
	src/main/java11/module-info.java

echo done ;

find target/classes ;

#-patch-module <modulename>=./target/classes