setwd("./Exploratory Data Analysis/exdata-data-NEI_data")
list.files()
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
##SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
## Get data only for fips 24510
data <- subset(NEI,(NEI$fips == "24510"))
## aggregate Year wise data for Emission
data <- aggregate(data[c("Emissions")], list(year = data$year), sum)
data
## Open device
png("Plot2.png", width=480, height= 480)
## Create Plot 
plot(data$year, data$Emissions, type = "l",  
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")
## Close device
dev.off()
