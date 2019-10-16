#shell script for Bioinformatic projects

#mcrA
#cat all reference sequences into one file
cat "$@" >> "$combined.fasta"
#Use muscle to align reference sequences.
./muscle3.8.31_i86linux.32 -in $combined.fasta -out $aligned.fasta
#hmmbuild

#hmmsearch
