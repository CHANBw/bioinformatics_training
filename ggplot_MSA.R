#  序列比对及美化

setwd("d:/bioinformatics/R/training/")
getwd()

library(stringr)
library(tidyverse)

#  安装phytools包
#devtools::install_github("helixcn/phylotools", build_vignettes = TRUE)
df <- phylotools::read.fasta("pnas.fasta")
df


# 把序列拆分为一个碱基一列

#  separate里面依次是要操作的列名，新列名，分隔识别符
df %>% 
  tidyr::separate(seq.text,paste0("col",str_pad(1:28,2,side = "left",pad = "0")),'') %>% 
  select(-col01) %>% 
  mutate(seq.name=factor(seq.name,levels = rev(seq.name))) %>% 
  pivot_longer(!seq.name) -> new.df

#  展示多序列比对结果
new.df
p1 <- ggplot(new.df,aes(x=name,y=seq.name))+
  geom_tile(fill="white")+
  geom_text(aes(label=value))+
  theme_bw()+
  theme(axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_blank())
p1


#  将每行起始和终止碱基位置标上
df1<-data.frame(x=0,
                y=11:1,
                label=c(671,668,669,666,744,743,756,736,706,747,759))
df2<-data.frame(x=28,
                y=11:1,
                label=c(695,692,693,690,770,665,777,761,727,768,780))

p2 <- p1+
  geom_text(data=df1,
            aes(x=x,y=y,label=label),
            inherit.aes = FALSE,hjust=1)+
  geom_text(data=df2,
            aes(x=x,y=y,label=label),
            inherit.aes = FALSE,hjust=0)+
  coord_equal(xlim = c(-1,29))
p2


#  在感兴趣的地方添加颜色

df3<-readxl::read_excel("data.xlsx")
df3


p3 <- p2 +
  geom_tile(data=df3,aes(x=x,y=y,fill=group),
            color="white",show.legend = FALSE)+
  geom_text(data=df3,aes(x=x,y=y,label=label),
            color="white")+
  scale_fill_manual(values = c("#00adef","#ed1b24"))+
  labs(x=NULL,y=NULL)

p3
