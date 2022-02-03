Makevars file is a variant of `Make` that is unique to R. `Make` utility determines which piece of a large program need to be recompiled and issues the commands to recompile it.

Makefile tells Make how to behave and how to compile and link a program. 

A Makevars file is a makefile and is used as one of several makefiles by R CMD SHLIB (which is called by R CMD INSTALL to compile code in the src directory)
The most common use of a Makevars file is to set additional preprocessor options (for example include paths and definitions) for C/C++
These are `implicit` variables and tell `Make` how to use customary techniques so that i don't have to specify them in details when i want to use them. Dictate what compiler

should be used and what options are available

VER=
CCACHE=ccache
CC Program for compiling C programs; default ‘cc’.

CC=$(CCACHE) gcc$(VER)
CXX Program for compiling C++ programs; default ‘g++’
g++ command is a GNU c++ compiler invocation command, gcc commanda is a GNU c compiler invocation command.

CXX=$(CCACHE) g++$(VER)
C++11 and 14 are compilation standards for the C++ language, kinda different version that evolves and gets updates. CXX is the general compiler option to use and CXX11/14 incorporates also other standards.

CXX11=$(CCACHE) g++$(VER)

CXX14=$(CCACHE) g++$(VER)
## FC Program for compiling or preprocessing Fortran and Ratfor programs; default ‘f77’.

FC=$(CCACHE) gfortran$(VER)

F77=$(CCACHE) gfortran$(VER)
