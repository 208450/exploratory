# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

NEIfips  <- NEI[NEI$fips=="24510", ]

totalEmissionYear <- aggregate(Emissions ~ year, NEIfips, sum)

png('plot2.png')

barplot(height=totalEmissionYear$Emissions, names.arg=totalEmissionYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, Maryland emissions'))
dev.off()