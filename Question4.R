# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

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
title("Question 2", "Baltimore City")



