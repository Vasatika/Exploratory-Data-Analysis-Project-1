#Read the data and subet the data of the dates that are required and convert to proper Date or
#time classes.

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259)
electricData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
electricData$Date <- as.Date(electricData$Date, format = "%d/%m/%Y")
head(electricData)
tail(electricData)
names(electricData)

#Plot 1 -  Histogram with Global Active Power (x-axis) and Frequency (y-axis) 
with(electricData, hist(Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts", ylab = "Frequency"))

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
