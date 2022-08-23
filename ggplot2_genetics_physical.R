setwd("d:/bioinformatics/R/my_work/")
library(xlsx)
df <- read.xlsx("genetics_physics.xlsx",sheetIndex = 1,header = TRUE)
head(df)
tail(df)

library(ggplot2)
ggplot(df,aes(x=locus,y=physic_position))

a <- ggplot(df,aes(x=locus,y=physic_position,color = color_type))+
  geom_point(size=1)

a

a+geom_point(size=1)+  facet_wrap(~ Chromosome,nrow = 3,scales = "free")
