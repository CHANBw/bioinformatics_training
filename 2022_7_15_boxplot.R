# 2022/7/15绘制box-plot图

data1 <- read.csv("kasp5153455674_1.csv",header = TRUE,sep = ",")
head(data1)

library(ggplot2)
install.packages("ggsignif")
library(ggsignif)

compaired <- list(c("A", "B"),
                  c("A","H"), 
                  c("B","H"))

ggplot(data = data1,aes(x=genotype,y=spike_length,fill=genotype))+
  geom_boxplot()

ggplot(data = data1,aes(x=genotype,y=spike_length,fill=genotype))+
  geom_boxplot()+ylim(6, 13.5)

ggplot(data = data1,aes(x=genotype,y=phenotype,fill=genotype))+
  geom_boxplot() + geom_signif(comparisons = compaired,
                               step_increase = 0.5,
                               map_signif_level = FALSE,
                               test = t.test)

ggplot(data = data1,aes(x=genotype,y=phenotype,fill=genotype))+
  geom_violin()+ geom_signif(comparisons = compaired,
                                             step_increase = 0.3,
                                             map_signif_level = TRUE,
                                             test = t.test)

