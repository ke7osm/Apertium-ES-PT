all : es-pt.automorf.bin \
      es-pt.autogen.bin \
      es-pt.autobil.bin \
      es-pt.t1x.bin \
      pt-es.automorf.bin \
      pt-es.autogen.bin \
      pt-es.autobil.bin

es-pt.automorf.bin : apertium-es.es.dix
	lt-comp lr apertium-es.es.dix es-pt.automorf.bin

es-pt.autogen.bin : apertium-pt.pt.dix
	lt-comp rl apertium-pt.pt.dix es-pt.autogen.bin

pt-es.automorf.bin : apertium-pt.pt.dix
	lt-comp lr apertium-pt.pt.dix pt-es.automorf.bin

pt-es.autogen.bin : apertium-es.es.dix
	lt-comp rl apertium-es.es.dix pt-es.autogen.bin

es-pt.autobil.bin : apertium-es-pt.es-pt.dix
	lt-comp lr apertium-es-pt.es-pt.dix es-pt.autobil.bin

pt-es.autobil.bin : apertium-es-pt.es-pt.dix
	lt-comp rl apertium-es-pt.es-pt.dix pt-es.autobil.bin

es-pt.t1x.bin : apertium-es-pt.es-pt.t1x
	apertium-preprocess-transfer apertium-es-pt.es-pt.t1x es-pt.t1x.bin

.PHONY : clean
clean :
	-rm *.bin

.PHONY : check
check :
	bash tests.sh