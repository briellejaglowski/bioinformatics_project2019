
#shell script for Bioinformatic projects
#usage: bash bioinformProj.sh "$1"

#mcrA
#cat all mcrA gene reference sequences into one file
#usage: "$1" = ref_sequences/mcrAgene_*.fasta
#This works!
#cat "$1" > ref_sequences/combmcrA.fasta

#muscle to align mcrAgene reference sequences
#./muscle3.8.31_i86linux64 -in ref_sequences/combmcrA.fasta -out alignmcrA.afa

# Path to hmmr files
#PATH=$PATH:~/Private/bin/bin
 
#hmmbuild for aligned mcrAgene
#hmmbuild mcrabuilt.hmm alignmcrA.afa

#hmmsearch for mcrAgene in proteomes

#for loop with hmmsearch to compare with built aligned mcrA sequences with proteomes 1 through 50
#for N in {01..50}
#do
#hmmsearch mcrabuilt.hmm proteomes/proteome_$N.fasta > mcra.out
#done

#need to insert code here to select suitable proteomes from mcra.out

#hsp70
#cat all hsp70 gene reference sequences into one file
#usage: "$2" = ref_sequences/hsp70gene_*.fasta
cat "$2" > ref_sequences/combhsp70.fasta

#muscle to align hsp70gene reference sequence
./muscle3.8.31_i86linux64 -in ref_sequences/combhsp70.fasta -out alignhsp70.afa

#Path to hmmr files
PATH=$PATH:~/Private/bin/bin

#hmmbuild for aligned hsp70gene
hmmbuild hsp70built.hmm alignhsp70.afa

#for loop with hmmsearch to compare with build aligned hsp70gene sequences with proteomes 1 through 50
#for N in {01..50}
#do
#hmmsearch hsp70built.hmm proteomes/proteome_$N.fasta > hsp70.out
#done 
