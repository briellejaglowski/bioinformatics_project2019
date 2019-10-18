
#shell script for Bioinformatic projects


#mcrA
#cat all reference sequences into one file
#usage: "$@" is fasta files in proteomes
cat "$@" >> "$combined.fasta"
cat *.fasta >> "combined.fasta"
#muscle to align reference sequences.
muscle -in combined.fasta -out aligned.fasta
#hmmbuild
hmmbuild mcrabuilt.hmm aligned.fasta
#hmmsearch
hmmsearch -g mcrabuilt.hmm aligned.fasta > mcra.out

