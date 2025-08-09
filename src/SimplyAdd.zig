const std = @import("std");
const jni = @import("jni");


pub fn add(cEnv: *jni.cEnv, _: jni.jclass, a: jni.jint, b: jni.jint) callconv(.C) jni.jint {
    _ = cEnv;
    return a + b;
}
