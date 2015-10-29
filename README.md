J2ObjC Dead Code Elimination Bug Sample
=======================================

This demonstrates an edge case where J2ObjC does not remove an inner class
constructor correctly. Since the dead code elimination pass runs before the
outer class type information is furnished to inner class methods, it causes
a mismatch between what ProGuard produces and what J2ObjC produces as method
signature during the pass.

To create the dead code report, run:

    ./gradlew proguardJar

The report is in `build/deadcode.txt`. Now use the report to translate `Bar`:

    j2objc \
        --dead-code-report build/deadcode.txt \
        -d build/objc \
        src/main/java/org/lukhnos/Bar.java

Now compile the code and see the error:

    j2objcc -c -I build/objc build/objc/org/lukhnos/Bar.m

The error is:

```
build/objc/org/lukhnos/Bar.m:60:9: error: 'OrgLukhnosBar_A' does not have a member named 'z_'
  self->z_ = x;
  ~~~~  ^
1 error generated.
```

