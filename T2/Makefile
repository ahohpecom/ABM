C_OPTS = -Wnowarn=1506 -g -I headers -I mqm/inc -L mqm/lib -lmqm 
CXX = C:\NonStop\L25.02\usr\bin\c89.exe
OBJS = build/AAAPUT.o

LIBS = 

TARGET = build/AAAPUT.exe

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) ${C_OPTS} $(OBJS) $(LIBS)

all:	$(TARGET)

build/AAAPUT.o: src/AAAPUT.c
	$(CXX) $(C_OPTS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
