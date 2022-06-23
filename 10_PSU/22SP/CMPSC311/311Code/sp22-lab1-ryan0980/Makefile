CC=gcc
CFLAGS=-c  -Wall -I. -fpic -g -fbounds-check  

OBJS=tester.o  student.o ref.o

%.o:	%.c %.h
	$(CC) $(CFLAGS) $< -o $@ 

tester:	$(OBJS)
	$(CC) $(LDFLAGS)  -o $@ $^

clean:
	rm -f student.o tester.o tester
