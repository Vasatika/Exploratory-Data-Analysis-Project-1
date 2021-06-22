#Same prerequisites as previous plots 
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259)
electricData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

electricData$Date <- as.Date(electricData$Date, format = "%d/%m/%Y")
electricData$Time <- paste(as.Date(electricData$Date), electricData$Time)
electricData$Time <- as.POSIXct(electricData$Time)

#Plot 3 - Line graphs of the three sub metering energy
with(electricData, plot(Sub_metering_1 ~ electricData$Time, type = "n", ylab = "Energy sub metering", xlab = ""))
with(electricData, lines(Sub_metering_1 ~ electricData$Time))
with(electricData, lines(Sub_metering_2 ~ electricData$Time, col = "red"))
with(electricData, lines(Sub_metering_3 ~ electricData$Time, col = "blue"))

#Add legends 
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
