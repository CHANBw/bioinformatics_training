setwd("d:/bioinformatics/R/training/")
getwd()

#  打开gff文件

df <- read.csv("waxy.gtf",header = FALSE,sep = "\t")
df

#  安装需要的包
#  install.packages("ggh4x")
#  install.packages("ggplot2")
#  install.packages("stringi")
#  install.packages("Bioconductor")
#  BiocManager::install("ggbio")
#  install.packages("ggnewscale")


#  加载需要的包

library(ggh4x)
library(ggplot2)
library(ggbio)
library(GenomicRanges)
library(ggnewscale)

#  处理格式，挑选需要的列（由GenomicRanges完成）

waxy<-GRanges("chr06",IRanges(df$V4,end=df$V5,group=df$V3))

#  绘制图像

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()

#  设置x轴

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                     breaks = c(seq(1764000,1771000,by=1000)),
                     position = "top")

#  上面的函数是x轴大小，短线的距离，x轴的位置
#  调整边框及美化

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))

#  上面函数分别是去掉边框，去掉中间线，保留x轴，将x轴上的短线设置为0.2cm
#  将x轴两端控制在一定范围，由ggh4x完成

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))


#  更改配色

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))

#  设置高度

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)

#  设置y轴，将图像离x轴更远，将主体图像控制在0-3

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)+
  scale_y_continuous(limits = c(0,3))

#  添加注释文字

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)+
  scale_y_continuous(limits = c(0,3))+
  annotate(geom = "text",x=1764500,y=1,
           label="Nipponbare\n(waxy:Os06g0133000)")

#  将注释文字的图层上移

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)+
  scale_y_continuous(limits = c(0,3))+
  annotate(geom = "text",x=1764500,y=1,
           label="Nipponbare\n(waxy:Os06g0133000)")+
  coord_cartesian(clip = "off")

#  去掉y轴
autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)+
  scale_y_continuous(limits = c(0,3))+
  annotate(geom = "text",x=1764500,y=1,
           label="Nipponbare\n(waxy:Os06g0133000)")+
  coord_cartesian(clip = "off")+
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())

#  添加SNP信息

waxy_snp <- read.csv("waxy_snp.csv")
head(waxy_snp)

#   将需要展示的信息添加到变量中
#  1,品种名的位置
cultivar<-data.frame(x=1765000,
                     y=unique(waxy_snp$y_location),
                     label=unique(waxy_snp$cultivars))
cultivar

#  2，SNP位置，用红线标出
snp<-data.frame(xmin=unique(waxy_snp$x_location),
                xmax=unique(waxy_snp$x_location),
                ymin=0.6,
                ymax=1.4)
snp

#  3，上下两部分之间用虚线连接，虚线的位置
snp_segment<-data.frame(xmin=unique(waxy_snp$x_location),
                        xmax=unique(waxy_snp$x_location),
                        ymin=-0.5,
                        ymax=0.6)
snp_segment

#  4，ATG的位置
atg<-data.frame(x=1766921,y=2,label="ATG")
atg

#  开始添加
#  1.snp位置添加红线和ATG

autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                      breaks = c(seq(1764000,1771000,by=1000)),
                      position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)+
  scale_y_continuous(limits = c(0,3))+
  annotate(geom = "text",x=1764500,y=1,
           label="Nipponbare\n(waxy:Os06g0133000)")+
  coord_cartesian(clip = "off")+
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())+
  geom_label(data=atg,aes(x=x,y=y,label=label),
             fill="blue",
             color="white",
             label.r = unit(0,'mm'),
             nudge_y = 0.3)


autoplot(waxy,aes(fill = group),geom = "alignment")+theme_bw()+
  scale_x_continuous(limits = c(1764000,1771000),
                     breaks = c(seq(1764000,1771000,by=1000)),
                     position = "top")+
  theme(panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.line.x = element_line(),
        axis.ticks.length = unit(0.2,'cm'))+
  guides(x=guide_axis_truncated(trunc_lower = 1764000,
                                trunc_upper = 1771000))+
  scale_fill_manual(values = c("#a6a6a6","#a6a6a6","#92d050"))+
  theme(aspect.ratio = 0.1)+
  scale_y_continuous(limits = c(0,3))+
  annotate(geom = "text",x=1764500,y=1,
           label="Nipponbare\n(waxy:Os06g0133000)")+
  coord_cartesian(clip = "off")+
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())+
  geom_label(data=atg,aes(x=x,y=y,label=label),
             fill="blue",
             color="white",
             label.r = unit(0,'mm'),
             nudge_y = 0.3)+
  geom_segment(data = snp,aes(x=xmin,xend=xmax,
                              y=ymin,yend=ymax),
               color="red")

