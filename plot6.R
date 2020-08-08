# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has 
# seen greater changes over time in motor vehicle emissions?

# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

setup()

nei <- readRDS("./data/summarySCC_PM25.rds")
dim(nei)
str(nei)
glimpse(nei)
summary(nei)

scc <- readRDS("./data/Source_Classification_Code.rds")
dim(scc)
glimpse(scc)

mobile <- filter(scc, grepl("Mobile", EI.Sector))
dim(mobile)
glimpse(mobile)

nei %>% filter(fips == c("06037", "24510") & type == "ON-ROAD" ) %>%   semi_join(mobile, by="SCC") -> nei3
nei3$year <- as.character(nei3$year)
dim(nei3)
glimpse(nei3)
nei3 

ggplot(data = nei3, aes(x = year, y = Emissions, fill = fips), xlab = "Year", ylab = "Road Emissions") +
  geom_bar(stat="identity", width=.5, position = "dodge") +
  scale_fill_discrete(name = "Question 4",labels = c("LA", "Baltimore"))
