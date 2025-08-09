const std = @import("std");
const jni = @import("jni");


pub fn add(cEnv: *jni.cEnv, _: jni.jclass, a: jni.jint, b: jni.jint) callconv(.C) jni.jint {
    _ = cEnv;
    return a + b;
}

pub fn sayHello(cEnv: *jni.cEnv, _: jni.jclass, name: jni.jstring) callconv(.C) jni.jstring {
    const curr_name = cEnv.*.*.GetStringUTFChars.?(cEnv, name, null);
    const fixed = std.mem.span(curr_name.?);
    const runtime_string = std.fmt.allocPrint(std.heap.page_allocator, "Hello {s}", .{fixed}) catch {
        const oops: []const u8 = "OOPS";
        return cEnv.*.*.NewStringUTF.?(cEnv, oops.ptr);
    };
    defer std.heap.page_allocator.free(runtime_string);
    return cEnv.*.*.NewStringUTF.?(cEnv, runtime_string.ptr);
}

pub fn print(cEnv: *jni.cEnv, _: jni.jclass, message: jni.jstring) callconv(.C) void {
    const curr_message = cEnv.*.*.GetStringUTFChars.?(cEnv, message, null);
    std.debug.print("{s}", .{curr_message});
}
