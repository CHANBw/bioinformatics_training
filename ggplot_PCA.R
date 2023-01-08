#  PCA

#  install.packages("FactoMineR")
#  install.packages("factoextra")

library(FactoMineR)
library(ggplot2)
library(factoextra)

pca_data <- iris[,-5]
head(pca_data)

#  进行PCA分析

iris.pca <- PCA(pca_data, graph = FALSE)

#  开始作图

fviz_pca_ind(iris.pca,graph = TRUE)

#  去掉数值

fviz_pca_ind(iris.pca,
             geom.ind =  "point")

#  按照提前设置的分组填充颜色

fviz_pca_ind(iris.pca,
             geom.ind = "point",
             col.ind = iris$Species)

#  更改默认的配色

fviz_pca_ind(iris.pca,
             geom.ind = "point",
             col.ind = iris$Species,
             palette = c("#00AFBB", "#E7B800", "#FC4E07"))

#  添加椭圆

fviz_pca_ind(iris.pca,
             geom.ind = "point",
             col.ind = iris$Species,
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE)

#  更改图例的标题

fviz_pca_ind(iris.pca,
             geom.ind = "point",
             col.ind = iris$Species,
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE,
             legend.title="Group")
