const std = @import("std");

pub fn build(b: *std.Build) void {

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const root_module = b.addModule("java_interact",
        .{
        .root_source_file = b.path("src/root.zig"),
        }
    );
    root_module.resolved_target = target;
    root_module.optimize = optimize;

    const jni_root = b.dependency("jni", .{});
    root_module.addImport("jni", jni_root.module("JNI"));

    const lib = b.addLibrary(.{
        .name = "java_interact",
        .linkage = .dynamic,
        .root_module = root_module,
    });
    b.installArtifact(lib);

}

