LUA_PREFIX = /usr/local/
PREFIX	= /usr/local/
MODULE = rngcore
VERSION = 1.0.0

INSTALL_PREFIX = $(PREFIX)/lib/lua/5.1/

CC	= gcc
TARGET	= rngcore.so
OBJS	= rngcore.o SFMT.o
LIBS	=
CFLAGS	= -I $(LUA_PREFIX)/include -fPIC -Wall
LDFLAGS	= -shared -fPIC

default: $(TARGET)


install: default
	install -d $(INSTALL_PREFIX)
	install $(TARGET) $(INSTALL_PREFIX)

clean:
	rm -rf $(OBJS) $(TARGET) $(MODULE)-$(VERSION)

package: clean
	mkdir $(MODULE)-$(VERSION)
	cp *.c *.h rng.lua COPYING Makefile $(MODULE)-$(VERSION)
	tar cvzf $(MODULE)-$(VERSION).tar.gz $(MODULE)-$(VERSION)
	rm -rf $(MODULE)-$(VERSION)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
