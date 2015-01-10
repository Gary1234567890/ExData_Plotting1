#get the data
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
#Get just the two days
Data <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
#get the dates to use in the plot
datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#add a column to data with properly formated date and time
data$Datetime <- as.POSIXct(datetime)
#setup to save to file
png("plot3.png", width=480, height=480)
#plot away
with(data, {
    plot(Sub_metering_1 ~ Datetime, type = "l", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
#add legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#stop writing to file
dev.off()