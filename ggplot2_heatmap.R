# encoding by UTF-8


#  长短数据变换


# install.packages("tidyverse")
library(tidyr)
tdata <- mtcars[,1:5]
head(tdata)
tdata <- data.frame(name=rownames(tdata),tdata)
gather(tdata,key = "Key",value = "Value",cyl,disp,mpg,hp,drat)
tdata1 <- gather(tdata,"Term","Value",-name)
head(tdata1)

#  key是合并项列明，value是对应的数值，后面是需要合并的项，不写代表全部

gather(tdata,key = "Key",value = "Value",cyl:disp)
gather(tdata,key = "Key",value = "Value",mpg,cyl,-disp)

#  -将该列放到第一列
tdata <- tdata %>% pivot_longer(-name,names_to = "Term",values_to = "value")
tdata

# 宽数据变为长数据
tdata2 <- tdata1 %>% spread(Term,Value)
head(tdata2)




setwd(dir = "d:/bioinformatics/R/training/")
getwd()
gene_expdata <- read.delim("D:/bioinformatics/R/training/example_data.csv",
                         header = TRUE,sep = ",",row.names = 1)
head(gene_expdata)

#  先用pheatmap绘制

install.packages("pheatmap")
library(pheatmap)
pheatmap(gene_expdata)

#  显示框内数字
pheatmap(gene_expdata,display_numbers=gene_expdata)

install.packages("tidyverse")
library(ggplot2)
install.packages("readxl")

library(readxl)
my_data <- read_excel("D:/bioinformatics/R/training/example_data.xlsx")
head(my_data)

library(tidyverse)
mydat <- my_data %>% pivot_longer(-gene_name,names_to = "Sample",
                                  values_to = "expr_value")

library(ggplot2)
heatmap1 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)

heatmap1

#  接下来是调整基因顺序

mydat$gene_name <- factor(mydat$gene_name,
                          levels = c("gene_1","gene_2","gene_3",
                                     "gene_4","gene_5","gene_6","gene_7",
                                     "gene_8","gene_9","gene_10"))

heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)

#  上述函数中color是边界颜色
heatmap2

heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color="red")
heatmap2

#  更改方块颜色
install.packages("paletteer")
library(paletteer)

heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue")

heatmap2

#  将颜色与值调换
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)

heatmap2

#  调整坐标轴文本标签的位置，y轴左右，x轴是上下

heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top")+  scale_y_discrete(position = "right")

heatmap2

#  调整坐标轴的文本方向，axis.text.x表示调整x轴的文字
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top")+  
  scale_y_discrete(position = "right")+
  theme(axis.text.x = element_text(angle=60))

heatmap2

#  hjust和vjust分别水平（0左，1右）和垂直（0上，1下）调整文本位置
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top")+  
  scale_y_discrete(position = "right")+
  theme(axis.text.x = element_text(angle=60,hjust=0,vjust=1))

heatmap2

#  去掉灰色背景和坐标轴短线
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top")+  
  scale_y_discrete(position = "right")+
  theme(axis.text.x = element_text(angle=60,hjust=0,vjust=1),
        axis.ticks = element_blank(),panel.background = element_blank())
  
heatmap2

#  调整文本与图的距离
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top",expand = expansion(mult = c(0,0)))+  
  scale_y_discrete(position = "right",expand = expansion(mult = c(0,0)))+
  theme(axis.text.x = element_text(angle=60,hjust=0,vjust=1),
        axis.ticks = element_blank(),panel.background = element_blank())

heatmap2

#  显示方块中的文字
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top",expand = expansion(mult = c(0,0)))+  
  scale_y_discrete(position = "right",expand = expansion(mult = c(0,0)))+
  theme(axis.text.x = element_text(angle=60,hjust=0,vjust=1),
        axis.ticks = element_blank(),panel.background = element_blank())+
  geom_text(aes(label=expr_value))

heatmap2

#  将图注移到其他方向
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top",expand = expansion(mult = c(0,0)))+  
  scale_y_discrete(position = "right",expand = expansion(mult = c(0,0)))+
  theme(axis.text.x = element_text(angle=60,hjust=0,vjust=1),
        axis.ticks = element_blank(),panel.background = element_blank())+
  geom_text(aes(label=expr_value))+
  theme(legend.position = "top")

heatmap2

#  细化图注
heatmap2 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_tile(aes(fill=expr_value),color=NA)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_x_discrete(position = "top",expand = expansion(mult = c(0,0)))+  
  scale_y_discrete(position = "right",expand = expansion(mult = c(0,0)))+
  theme(axis.text.x = element_text(angle=60,hjust=0,vjust=1),
        axis.ticks = element_blank(),panel.background = element_blank())+
  geom_text(aes(label=expr_value))+
  theme(legend.position = "top")+
  guides(fill=guide_colorbar(title = "AAA",
                             title.position = "top",
                             title.hjust = 0.5,
                             barwidth = 20,
                             ticks = FALSE,
                             label = TRUE))

#  ticks图注中的短线，label颜色代表的值
heatmap2

#  泡泡图
heatmap3 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_point(aes(fill=expr_value,
                 size=expr_value),color="blue",shape=21)

heatmap3

#  调色
heatmap3 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_point(aes(fill=expr_value,
                 size=expr_value),color="blue",shape=21)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)

heatmap3

#  调整圆圈大小
heatmap3 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_point(aes(fill=expr_value,
                 size=expr_value),color="blue",shape=21)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_size_continuous(range = c(1,15))

heatmap3

#  调整图注
heatmap3 <- ggplot(mydat,aes(x=gene_name,y=Sample))+
  geom_point(aes(fill=expr_value,
                 size=expr_value),color="blue",shape=21)+
  scale_fill_paletteer_c("ggthemes::Classic Orange-White-Blue",
                         direction = -1)+
  scale_size_continuous(range = c(1,15),
                        guide = guide_legend(
                          override.aes = list(size = c(2,3,4,5))))

heatmap3
