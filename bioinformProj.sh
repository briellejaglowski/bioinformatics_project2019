
#shell script for Bioinformatic projects


#mcrA
#cat all reference sequences into one file
#usage: "$@" is fasta files in proteomes
cat *.fasta > "combined.fasta"

#muscle to align reference sequences
./muscle3.8.31_i86linux64 -in combined.fasta -out aligned.fasta

# Path to hmmr files
PATH=$PATH:~/Private/bin/bin
 
#hmmbuild
hmmbuild mcrabuilt.hmm aligned.fasta

#hmmsearch
#hmmsearch -g mcrabuilt.hmm aligned.fasta > mcra.out

