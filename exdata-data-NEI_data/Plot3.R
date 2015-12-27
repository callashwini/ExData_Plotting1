setwd("./Exploratory Data Analysis/exdata-data-NEI_data")
list.files()
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
##SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
## Get data only for fips 24510
##data <- subset(NEI,(NEI$fips == "24510"))
data <- subset(NEI,fips == "24510")
## aggregate Year wise data for Emission
data <- aggregate(data[c("Emissions")], list(year = data$year, type = data$type), sum)

## Open device
png("Plot3.png", width=480, height= 480)
## Create Plot 
p <- ggplot(data, aes(x=year,y=Emissions, colour = type)) + geom_point() + geom_smooth(method ="lm",se = FALSE) + ggtitle("Total Emissions by type in Baltimore City")
print(p)
## Close device
dev.off()