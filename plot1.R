
#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#aggregate
totalEmissionYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')

#make the plot
barplot(height=totalEmissionYear$Emissions, names.arg=totalEmissionYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions'))
dev.off()