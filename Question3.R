# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources 
# have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 
# plotting system to make a plot answer this question.

setup()
nei <- readRDS("./data/summarySCC_PM25.rds")
dim(nei)
str(nei)

nei %>% filter(fips == "24510",  )%>% group_by(year, type ) %>% 
  summarise(pm_tons = sum(Emissions)) %>% 
  spread( type, pm_tons ) -> nei2

ggplot(data = nei2, aes(year, pm_tons)) +
  points(aes(x = year, y = NON-ROAD))


    
