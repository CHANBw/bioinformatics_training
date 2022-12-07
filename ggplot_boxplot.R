#  安装ggthemr包

install.packages("devtools")
library(devtools)
install_github('cttobin/ggthemr')

# packages are needed


library(ggplot2)
library(ggthemr)     
library(ggsignif) 


# loading data

#  using iris as example

head(iris)     #verifying data

# compared in pairs


compaired <- list(c("versicolor", "virginica"),
                  c("versicolor","setosa"), 
                  c("virginica","setosa"))



ggthemr("flat")   # choosing theme


#  drawing

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) + geom_boxplot()
  
  
 #  修改Y轴 

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) + geom_boxplot()+
  ylim(1.5, 6.5) 

#  significance analysis

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) + geom_boxplot()+
  ylim(1.5, 6.5) + geom_signif(comparisons = compaired,
              step_increase = 0.3,
              map_signif_level = F,
              test = wilcox.test)
'''

  Comparisons: list，设置需要比较的组
  Test:选择检验方法，t.test, wilcox.test
  test.args:给test传入的参数
  map_signif_level:bool值，如果为TRUE，显示方法为"***"=0.001,  "**"=0.01, "*"=0.05
  step_increase:设置标注之间的距离
  
  
'''

# 绘制小提琴图

ggthemr("flat")
p <- ggplot(iris, aes(Species, Sepal.Width, fill = Species)) +
  geom_violin() +
  ylim(1.5, 6.5) +
  geom_signif(comparisons = compaired,
              step_increase = 0.5,
              map_signif_level = F,
              test = wilcox.test)


# 将显著性标记由数字变为”*“

ggthemr("flat")
ggplot(iris, aes(Species, Sepal.Width, fill = Species)) +
  geom_violin() +
  ylim(1.5, 6.5) +
  geom_signif(comparisons = compaired,
              step_increase = 0.3,
              map_signif_level = T,
              test = wilcox.test)


#加误差线

df <- iris

head(df)

#变形

library(reshape2)
reshape2::melt(df,id.vars="Species") -> dfa

#绘图

ggplot(data = dfa,
       aes(x=Species,y=value,fill=Species))+
  geom_boxplot(width=0.5)

#加误差线于顶层

ggplot(data = dfa,
       aes(x=Species,y=value,fill=Species))+
  geom_boxplot(width=0.5)+
  stat_boxplot(geom = "errorbar",
               width=0.3)

#改误差线于底层

ggplot(data = dfa,
       aes(x=Species,y=value,fill=Species))+
  
  stat_boxplot(geom = "errorbar",
               width=0.3)+
  geom_boxplot(width=0.5)
  
install.packages("ggsci")
library(ggsci)


#修改图标顺序

ggplot(data = dfa, aes(x=Species,y=value,fill=Species))+
  stat_boxplot(geom = "errorbar",
               width=0.2)+
  geom_boxplot(width=0.5)+
  guides(fill=guide_legend(reverse = T))


ggplot(data = dfa, aes(x=Species,y=value,fill=Species))+
  stat_boxplot(geom = "errorbar",
               width=0.2)+
  geom_boxplot(width=0.5)+
  guides(fill=guide_legend(reverse = T))


ggplot(data = dfa,
       aes(x=Species,y=value,fill=variable))+
  
  stat_boxplot(geom = "errorbar",
               width=0.3,
               position = position_dodge(0.5))+
  geom_boxplot(width=0.5,
               position = position_dodge(0.5))

#  position_dodge表示每组内图标相聚距离

ggplot(data = dfa,
       aes(x=Species,y=value,fill=variable))+
  
  stat_boxplot(geom = "errorbar",
               width=0.3,
               position = position_dodge(0.5))+
  geom_boxplot(width=0.5,
               position = position_dodge(0.5))+
  theme_bw()

#theme_bw是主题颜色

library(see)
library(patchwork)
ggplot(data = dfa,
       aes(x=Species,y=value,fill=variable))+
  
  stat_boxplot(geom = "errorbar",
               width=0.3,
               position = position_dodge(0.5))+
  geom_boxplot(width=0.5,
               position = position_dodge(0.5))+
  theme_bw()+
  scale_fill_material_d()+
  theme_bw()+
  guides(fill=guide_legend(reverse = T)) 
  
#  guides(fill=guide_legend(reverse = T))使图标顺序反转
#  Use scale_color_material_d() for discrete categories 
#  and scale_color_material_c() for a continuous scale.


library(ggplot2)
library(see)

ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  theme_modern() +
  scale_fill_material_d()

ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_violin() +
  theme_modern() +
  scale_fill_material_d(palette = "ice")

ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Sepal.Length)) +
  geom_point() +
  theme_modern() +
  scale_color_material_c(palette = "rainbow")  