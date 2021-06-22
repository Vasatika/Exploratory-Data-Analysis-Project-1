#Pre-requisites 
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259)
electricData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

electricData$Date <- as.Date(electricData$Date, format = "%d/%m/%Y")
electricData$Time <- paste(as.Date(electricData$Date), electricData$Time)
electricData$Time <- as.POSIXct(electricData$Time)

#Plot 4 - Line graphs displayed column or rwo wise, 4 displayed, 2 graphs from before 
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#1
with(electricData, plot(Time , Global_active_power,  type = "l", xlab = "", 
                                ylab = "Global Active Power (killowatts)"))
#2
with(electricData, plot(Time , Voltage,  type = "l", xlab = "datetime", 
                        ylab = "Voltage"))
#3
with(electricData, plot(Sub_metering_1 ~ electricData$Time, type = "n", 
                             ylab = "Energy sub metering", xlab = ""))

with(electricData, lines(Sub_metering_1 ~ electricData$Time))
with(electricData, lines(Sub_metering_2 ~ electricData$Time, col = "red"))
with(electricData, lines(Sub_metering_3 ~ electricData$Time, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
with(electricData, plot(Time, Global_reactive_power, type = "l", xlab = "datetime", 
                                           ylab = "Global_reactive_power"))

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
