TCS.DF<-read.csv("data/SNPS_FOR_ADDICTIONS.csv", header = T)
pubmed_id<-TCS.DF$pubmedid
A<-table(pubmed_id)
pmid<-unique(TCS.DF$pubmedid)

#A CONTINUACIÓN UN LOOP FOR PARA GENERAR LA TABLA DADA POR LOS ESTUDIOS
FINAL.DF<-data.frame(
    matrix("", nrow = 96, ncol = 3))
colnames(FINAL.DF)<-c("PUBMED_ID", "SNP_ID", "GENES")

FINAL.DF$PUBMED_ID<-unlist(pmid)

#trying<-grep(pattern = "\\b1\\b", TCS.DF$pubmedid)

rsids[,i]<-TCS.DF$snpid[trying]

for(i in length(pmid)) {
  message(paste0("Estoy buscando la información del estudio ", pmid[i]))
  indice<-grep(i, TCS.DF$pubmedid[i], fixed = T)
}
