package com.example;


public class SimpleAdd {
    
    static {
	System.loadLibrary("java_interact");
    }

    private static native int add(int a, int b);

    public static void main(String[] args) {
    	var a = 10;
	var b = 20;
	System.out.println(add(a, b));
    }

}
