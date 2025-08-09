# ZigJavaInteract
Simple Zig java binding example using zig-jni library

## Usage

compile using zig 0.14.*

```sh 
zig build
```

To run using java, first compile to class file using
```sh
javac com/example/SimpleAdd.java
```

then run using 
```sh
java -cp . -Djava.library.path=./zig-out/lib/ com.example.SimpleAdd
```
