setup()

# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 
# 1999 to 2008? Use the base plotting system to make a plot answering 
# this question.

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


nei %>% group_by(year) %>% summarise(pmtons = sum(Emissions), pmmean = mean(Emissions)) -> nei1
dim(nei1)
nei1
boxplot(log2(pmtons)~year, data = nei1)
boxplot(Emissions~year, data = nei)