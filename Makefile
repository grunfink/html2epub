PROJ=html2epub
PREFIX=/usr/local/bin

all:
	@echo "Run make install to install."

install:
	install -m 755 $(PROJ) $(PREFIX)/$(PROJ)

uninstall:
	rm -f $(PREFIX)/$(PROJ)

test: carcosa.epub

carcosa.epub: carcosa.txt
	./html2epub -t "An Inhabitant of Carcosa" \
		-a "Ambrose Bierce" -l en carcosa.epub carcosa.txt

debug:
	./html2epub -t "An Inhabitant of Carcosa" \
		-a "Ambrose Bierce" -l en carcosa.epub carcosa.txt -I

dist: clean
	rm -f html2epub.tar.gz && cd .. && \
		tar czvf html2epub/html2epub.tar.gz html2epub/*

clean:
	rm -f carcosa.epub *.tar.gz *.asc

run:
	./html2epub || true
