# Combing each result of 20 replicates and get summary statistics of sensitivity and specificity. 
###############################
sub_sens=0; sub_spec=0
alle_sens=0; alle_spec=0
sub_sens=rbind(sub_sens, read.table("SS200Alle20Sens_Sub_1-30_fin.txt", header=T), read.table("SS200Alle20Sens_Sub_31-50_fin.txt", header=T), read.table("SS200Alle20Sens_Sub_51-100_fin.txt", header=T))
sub_spec=rbind(sub_spec, read.table("SS200Alle20Spec_Sub_1-30_fin.txt", header=T), read.table("SS200Alle20Spec_Sub_31-50_fin.txt", header=T), read.table("SS200Alle20Spec_Sub_51-100_fin.txt", header=T))
alle_sens=rbind(alle_sens, read.table("SS200Alle20Sens_Alle_1-30_fin.txt", header=T), read.table("SS200Alle20Sens_Alle_31-50_fin.txt", header=T), read.table("SS200Alle20Sens_Alle_51-100_fin.txt", header=T))
alle_spec=rbind(alle_spec, read.table("SS200Alle20Spec_Alle_1-30_fin.txt", header=T), read.table("SS200Alle20Spec_Alle_31-50_fin.txt", header=T), read.table("SS200Alle20Spec_Alle_51-100_fin.txt", header=T))

#######################################################
sub_sens=0; sub_spec=0
alle_sens=0; alle_spec=0
for (i in 1:5)
{
  sub_sens=rbind(sub_sens, read.table(paste("SS200Alle10Sens_Sub_", ((i-1)*20+1),"-",i*20, "_fin.txt", sep=""), header=T))
  sub_spec=rbind(sub_spec, read.table(paste("SS200Alle10Spec_Sub_", ((i-1)*20+1),"-",i*20, "_fin.txt", sep=""), header=T))
  alle_sens=rbind(alle_sens, read.table(paste("SS200Alle10Sens_Alle_", ((i-1)*20+1),"-",i*20, "_fin.txt", sep=""), header=T))
  alle_spec=rbind(alle_spec, read.table(paste("SS200Alle10Spec_Alle_", ((i-1)*20+1),"-",i*20, "_fin.txt", sep=""), header=T))
}
sub_sens=sub_sens[-1,]
sub_spec=sub_spec[-1,]
alle_sens=alle_sens[-1,]
alle_spec=alle_spec[-1,]
colMeans(sub_sens, na.rm=T)
smmy=matrix(nrow=7, ncol=4)
smmy[,1]=c(colMeans(sub_sens, na.rm=T), colMeans(alle_sens, na.rm=T)[1:4])
smmy[,2]=c(sd(sub_sens[,1], na.rm=T), sd(sub_sens[,2], na.rm=T), sd(sub_sens[,3], na.rm=T), sd(alle_sens[,1], na.rm=T), sd(alle_sens[,2], na.rm=T), 
           sd(alle_sens[,3], na.rm=T), sd(alle_sens[,4], na.rm=T))
smmy[,3]=c(colMeans(sub_spec, na.rm=T), colMeans(alle_spec, na.rm=T)[1:4])
smmy[,4]=c(sd(sub_spec[,1], na.rm=T), sd(sub_spec[,2], na.rm=T), sd(sub_spec[,3], na.rm=T), sd(alle_spec[,1], na.rm=T), sd(alle_spec[,2], na.rm=T), 
           sd(alle_spec[,3], na.rm=T), sd(alle_spec[,4], na.rm=T))
colnames(smmy)=c("Sens_mean", "Sens_SD", "Spec_mean", "Spec_SD")
rownames(smmy)=c("Sub_clust1", "Sub_clust2", "Sub_clust3", "Alle_clust11", "Alle_clust12", "Alle_clust21", "Alle_clust22")
