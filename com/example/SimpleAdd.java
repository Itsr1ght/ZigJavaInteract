package com.example;


public class SimpleAdd {
    
    static {
	System.loadLibrary("java_interact");
    }

    private static native int add(int a, int b);
    private static native String sayHello(String name);
    private static native void print(String message);

    public static void main(String[] args) {
    	var a = 10;
	var b = 20;
	System.out.println(add(a, b));
	String name = "Ben";
	String result = sayHello(name);
	print(result);
    }

}
