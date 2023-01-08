data2 <- read.csv("wds1.csv",header = TRUE)
head(data2)

library(ggplot2)
library(reshape2)
library(ggpubr)
library(ggprism)

# 柱形图
ggplot(data2,aes(x=Group,y=SL,fill=Group))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar",width = 0.3)+
  theme_classic()

#  手动调色
ggplot(data2,aes(x=Group,y=SL,fill=Group))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar",width = 0.3)+
  theme_classic()+
  scale_fill_manual(values = c("#d20962","#f47721","#00a78e","#7d3f98"))

#  加散点
ggplot(data2,aes(x=Group,y=SW,fill=Group))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar",width = 0.3)+
  theme_classic()+
  geom_point(pch=21, fill="black")

#  改变x轴顺序
ggplot(data2,aes(x=Group,y=SW,fill=Group))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar",width = 0.3)+
  theme_classic()+
  scale_x_discrete(limits = c("A","C","B","D"))

#  箱型图
ggplot(data2,aes(x=Group,y=SL,fill=Group))+geom_boxplot()+theme_classic()


ggplot(data2,aes(x=Group,y=PH,fill=Group))+geom_boxplot()+theme_classic()+
  scale_x_discrete(limits = c("wds+b","WT+b","wds+i","WT+i"))

ggplot(data2,aes(x=Group,y=PH,fill=Group))+geom_boxplot()+theme_classic()+
  scale_x_discrete(limits = c("wds+b","WT+b","wds+i","WT+i"))+
  scale_fill_manual(values = c("#037ef3","#f85a40","#00c16e","#7552cc"))

#  相关性分析

data2 <- read.csv("wds1_fenbu_xgx.csv",header = TRUE)
head(data2)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(data2, histogram=TRUE, pch=19)
