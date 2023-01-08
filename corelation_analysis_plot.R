
data2 <- read.csv("wds1_fenbu_xgx.csv",header = TRUE)
head(data2)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(data2, histogram=TRUE, pch=19)