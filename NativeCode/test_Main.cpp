#include <jni.h>
#include <sstream>
#include <iostream>
/* Header for class test_Main */

#ifndef _Included_test_Main
#define _Included_test_Main
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     test_Main
 * Method:    print
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_test_Main_print
  (JNIEnv *, jclass);

#ifdef __cplusplus
}
#endif
#endif

JNIEXPORT void JNICALL Java_test_Main_print(JNIEnv *, jclass)
{
    std::stringstream s;
    int number = 5;

    s << "abcd" << number;

    std::cout << "result= " << s.str() << std::endl;
}

