#!/bin/bash

function compileNativeCode
{
    cd $ROOT_DIRECTORY/NativeCode

    echo "Creating .so file from native code, path: $ROOT_DIRECTORY/NativeCode"

    g++ -fPIC -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -lstdc++ -shared -o libnative.so -Wall -Wextra test_Main.cpp

    mv $ROOT_DIRECTORY/NativeCode/libnative.so $ROOT_DIRECTORY/input

}

function createJar
{
    cd $ROOT_DIRECTORY/PrintFromNative/src

    $JAVA_HOME/bin/javac test/Main.java

    $JAVA_HOME/bin/jar cmf META-INF/MANIFEST.MF PrintFromNative.jar test

    mv PrintFromNative.jar $ROOT_DIRECTORY/input
}


function createJPackage
{
    $JAVA_HOME/bin/jpackage --verbose --name testApp --input $ROOT_DIRECTORY/input/ --dest $ROOT_DIRECTORY/dest/ --main-jar PrintFromNative.jar --type app-image
}


function runJar
{
    echo -e "running java 16 with jar, command:"
    echo -e "$JAVA_HOME/bin/java -jar $ROOT_DIRECTORY/dest/testApp/lib/app/PrintFromNative.jar \n"

    $JAVA_HOME/bin/java -jar $ROOT_DIRECTORY/dest/testApp/lib/app/PrintFromNative.jar
}

function runBinary
{
    echo -e "\n running binary from jpackage, commad: "
    echo -e "$ROOT_DIRECTORY/dest/testApp/bin/testApp \n"

    $ROOT_DIRECTORY/dest/testApp/bin/testApp
}

function main
{
    ROOT_DIRECTORY=`pwd`

    rm -r $ROOT_DIRECTORY/input
    rm -rf $ROOT_DIRECTORY/dest

    mkdir $ROOT_DIRECTORY/input
    mkdir $ROOT_DIRECTORY/dest

    compileNativeCode

    createJar

    createJPackage
}

main $@
