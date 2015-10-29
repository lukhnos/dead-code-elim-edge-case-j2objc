package org.lukhnos;

public class Bar {
  int y;
  public Bar(int x) { y = x; }

  class A {
    int z;
    A(int x) { z = x; }
    int f() { return z + y; }
  }
}
