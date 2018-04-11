TCS.DF<-read.csv("data/SNPS_FOR_ADDICTIONS.csv", header = T,
                 stringsAsFactors = F)
pmid<-unique(TCS.DF$pubmedid)

#A CONTINUACIÓN UN LOOP FOR PARA GENERAR LA TABLA DADA POR LOS ESTUDIOS
FINAL.DF<-data.frame(
    matrix("", nrow = 96, ncol = 3), stringsAsFactors = F) 
colnames(FINAL.DF)<-c("PUBMED_ID", "SNP_ID", "GENES")

FINAL.DF$PUBMED_ID<-unlist(pmid)

#INTEGRANDO LOS RSs EN LA TABLA (IDENTIFICANDO SNPs)
indices<-grep(pattern = "\\b23533358\\b", TCS.DF$pubmedid) 
rsids<-TCS.DF$snpid[indices]
rsids<-paste(rsids, collapse = ",")
FINAL.DF[1,2]<-rsids

#INTEGRACIÓN DE LA INFORMACIÓN FALTANTE EN LLLLLLLLA COLUMNA DE 
#GENES
genes<-TCS.DF$genesymbol[indices]
genes<-paste(genes, collapse = ",")
FINAL.DF[1,3]<-genes

