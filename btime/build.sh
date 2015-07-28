#!/bin/bash

g++ -fPIC -c btime.cpp
g++ -shared -Wl,-soname,btime.so -o btime.so.0 *.o
