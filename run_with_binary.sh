function runBinary
{
    echo -e "\n running binary from jpackage, commad: "
    echo -e "$ROOT_DIRECTORY/dest/testApp/bin/testApp \n"

    $ROOT_DIRECTORY/dest/testApp/bin/testApp
}

function main
{
    ROOT_DIRECTORY=`pwd`
    export JAVA_TOOL_OPTIONS="-Djava.library.path=$ROOT_DIRECTORY/dest/testApp/lib/app/"
    
    runBinary
}

main $@