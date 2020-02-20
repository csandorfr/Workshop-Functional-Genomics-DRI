make_network<-function(info_gene_pln_sub) {

  # package
  suppressMessages(library(biomaRt))
  suppressMessages(library(igraph))
  suppressMessages(library(ggnetwork))
  suppressMessages(library(network))
  
  # remove warnings
  options(warn=-1)
  
  # convert gene symbol to ensembl gene
  list_all_gene<-unique(c(as.character(info_gene_pln_sub$V1),as.character(info_gene_pln_sub$V2)))
  ensembl = useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl")
  query_ensembl<-getBM(attributes=c('ensembl_gene_id','hgnc_symbol'), filters ='ensembl_gene_id', values =list_all_gene, mart = ensembl)
  colnames(query_ensembl)[1]<-"V1"
  info_gene_pln_sub2<-merge(info_gene_pln_sub,query_ensembl,by=c("V1"))
  colnames(query_ensembl)[1]<-"V2"
  info_gene_pln_sub3<-merge(info_gene_pln_sub2,query_ensembl,by=c("V2"))
  info_gene_pln_sub<-info_gene_pln_sub3[,c(5,6,3,4)]
  rm(info_gene_pln_sub2,info_gene_pln_sub3)
  colnames(info_gene_pln_sub)<-c("source","target","weight","dataset")
  
  # ipgraph object
  net_gene<-as.data.frame(unique(c(as.character(info_gene_pln_sub[,1]),as.character(info_gene_pln_sub[,2]))))
  net_links<-info_gene_pln_sub
  colnames(net_gene)[1]<-"id"
  colnames(net_links)[2]<-"to"
  colnames(net_links)[1]<-"from"
  colnames(net_links)[4]<-"dataset"
  net <- graph_from_data_frame(d=net_links, vertices=net_gene, directed=F)
  
  
  p<-ggplot(ggnetwork(net,layout = "fruchtermanreingold"), aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_edges(aes(color = dataset),curvature = 0.1) +
    geom_nodes(color = "grey50",size=8) +
    geom_nodetext(aes(label = vertex.names),fontface = "bold") +
    theme_blank()
  
  return (p)

}

