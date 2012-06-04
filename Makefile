CC = gcc
CFLAGS = -fPIC -lmarkdown -O3 -Wall --ansi --shared

prefix = ${shell arc --show-prefix}

bindir = $(DESTDIR)/$(prefix)/bin
libdir = $(DESTDIR)/$(prefix)/lib/arc/site

all: markdown.so

markdown.so: markdown.c
	$(CC) $(CFLAGS) -o $@ $<

install:
	mkdir -p $(libdir)
	cp markdown.so $(libdir)/markdown.so
	cp markdown.arc $(libdir)/markdown.arc

uninstall:
	rm -rf $(libdir)/markdown.so
	rm -rf $(libdir)/markdown.arc

clean:
	rm -rf markdown.so

test:
	prove -fe arc t
