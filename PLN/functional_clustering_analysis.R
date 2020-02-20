# package
suppressMessages(library(biomaRt))
suppressMessages(library(ggplot2))
suppressMessages(library(gridExtra))

source('generate_background.R')
source('compute_clustering.R')
source('plot_clustering.R')
source('get_info_links_network.R')
source('make_network.R')

# remove warnings
options(warn=-1)

options(echo=TRUE)
args <- commandArgs(trailingOnly = TRUE)
print(args)

# parameters
f_gene <-args[1]
f_pln<-args[2]
f_output<-args[3]
f_size<-args[4]

# Fixed parameters
nb_gene<-100
nb_links<-1000000
f_size<-"/Users/dpag0499/OneDrive - Cardiff University/Documents/PROJECTS/PLN_Demo_Workshop/data/others/hs_68_cds_max_mean_length"
f_pln<-"/Users/dpag0499/OneDrive - Cardiff University/Documents/PROJECTS/PLN_Demo_Workshop/data/example_new/wl_general.final.scale.ord"
f_gene<-"/Users/dpag0499/OneDrive - Cardiff University/Documents/PROJECTS/PLN_Demo_Workshop/data/example_new/list_gene_symbol"
nb_sim<-100
f_list_dataset="/Users/dpag0499/OneDrive - Cardiff University/Documents/PROJECTS/PLN_Demo_Workshop/data/example_new/list_file_rescore_wl_info_wl.general"
dir_data<-"/Users/dpag0499/OneDrive - Cardiff University/Documents/PROJECTS/PLN_Demo_Workshop/data/example_new"


# get list of genes
gene<-read.table(f_gene,header=FALSE)

# convert gene symbol to ensembl gene
ensembl = useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl")
query_ensembl<-getBM(attributes=c('ensembl_gene_id','hgnc_symbol'), filters ='hgnc_symbol', values =gene$V1, mart = ensembl)
list_gene_ens<-unique(query_ensembl$ensembl_gene_id)

# get info pln
info_gene_pln<-read.table(f_pln,h=F,nrows = nb_links)

# generate the background
df_background<-generate_background(f_size,info_gene_pln,nb_links,nb_gene,list_gene_ens)

# test clustering
clustering<-compute_clustering(df_background,info_gene_pln,nb_sim,nb_gene)

# plot clustering
p_clustering<-plot_clustering(clustering) 

# get info dataset subnetwork
info_gene_pln_sub<-get_info_links_network(f_list_dataset,dir_data,list_gene_ens)

# get info links network
p_net<-make_network(info_gene_pln_sub)

# network representation
p_empty<-ggplot() + theme_void()
grid.arrange(p_clustering,p_empty,p_net,  ncol = 3,layout_matrix = rbind(c(1,3,3,3), c(2,3,3,3)))


