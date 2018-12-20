# CyanoSilencer

Identification of putative silencer in Cyanobacteria using secondary structure homology.

### 1)
  - filter out putative candidates by protein length. Expected length is similar to H-NS / LSR2 etc... (>=100 <=200 amino acids)

### 2)
  - calculates PSMM matrix using psiblast
  
  psiblast_for_pssm.pl

### 3)
  - predict secondary structure by SPIDER 2 (Yang Y et al 2017 / DOI: 10.1007/978-1-4939-6406-2_6)
  
  run_secStructure_prediction.sh
### 4)
  - create a BLAST DB from the secondary structure data
### 5)
  - use silencer sec. struc. sequences as query for blast
  
  blastp -db SS_BLAST/SecStrucDB -query all_SSseq.fs -out ss_blast.out -num_threads 64 -outfmt 6 -evalue 0.005&
  
  
