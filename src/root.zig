const jni = @import("jni");
const simplyadd = @import("SimplyAdd.zig");


comptime {
    jni.exportJNI("com.example.SimpleAdd", simplyadd);
}
