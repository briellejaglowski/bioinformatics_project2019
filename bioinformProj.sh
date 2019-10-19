
#shell script for Bioinformatic projects
#usage: bash bioinformProj.sh "$1" "$2"
# initiate final file
echo: "Number,mcrA,hsp70" > finaloutput.txt

#mcrA

#cat all mcrA gene reference sequences into one file
#usage: "$1" = ref_sequences/mcrAgene_*.fasta
cat "$1" > ref_sequences/combmcrA.fasta

#muscle to align mcrAgene reference sequences
./muscle3.8.31_i86linux64 -in ref_sequences/combmcrA.fasta -out alignmcrA.afa

# Path to hmmr files
PATH=$PATH:~/Private/bin/bin
 
#hmmbuild for aligned mcrAgene
hmmbuild mcrabuilt.hmm alignmcrA.afa

#for loop with hmmsearch to compare with built aligned mcrA sequences with proteomes 1 through 50
#set variable mcrA to output of hmmbuild with matches
for Number in {01..50}
do
hmmsearch --tblout mcrA_$Number.out mcrabuilt.hmm proteomes/proteome_$Number.fasta  
mcrA=$(cat mcrA_$Number.out | grep -v '#' -m 1 | wc -l)
done

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

#for loop with hmmsearch to identify matches
#set variable hsp70 to output of hmmbuild with matches
for Number in {01..50}
do
hmmsearch --tblout hsp70_$Number.out hsp70built.hmm proteomes/proteome_$Number.fasta 
hsp70=$(cat hsp70_$Number.out | grep -v '#' | wc -l )
echo "$Number,$mcrA,$hsp70" >> finaloutput.txt
done 
