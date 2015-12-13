getwd()


dir.create("Exploratory Data Analysis")
setwd("./Exploratory Data Analysis")

## Load the data
data <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE,
                   quote = "", strip.white =  TRUE, stringsAsFactors = FALSE, na.strings = "?")


head(data)
## load only req. data
data <- subset(data,(data$Date == "1/2/2007" | data$Date == "2/2/2007"))
## Open device
png("Plot1.png")

## Create Histogram
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency" ,main ="Global Active Power"  )

## close device
dev.off()
