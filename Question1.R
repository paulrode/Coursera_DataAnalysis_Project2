setup()

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

# List files and pull in data
list.files("./data")

## This first line will likely take a few seconds. Be patient!
nei <- readRDS("./data/summarySCC_PM25.rds")
dim(nei)
str(nei)
summary(nei)
head(nei)

scc <- readRDS("./data/Source_Classification_Code.rds")
dim(scc)
str(scc)
head(scc)

idx <- sample(nrow(nei), 100)

 
nei %>% group_by(year) %>% summarise(pm_tons = sum(Emissions), pm_mean = mean(Emissions)) -> nei1
dim(nei1)
nei1
with(nei1, plot(year, pm_tons, ylab = "total pm tons"), xlab = "year", main = "Question1")
with(nei1, lines(year, pm_tons))
title("Question 1")




