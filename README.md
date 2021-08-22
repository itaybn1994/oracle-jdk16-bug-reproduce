# oracle-jdk16-bug-reproduce

This repository reproduce jdk 16.0.2 bug with std::stringstream.
When I used std::stringstream's operator<< with integer as value, nothing added to the string.

================================================================================================
how to reproduce the bug:

1. set JAVA_HOME to java16.
2. run build_app_imagine.sh to build native, java code and create app image using jpakcage.
3.1. run the script run_with_binary.sh in order to see the output with the problem.
3.2. run the script run_with_jar.sh in order to see the output without the problem.