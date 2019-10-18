
#shell script for Bioinformatic projects
#usage: bash bioinformProj.sh "$@"

#mcrA
#cat all mcrA gene reference sequences into one file
#usage: "$@" = ref_sequences/mcrAgene_$$.fasta
cat "$@" > combined.fasta

#muscle to align reference sequences
./muscle3.8.31_i86linux64 -in combined.fasta -out aligned.afa

# Path to hmmr files
PATH=$PATH:~/Private/bin/bin
 
#hmmbuild
hmmbuild mcrabuilt.hmm aligned.fasta

#hmmsearch
#hmmsearch -g mcrabuilt.hmm aligned.fasta > mcra.out

