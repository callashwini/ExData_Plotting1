setwd("./Exploratory Data Analysis/exdata-data-NEI_data")
list.files()
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SRC <- readRDS("Source_Classification_Code.rds")

## Get data only coal sector
coal <- grep ("coal",SRC$EI.Sector, value = TRUE, ignore.case = TRUE)
SRC.coal <- subset(SRC, SRC$EI.Sector %in% coal, select=SCC)
NEI.coal <- subset(NEI, NEI$SCC %in% SRC.coal$SCC)

## aggregate Year wise data for Emission
data <- aggregate(NEI.coal[c("Emissions")], list(year = NEI.coal$year), sum)

## Open device
png("Plot4.png", width=480, height= 480)
## Create Plot 
p <- ggplot(data, aes(x=year,y=Emissions)) + geom_point() + geom_smooth(method ="lm",se = FALSE) + ggtitle("Total Emissions from coal in US")
print(p)
## Close device
dev.off()
