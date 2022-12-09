CXX=g++

STATIC=main.cpp disp.cpp prog.cpp util.cpp
OBJ_STATIC=$(patsubst %.cpp, %.o, $(STATIC))

GL=-lGLEW -lGL
SDL=-lSDL2
LDFLAGS+=$(SDL)
LDFLAGS+=$(GL)

.PHONY: all
all: make

%.o: %.cpp %.h
	$(CXX) -c $< -o $@ $(LDFLAGS)

main.o: main.cpp
	$(CXX) -c $< -o $@ $(LDFLAGS)

.PHONY: make
make: $(OBJ_STATIC) $(HDR)
	$(CXX) $^ $(LDFLAGS)

.PHONY: clean
clean:
	rm *.o a.out
