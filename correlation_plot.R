install.packages("GGally")
library(ggplot2)
library(GGally)

# Create data 
data <- data.frame( var1 = 1:100 + rnorm(100,sd=20), v2 = 1:100 + 
                      rnorm(100,sd=27), v3 = rep(1, 100) + rnorm(100, sd = 1)) 
data$v4 = data$var1 ** 2 
data$v5 = -(data$var1 ** 2) 

data

##

ggpairs(data,title = "correlogram with ggpairs")

#  实战

setwd(dir = "d:/bioinformatics/R/my_work/")
wheat_data <- read.csv("phenotype_data_pratics.csv",header = TRUE,sep = ",")
head(wheat_data)
ph_data <- wheat_data[,c(2,3,4)]
head(ph_data)

ggpairs(ph_data)

# 另一种方法

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(ph_data,histogram = TRUE,pch = 19)
