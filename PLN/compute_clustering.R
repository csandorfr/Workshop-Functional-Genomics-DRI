sum_links<-function(list_gene,info_gene_pln){
  score<-sum(info_gene_pln$V3[which(info_gene_pln$V1 %in% list_gene & info_gene_pln$V2 %in% list_gene)])
  return (score)
}


random_network<-function(df_background,info_gene_pln,nb_gene) {
  index_random<-sample(c(1:nb_gene),dim(df_background)[2],replace=TRUE)
  index_gene<-c(1:dim(df_background)[2])
  list_gene_random<-df_background[index_random,index_gene]
  df_pair<-data.frame(x=index_random,y=index_gene)
  df_pair$K <- apply( df_pair, 1, function(x,mat) mat[ x[1], x[2] ], mat=df_background )
  list_gene_random<-as.character(df_pair$K)
  score<-sum_links(list_gene_random,info_gene_pln)
  return (score)
}



compute_clustering<-function(df_background,info_gene_pln,nb_sim,nb_gene) {


  # compute the sum of between the set of genes
  list_gene<-colnames(df_background)
  score_obs<-sum_links(list_gene,info_gene_pln)
  
  # compute the sum of weighted for random set
  list_random_score=c()
  for (i in (1:nb_sim)) {
    list_random_score<-c(list_random_score,random_network(df_background,info_gene_pln,nb_gene))
  }
  
  # pvalue
  nb_time<-sum(list_random_score >= score_obs)
  p_value<-nb_time/nb_sim

  list_val<-list()
  list_val[[1]]<-score_obs
  list_val[[2]]<-list_random_score
  list_val[[3]]<-p_value
  return(list_val)
}
