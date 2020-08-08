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

nei %>% filter(fips == "24510" & type == "ON-ROAD" ) %>%   semi_join(mobile, by="SCC") -> nei3
nei3$year <- as.character(nei3$year)
dim(nei3)
glimpse(nei3)


ggplot(data = nei3, aes(x=year, y=Emissions )) +
  geom_col() +
  labs(title = "Plot  5", subtitle = "Explortoty Data") +
  theme_light()



