CPP=g++
CPPFLAGS= -Iperiodic -Inet -Iutils --std=c++17 -Wall -Wextra -pthread 

all: main main-tasks

main: app/main.o net/Proxy.o net/Skeleton.o
	$(CPP) $(CPPFLAGS) app/main.o net/Proxy.o net/Skeleton.o -o main

main-tasks: app/main-tasks.o net/Proxy.o net/Skeleton.o
	$(CPP) $(CPPFLAGS) -DSLLET app/main.o net/Proxy.o net/Skeleton.o -o main-tasks

app/main.o: app/main.cpp periodic/*
	$(CPP) $(CPPFLAGS) -c app/main.cpp -o app/main.o

app/main-tasks.o: app/main.cpp periodic/*
	$(CPP) $(CPPFLAGS) -DSLLET -c app/main.cpp -o app/main-tasks.o

net/Proxy.o: net/Proxy.cpp net/*.hpp
	$(CPP) $(CPPFLAGS) -c net/Proxy.cpp -o net/Proxy.o

net/Skeleton.o: net/Skeleton.cpp net/*.hpp
	$(CPP) $(CPPFLAGS) -c net/Skeleton.cpp -o net/Skeleton.o

.PHONY: clean

clean:
	rm -f main a.out app/*.o net/*.o
