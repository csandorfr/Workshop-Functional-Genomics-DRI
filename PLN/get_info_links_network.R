get_info_links_network<-function(f_list_dataset,dir_data,list_gene_ens,info_gene_pln) {

  get_max_info_link<-function(index,info_gene_pln,info_pln_ind) {
    gene1<-as.character(info_gene_pln$V1[index])
    gene2<-as.character(info_gene_pln$V2[index])
    index_pair1<-which(info_pln_ind$V1==gene1 & info_pln_ind$V2==gene2)
    index_pair2<-which(info_pln_ind$V1==gene2 & info_pln_ind$V2==gene1)
    df<-info_pln_ind[c(index_pair1,index_pair2),]
    df_ord<-df[order(-df$V3),]
    return(as.character(df_ord$Type[1]))
  }
  
  
  # get info links dataset
  info_dataset<-read.table(f_list_dataset,h=F)
  colnames(info_dataset)<-c("File","Type")
  
  # sub network
  index_gene<-which(info_gene_pln$V1 %in% list_gene_ens & info_gene_pln$V2 %in% list_gene_ens)
  info_gene_pln_sub<-info_gene_pln[index_gene,]
  
  # get individual dataset
#  rm(info_pln_ind)
  for (i in c(1:dim(info_dataset)[1])) {
    file<-paste(dir_data,"/",info_dataset$File[i],sep="")
    info_temp<-read.table(file,h=F)
    index_gene<-which(info_temp$V1 %in% list_gene_ens & info_temp$V2 %in% list_gene_ens)
    info_temp<-info_temp[index_gene,]
    info_temp$Type<-info_dataset$Type[i]
    if (!exists("info_pln_ind")) {
      info_pln_ind<-info_temp
    }
    else{
      info_pln_ind<-rbind(info_pln_ind,info_temp)
    }
  }
  
  # get dataset
  list_dataset_info<-sapply(c(1:dim(info_gene_pln_sub)[1]),get_max_info_link,info_gene_pln=info_gene_pln_sub,info_pln_ind=info_pln_ind)
  info_gene_pln_sub$dataset<-list_dataset_info
  
  return (info_gene_pln_sub)
}
