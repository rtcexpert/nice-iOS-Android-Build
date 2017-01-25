# nice-iOS-Android-Build
libnice for iOS and Android.

libnice version -> I check out libnice from https://github.com/libnice/libnice date - 25th JAN 2017.

It's include Precompiled iOS and Andorid nice libs.

You can also compile with xcode and command line terminal.

- There are 2 target in xcode project 1st for iOS and 2ed for Android.

iOS Compile:
    -   open xcode project select nice target and just compile it.
    -   you will get output in Final-Build

Android Compile:
    First way
        -   open xcode project and select Android-nice target.
        -   You also need to give NDK path in script.
            - Android-nice -> build phases -> run script -> [EDIT NDK Path]
        -   And just compile it.

    Second way
        -   open terminal -> goto nice-iOS-Android-Build/Android/jni
        -   and do ndk_build.
        
        if you want to extract latest include files.
                - goto -> nice-iOS-Android-Build
                - run  "rsync --include '*.h' --filter 'hide,! */' -avm src/ Final-Build/include"


if you find my repo helpfull to you. give it a star. 
if you have any queries you can contact me on "rahul@rahulpathak.in" or open bug report.
