function runJar
{
    echo -e "running java 16 with jar, command:"
    echo -e "$JAVA_HOME/bin/java -jar $ROOT_DIRECTORY/dest/testApp/lib/app/PrintFromNative.jar \n"

    $JAVA_HOME/bin/java -jar $ROOT_DIRECTORY/dest/testApp/lib/app/PrintFromNative.jar
}

function main
{
    ROOT_DIRECTORY=`pwd`
    export JAVA_TOOL_OPTIONS="-Djava.library.path=$ROOT_DIRECTORY/dest/testApp/lib/app/"

    runJar
}

main $@