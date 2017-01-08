TMP=tmp
OUT=out

NUMBERS-0001-TO-1000=$(TMP)/numbers-0001-to-1000.txt
DERU-F1-SENTENCES-MEMRISE=$(TMP)/deru-f1-sentences-memrise.csv
DERU-F1-SENTENCES-DE=$(TMP)/deru-f1-sentences-DE.txt
DERU-F1-SENTENCES-RU=$(TMP)/deru-f1-sentences-RU.txt
DERU-F1-SENTENCES-ROM=$(TMP)/deru-f1-sentences-ROM.txt
DERU-F1-SENTENCES-IPA=$(TMP)/deru-f1-sentences-IPA.txt
DERU-F1-SENTENCES=$(TMP)/deru-f1-sentences.txt
DERU-F1-EBOOK-TEXT=$(TMP)/deru-f1-ebook.txt
DERU-F1-EBOOK-PDF=GLOSSIKA-DERU-F1-EBK.pdf

all: $(DERU-F1-SENTENCES-MEMRISE)

tmp:
	mkdir -p $(TMP)

out:
	mkdir -p $(OUT)

$(DERU-F1-SENTENCES-MEMRISE):\
                       $(DERU-F1-SENTENCES-RU)\
                       $(DERU-F1-SENTENCES-DE)\
                       $(NUMBERS-0001-TO-1000)\
                       $(DERU-F1-SENTENCES-ROM)\
                       $(DERU-F1-SENTENCES-IPA) | tmp out
	#./sh/memrise-de-ru-rom-ipa.sh $^ > $@
	paste $^ > $@
	(cd $(TMP); split -l 99 -a 1 $(@F) memrise-deru-f1-)

$(NUMBERS-0001-TO-1000): | tmp
	seq -w 0001 1000 > $@

$(DERU-F1-SENTENCES-DE): $(DERU-F1-SENTENCES) | tmp
	./sh/DE-from-sentences.sh $(DERU-F1-SENTENCES) > $@

$(DERU-F1-SENTENCES-RU): $(DERU-F1-SENTENCES) | tmp
	./sh/RU-from-sentences.sh $(DERU-F1-SENTENCES) > $@

$(DERU-F1-SENTENCES-ROM): $(DERU-F1-SENTENCES) | tmp
	./sh/ROM-from-sentences.sh $(DERU-F1-SENTENCES) > $@

$(DERU-F1-SENTENCES-IPA): $(DERU-F1-SENTENCES) | tmp
	./sh/IPA-from-sentences.sh $(DERU-F1-SENTENCES) > $@


$(DERU-F1-SENTENCES): $(DERU-F1-EBOOK-TEXT) | tmp
	./sh/sentences-from-text.sh $(DERU-F1-EBOOK-TEXT) > $@

$(DERU-F1-EBOOK-TEXT): | tmp
	./sh/text-from-pdf.sh $(DERU-F1-EBOOK-PDF) > $@
 
clean:
	rm -rf $(OUT) $(TMP)
