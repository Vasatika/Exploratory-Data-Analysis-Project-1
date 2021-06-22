#Read the data and use the required date's data and change to proper date and time class.

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259)
electricData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

electricData$Date <- as.Date(electricData$Date, format = "%d/%m/%Y")
electricData$Time <- paste(as.Date(electricData$Date), electricData$Time)
electricData$Time <- as.POSIXct(electricData$Time)


#Plot 2 - Line plot graph of Global active power over time in day's 
with(electricData, plot(Time , Global_active_power,  type = "l", xlab = "", 
                        ylab = "Global Active Power (killowatts)"))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
