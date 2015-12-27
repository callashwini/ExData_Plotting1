setwd("./Exploratory Data Analysis/exdata-data-NEI_data")
list.files()
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SRC <- readRDS("Source_Classification_Code.rds")

## Get data only vehicle sector
veh <- grep ("vehicle",SRC$EI.Sector, value = TRUE, ignore.case = TRUE)
SRC.veh <- subset(SRC, SRC$EI.Sector %in% veh, select=SCC)
NEI.veh <- subset(NEI, fips == "24510")

## aggregate Year wise data for Emission
data <- aggregate(NEI.veh[c("Emissions")], list(year = NEI.veh$year), sum)

## Open device
png("Plot5.png", width=480, height= 480)
## Create Plot 
##p <- ggplot(data, aes(x=year,y=Emissions)) + geom_point() + geom_smooth(method ="lm",se = FALSE) + ggtitle("Total Vehicle Emissions in Baltimore City")
##print(p)

plot(data$year, data$Emissions, type = "l", 
      main = "Total Vehicle Emissions in Baltimore City",
       xlab = "Year", ylab = "Emissions")
## Close device
dev.off()
