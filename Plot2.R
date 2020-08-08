# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base 
# plotting system to make a plot answering this question.

setup()

nei <- readRDS("./data/summarySCC_PM25.rds")
dim(nei)
str(nei)
summary(nei)
head(nei)

nei %>% filter(fips == "24510" )%>% group_by(year) %>% 
  summarise(pm_tons = sum(Emissions), pm_mean = mean(Emissions)) -> nei2
dim(nei2)
nei2
with(nei2, plot(year, pm_tons, ylab = "total pm tons"), xlab = "year", main = "Question1")
with(nei2, lines(year, pm_tons))
title("Plot 2", "Baltimore City")



