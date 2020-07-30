

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

# List files and pull in data
list.files("./data")

## This first line will likely take a few seconds. Be patient!
nei <- readRDS("./data/summarySCC_PM25.rds")
dim(nei)
str(nei)
head(nei)

scc <- readRDS("./data/Source_Classification_Code.rds")
dim(scc)
str(scc)
head(scc)

x0 <- subset(nei, year == 1999, select = c(fips, SCC, Pollutant, Emissions, type, year))
with(nei, boxplot, Emissions, year)
plot(nei$Emissions, nei$year)
