
#shell script for Bioinformatic projects


#mcrA
#cat all reference sequences into one file
<<<<<<< HEAD
#usage: "$@" is fasta files in proteomes
cat "$@" >> "$combined.fasta"
=======
cat *.fasta >> "combined.fasta"
>>>>>>> 4cc1b20d965cb91ed33b36094fd127042250f0de
#Use muscle to align reference sequences.
./muscle3.8.31_i86linux.32 -in combined.fasta -out aligned.fasta
#hmmbuild
hmmbuild mcrabuilt.hmm aligned.fasta
#hmmsearch
hmmsearch -g mcrabuilt.hmm aligned.fasta > mcra.out

