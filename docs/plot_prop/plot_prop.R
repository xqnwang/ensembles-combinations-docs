# WOS search result 2022-2-9
# topic: 
#      forecast: forecast*
#      forecast combinations: (forecast* NEAR/5 combin*) OR (forecast* NEAR/5 ensemble*) OR (forecast* NEAR/5 averag*) OR (forecast* NEAR/5 aggregat*) OR (forecast* NEAR/5 pool*) OR (forecast* AND ((model* NEAR/5 combin*) OR (model* NEAR/5 ensemble*) OR (model* NEAR/5 averag*) OR (model* NEAR/5 aggregat*) OR (model* NEAR/5 pool*)))
# publication date: 1969-01-01 - 2021.12.31
# tips of search operators: https://images.webofknowledge.com/images/help/WOS/hs_search_operators.html

path <- "/Users/wangxiaoqian/Git/Git-xqnwang/ensembles-combinations-docs/docs/plot_prop"
setwd(path)
library(magrittr)
library(ggplot2)

dat_all <- read.table("analyze-all.txt", header = TRUE)[,1:2]
dat_sel <- read.table("analyze-sel.txt", header = TRUE)[,1:2]

dat <- merge(dat_all, dat_sel, by = "Year", all.x = TRUE)
colnames(dat) <- c("Year", "Forecast", "Forecast combinations")
dat[is.na(dat)] <- 0
# dat <- dat[-seq(4),] # 1972-2021

ggplot(dat, aes(x=Year)) +
  geom_line(aes(y=Forecast)) +
  geom_line(aes(y=`Forecast combinations`), linetype = "dashed")

scaleFUN <- function(x) sprintf("%.1f", x)

dat_prop <- cbind(dat[,1], dat$`Forecast combinations`/dat$Forecast*100) %>% as.data.frame()
colnames(dat_prop) <- c("Year", "Proportion")
ggplot(data = dat_prop, aes(x = Year, y = Proportion))+
  geom_line() +
  scale_y_continuous(limits = c(0, 15),breaks = seq(0, 15, 5)) +
  theme_classic() +
  ylab("Proportion (%)") +
  xlab("Publication year") +
  scale_x_continuous(limits = c(1969, 2021), breaks = seq(1969, 2021, 4)) +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust=1, face="bold", size=12)) + 
  theme(axis.title.x = element_text(face="bold", size = 13)) +
  theme(axis.text.y = element_text(face="bold", size=12, angle = 0, hjust = 1)) + 
  theme(axis.title.y = element_text(face="bold", size = 13)) +
  theme(panel.background = element_blank())
        #panel.grid.major = element_line(size = 0.5, colour = "grey90"),
        #panel.border = element_rect(colour = "black", fill = NA, size = 1.5)) 
#4:7
