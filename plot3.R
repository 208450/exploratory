
#3. Of the four types of sources indicated by the type (point, nonpoint, 
#onroad, nonroad) variable, which of these four sources have seen decreases 
#in emissions from 1999-2008 for Baltimore City? Which have seen increases in 
#emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer
#this question.


if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

library(ggplot2)

#Baltimore
NEIfips  <- NEI[NEI$fips=="24510", ]

totalEmissionYearType <- aggregate(Emissions ~ year + type, NEIfips, sum)

png("plot3.png", width=640, height=480)

gg <- ggplot(totalEmissionYearType, aes(year, Emissions, color = type))
gg <- gg + geom_line() +

  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(gg)
dev.off()