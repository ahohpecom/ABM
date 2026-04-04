C_OPTS = -Wnowarn=1506 -g -I mqm/inc -L mqm/lib -lmqm 
CXX = C:\NonStop\L25.02\usr\bin\c89.exe
OBJS = build/MQPUT.o

LIBS = 

TARGET = build/MQPUT.exe

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) ${C_OPTS} $(OBJS) $(LIBS)

all:	$(TARGET)

build/MQPUT.o: src/MQPUT.c
	$(CXX) $(C_OPTS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
