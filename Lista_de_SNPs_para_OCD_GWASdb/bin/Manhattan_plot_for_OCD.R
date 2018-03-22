#A CONTINUACIÓN, ESTE CRIPT SE ENCARGARÁ DE REALIZAR UN MANHATTAN PLOT CON LOS ESTUDIOS 
#DESCARGADOS DE GWASdb RELACIONADOS CON EL FENOTIPO DE TRASTORNO OBSESIVO-COMPULSIVO

library(data.table)
library(qqman)
#View(gwasResults) #DATOS DE PRUEBA
GWAS_FOR_OCD.DF<-read.csv("data/SNPS_FOR_OCD.csv", header = T, stringsAsFactors = F)
man_ocd<-subset(GWAS_FOR_OCD.DF, select = c(snpid, chr, pos, pval))
colnames(man_ocd) <- c("SNP", "CHR", "BP", "P")
manhattan(man_ocd)
##EL CÓDIGO SÓLO PERMITE VALORES NUMÉRICOS EN LA COLUMNA DE CROMOSOMAS, POR LO QUE
#SE CAMBIARÁN LOS NOMBRES DEL CROMOSOMA "X" O "Y" EN 23 Y 24
man_ocd$CHR[man_ocd$CHR == "X"] <- 23
man_ocd$CHR[man_ocd$CHR == "Y"] <- 24
man_ocd$CHR<-as.numeric(man_ocd$CHR)
manhattan(man_ocd, ylim=c(3,8))

#AHORA SE RESALTARÁN LOS POLIMORFISMOS CON UN VALOR DE P MENORES A 1X10^-5
P5<-subset(man_ocd, P<=1e-5)
P5<-as.vector(P5$SNP)

#VA EL MANHATTAN CON LOS POLIMORFISMOS RESALTADOS
manhattan(man_ocd, ylim=c(3,8), highlight = P5, 
main= "SNPs reacionados con el fenotipo del trastorno obsesivo-compulsivo",
cex.axis = 0.9, chrlabs = c(1:22, "X"))

##GUARDANDO LA GRÁFICA
pdf(file="results/SNPs_en_TOC.pdf", width = 9)

# Paso 2. Crear la figura en el archivo
manhattan(man_ocd, ylim=c(3,8), highlight = P5, 
          main= "SNPs reacionados con el fenotipo del trastorno obsesivo-compulsivo",
          cex.axis = 0.9, chrlabs = c(1:22, "X"))
# Paso 3. Cerrar el archivo
dev.off()
