## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("mergeNEISCC")){
  mergeNEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

#get data of NEI Baltimore ("24510") and Los Angeles (06037)
NEIpart <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregateFips <- aggregate(Emissions ~ year + fips, NEIpart, sum)
NEIpart$fips[NEIpart$fips=="24510"] <- "Baltimore, MD"
NEIpart$fips[NEIpart$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
gg <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
gg <- gg + facet_grid(. ~ fips)
gg <- gg + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City vs Los Angeles 1999-2008')
print(gg)
dev.off()