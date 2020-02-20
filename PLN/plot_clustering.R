
plot_clustering<-function(clustering) {
  suppressMessages(library(ggplot2))
  
  list_all_val<-c(clustering[[1]],clustering[[2]])
  range01 <- function(x){(x-min(x))/(max(x)-min(x))}
  list_all_val_norm<-range01(list_all_val)
  
  df<-data.frame(list_all_val_norm)
  colnames(df)[1]<-"score"
  
  title<-paste("p-value = ",clustering[[3]],sep="")
  
  p<-ggplot(df, aes(x=score)) + 
    geom_histogram(color="black", fill="white")+
    geom_vline(xintercept=list_all_val_norm[1],linetype = "longdash")+
    labs(title=title, x ="Random distribution of the\n sum of weighted linked within PLN", y = "Density")+
    theme(plot.title = element_text(hjust = 0.5)) 

  
  return (p)
}