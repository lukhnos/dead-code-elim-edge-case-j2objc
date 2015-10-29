-libraryjars <java.home>/lib/rt.jar
-dontoptimize
-dontobfuscate

-whyareyoukeeping class org.lukhnos.Bar

-keep,includedescriptorclasses class org.lukhnos.Foo {
    *;
}

-keepattributes Signature,Exceptions

-keep class org.lukhnos.**
