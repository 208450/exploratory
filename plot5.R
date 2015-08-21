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


NEIpart <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

totalEmissionYearType <- aggregate(Emissions ~ year, NEIpart, sum)

png("plot5.png", width=840, height=480)
gg <- ggplot(totalEmissionYearType, aes(factor(year), Emissions))
gg <- gg + geom_bar(stat="identity") +  
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland from 1999 to 2008')
print(gg)
dev.off()