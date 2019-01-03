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
  - use usearch for identify homologs instead of BLAST
### 5)
  - use annotated  (ROK,MVAT,LSR2 and HNS) silencer sec. struc. sequences as query for usearch
  
  usearch -search_global all_SSseq.fs -db SecStructure.fs -id 0.7 -blast6out usearch.out -maxaccepts 5000
  or faster with
  usearch -usearch_global all_SSseq.fs -db SecStructure.fs -id 0.7 -blast6out usearch.out -maxaccepts 5000
  
  
