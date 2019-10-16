#shell script for Bioinformatic projects

#mcrA
#cat all reference sequences into one file
#usage: "$@" is fasta files in proteomes
cat "$@" >> "$combined.fasta"
#Use muscle to align reference sequences.

#hmmbuild

#hmmsearch
