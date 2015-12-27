setwd("./Exploratory Data Analysis/exdata-data-NEI_data")
list.files()
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SRC <- readRDS("Source_Classification_Code.rds")

## Get data only vehicle sector
veh <- grep ("vehicle",SRC$EI.Sector, value = TRUE, ignore.case = TRUE)
SRC.veh <- subset(SRC, SRC$EI.Sector %in% veh, select=SCC)
BC.LA <- subset(NEI, fips == "24510" | fips == "06037")
NEI.veh <- subset(BC.LA,BC.LA$SCC %in% SRC.veh$SCC)

## aggregate Year wise data for Emission
data <- aggregate(NEI.veh[c("Emissions")], list(year = NEI.veh$year, fips = NEI.veh$fips), sum)
data$city <- rep(NA,nrow(data))
data[data$fips =="06037",][,"city"] <- "LA"
data[data$fips =="24510",][,"city"] <- "Baltimore city"

## Open device
png("Plot6.png", width=480, height= 480)
## Create Plot 
p <- ggplot(data, aes(x=year,y=Emissions,colour=city)) + geom_point() + geom_smooth(method ="lm",se = FALSE) + ggtitle("Total Vehicle Emissions in Baltimore City vs LA")
print(p)

##plot(data$year, data$Emissions, type = "l", main = "Total Vehicle Emissions in Baltimore City vs LA",xlab = "Year", ylab = "Emissions")
## Close device
dev.off()
