# install.packages("gggenes")
library(ggplot2)
library(gggenes)

setwd("c:/Users/cbw94/Desktop/")
df <- read.csv("candidates.csv",header = TRUE)
# df <- df[c(1:24),]
df


ggplot(df,aes(xmin = start,xmax = end,y = chrom,fill = gene))+
  geom_gene_arrow(stat = "identity",position = "identity",
                  show.legend = FALSE,
                  inherit.aes = TRUE,
                  arrowhead_width = grid::unit(6, "mm"),
                  arrowhead_height = grid::unit(4, "mm"),
                  arrow_body_height = grid::unit(3, "mm"))+
  theme_classic()
  

