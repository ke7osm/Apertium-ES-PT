declare -a sentences=("El hombre camina"
			"Yo corro"
			"ella camina")


for sent in "${sentences[@]}"
do
	echo -e ${sent}$"\t\t"$(echo ${sent} | lt-proc es-pt.automorf.bin |   gawk 'BEGIN{RS="$"; FS="/";}{nf=split($1,COMPONENTS,"^"); for(i = 1; i<nf; i++) printf COMPONENTS[i]; if($2 != "") printf("^%s$",$2);}' | \
  apertium-transfer apertium-es-pt.es-pt.t1x es-pt.t1x.bin es-pt.autobil.bin | \
  lt-proc -g es-pt.autogen.bin)
done

