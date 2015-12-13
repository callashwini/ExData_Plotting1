data<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
# change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

head(data)

# creating Plot2
png("plot4.png", width=480, height= 480)

## divide plot in 2 row e col
par (mfrow = c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab="")

plot(data$DateTime, data$Voltage,type ="l", ylab ="Voltage", xlab = "datetime")

plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(data$DateTime, data$Sub_metering_2, type="l", col="red")

lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")  

dev.off()