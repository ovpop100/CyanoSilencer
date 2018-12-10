# load taxa
library(data.table)
library(segmenTier)


taxa=fread("~/external_volumes/bacTax.txt",sep = ";")
prot_size=fread("~/HHU_Projects/silencer/genome_gene_prot_len.tmp",sep="\t",header=F)
mi=match(prot_size$V1,taxa$accession)
prot_size$V4=taxa$phylum[mi]
prot_size$V5=taxa$family[mi]
# get all Cyanobacteria
i=which(prot_size$V4=="Cyanobacteria")
#filter out proteins with size range of 100 to 200
j=which(prot_size$V3[i]>=100 & prot_size$V3[i]<200)
pp=prot_size[i[j],]

## write Cyano candiates for silencer to file

write.table(pp,file="~/HHU_Projects/silencer/Cyano_Silencer/cyano_candidates.txt",sep = "\t",
            row.names = F,col.names = F,quote = F)

#check how many proteins per genome (ppg)
ppg=table(pp$V1)
plotdev("~/HHU_Projects/silencer/Cyano_Silencer/figures/hist_ProteinPerGenome","png",6,6,150)
hist(ppg,50,col="purple",main="Proteins per genome",xlab="# of preoteins in range >=100 <200")
dev.off() 


