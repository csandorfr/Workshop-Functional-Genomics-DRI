compute_score_gene<-function(gene,info_gene_pln){
  score<-sum(info_gene_pln$V3[which(info_gene_pln$V1==gene | info_gene_pln$V2==gene)])
  return (score)
}

make_table_matching<-function(gene,df_match,nb_gene){
  df_match_red<-df_match[df_match$gene!=gene,]
  df_match_red$dist<-abs(df_match_red$score_size-df_match$score_size[df_match==gene])
  df_match_red$score<-abs(df_match_red$score_norm-df_match$score_norm[df_match==gene])
  df_match_red$value<-0.5*df_match_red$dist+0.5*df_match_red$score
  df_match_red_order<-df_match_red[order(df_match_red$value),]
  return(df_match_red_order$gene[c(1:nb_gene)])
}

range01 <- function(x){(x-min(x))/(max(x)-min(x))}

generate_background<-function(f_size,info_gene_pln,nb_links,nb_gene,list_gene_ens) {

  # get cds sequence length
  info_gene_size<-read.table(f_size,h=F)
  colnames(info_gene_size)<-c("gene","size","size2")
  
  # compute sum of weight by gene
  list_all_gene<-unique(c(as.character(info_gene_pln$V1),as.character(info_gene_pln$V2)))
  list_score<-sapply(list_all_gene,compute_score_gene,info_gene_pln=info_gene_pln)
  
  # dataframe gene connectivity and gene size
  df_match<-data.frame(list_score)
  df_match$gene<-row.names(df_match)
  df_match<-merge(df_match,info_gene_size,by=c("gene"))
  df_match$score_norm<-range01(df_match$list_score)
  df_match$score_size<-range01(df_match$size)
  
  # match gene by connectivity and coding sequence length
  list_gene_ens_red<-list_gene_ens[list_gene_ens %in% df_match$gene]
  df_background<-sapply(list_gene_ens_red,make_table_matching,df_match=df_match,nb_gene = nb_gene)
  
  # return background gene
  return (df_background)

}
