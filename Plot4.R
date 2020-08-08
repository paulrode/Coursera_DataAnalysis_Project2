# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

setup()

nei <- readRDS("./data/summarySCC_PM25.rds")
dim(nei)
str(nei)
glimpse(nei)
summary(nei)

scc <- readRDS("./data/Source_Classification_Code.rds")
dim(scc)
glimpse(scc)

coal <- filter(scc, grepl("coal", Short.Name))
dim(coal)
glimpse(coal)

nei %>% filter(fips == "24510",  ) %>%   semi_join(coal, by="SCC") -> nei3
dim(nei3)
glimpse(nei3)
nei3 

ggplot(data = nei3, aes(x=year, y=Emissions)) +
  geom_col() +
  labs(title = "Plot 4", subtitle = "Explortoty Data") +
  theme_light()



