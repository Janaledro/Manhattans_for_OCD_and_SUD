#A CONTINUACIÓN, ESTE CRIPT SE ENCARGARÁ DE REALIZAR UN MANHATTAN PLOT CON LOS ESTUDIOS 
#DESCARGADOS DE GWASdb RELACIONADOS CON EL FENOTIPO DE TRASTORNO POR ABUSO DE SUSTANCIAS

library(data.table)
library(qqman)
#View(gwasResults) #DATS DE PRUEBA
GWAS_FOR_ADDICTIONS.DF<-read.csv("data/SNPS_FOR_ADDICTIONS.csv", header = T)
                                 
man_tcs<-subset(GWAS_FOR_ADDICTIONS.DF, select = c(snpid, chr, pos, pval))
colnames(man_tcs) <- c("SNP", "CHR", "BP", "P")
manhattan(subset(man_tcs, P>=1e-100), ylim= c(0,60))
#A CONTINUACIÓN, SE RESALTARÁN LOS POLIMORFISMOS MÁS SIGNIFICATIVOS PARA ESTE 
#TRASTORNO/FENOTIPO
P8<-subset(man_tcs, P<=1e-8)
P8v<-as.vector(P8$SNP)

###AL RESALTAR LOS POLIMORFISMOS DE INTERÉS, EXISTE UN DESFASE EN LA ANOTACIÓN DE
#ESTOS POLIMORFISMOS, PARA COLOCAROS MANUALMENTE, SE ELEGIRÁN LOS PRIMEROS 10 CON 
#LOS VALORES DE P SIGNIFICATIVOS  

P8<-P8[with(P8, order(P8$P, decreasing =F)),]
annoted_rs<-as.vector(P8$SNP[1:20])

#UNA VEZ GENERADA LA LISTA DE POLIMORFISMOS RELEVANTES, SE PROCEDERÁ A GRAFICAR
manhattan(subset(man_tcs, P>=1e-100),
          main= "SNPs en fenotipos relacionados con TCS", highlight = P8v)

##GUARDANDO LA GRÁFICA
pdf(file="results/SNPs_for_TCS.pdf", width = 13)

# Paso 2. Crear la figura en el archivo
manhattan(subset(man_tcs, P>=1e-100),
          main= "SNPs en fenotipos relacionados con TCS", highlight = P8v)

# Paso 3. Cerrar el archivo
dev.off()
  

