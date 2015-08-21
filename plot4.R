#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999-2008?

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


# merge NEI and SCC
if(!exists("mergeNEISCC")){
  mergeNEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

coal  <- grepl("coal", mergeNEISCC$Short.Name, ignore.case=TRUE)
coal2 <- mergeNEISCC[coalMatches, ]

totalEmissionYear <- aggregate(Emissions ~ year, coal2, sum)



png("plot4.png", width=640, height=480)
gg <- ggplot(totalEmissionYear, aes(factor(year), Emissions))

gg <- gg + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(gg)
dev.off()