all: compile link

compile:
        g++ -fPIC -c btime.cpp

link:
        g++ btime.o -m32 -lstdc++ -shared -Wl,-soname,btime.so -o btime.so

install:
        cp btime.so /usr/local/lib
