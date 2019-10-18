
#shell script for Bioinformatic projects
#usage: bash bioinformProj.sh "$@"

#mcrA
#cat all mcrA gene reference sequences into one file
#usage: "$@" = ref_sequences/mcrAgene_*.fasta
#This works!
cat "$@" > ref_sequences/combmcrA.fasta

#muscle to align mcrAgene reference sequences
./muscle3.8.31_i86linux64 -in ref_sequences/combmcrA.fasta -out alignmcrA.afa

# Path to hmmr files
PATH=$PATH:~/Private/bin/bin
 
#hmmbuild for aligned mcrAgene
hmmbuild mcrabuilt.hmm alignmcrA.afa

#hmmsearch for mcrAgene
#hmmsearch -g mcrabuilt.hmm alignmcrA.afa > mcra.out

