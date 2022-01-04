# WOS search result 2022-1-4
# topic: forecast & forecast combination
# publication date: 1969-01-01 - 2021.12.31
path <- "/Users/wangxiaoqian/Git/Git-xqnwang/ensembles-combinations-docs/docs/plot_prop"
setwd(path)
library(magrittr)
library(ggplot2)

dat_all <- read.table("analyze-all.txt", header = TRUE)[,1:2]
dat_sel <- read.table("analyze-sel.txt", header = TRUE)[,1:2]

dat <- merge(dat_all, dat_sel, by = "Year", all.x = TRUE)
colnames(dat) <- c("Year", "Forecast", "Forecast combination")
dat[is.na(dat)] <- 0
dat <- dat[-seq(4),] # 1972-2021

ggplot(dat, aes(x=Year)) +
  geom_line(aes(y=Forecast)) +
  geom_line(aes(y=`Forecast combination`), linetype = "dashed")

scaleFUN <- function(x) sprintf("%.1f", x)

dat_prop <- cbind(dat[,1], dat$`Forecast combination`/dat$Forecast*100) %>% as.data.frame()
colnames(dat_prop) <- c("Year", "Proportion")
ggplot(data = dat_prop, aes(x = Year, y = Proportion))+
  geom_line() +
  scale_y_continuous(limits = c(0, 6.5),breaks = seq(0, 6.5, 0.5),labels=scaleFUN) +
  theme_classic() +
  ylab("Proportion (%)") +
  xlim(c(1972,2021)) +
  theme(axis.text.x = element_text(face="bold", size=12)) + 
  theme(axis.title.x = element_text(face="bold", size = 13)) +
  theme(axis.text.y = element_text(face="bold", size=12, angle = 0, hjust = 1)) + 
  theme(axis.title.y = element_text(face="bold", size = 13)) +
  theme(panel.background = element_blank())
        #panel.grid.major = element_line(size = 0.5, colour = "grey90"),
        #panel.border = element_rect(colour = "black", fill = NA, size = 1.5)) 
#4:7
