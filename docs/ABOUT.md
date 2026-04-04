# About

Jai is a systems language designed and built by legendary game developer Jonathan Blow.
It was built out of frustration with existing languages' overhead and complexity.

Jai's primary design goals are speed and productivity.
The compiler is incredibly fast and the produced binaries are very lean with a minimal runtime.

One of Jai's standout features is its metaprogramming support.
You'll have access to all data the compiler uses internally and are free to manipulate it as you see fit.
Jai even goes one step further, where it allows you to run arbitrary Jai code at _compile time_!

As the build system itself is entirely written in Jai, there is no need to learn a separate build system tool: you just write Jai code to access the build system.

Jai was developed to help build the Order of the Sinking Star game; you'll thus find Jai ideally suited to building games.
