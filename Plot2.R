#get the data
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
#Get just the two days
Data <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
#get the dates to use in the plot
datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#get a globalActivePower vector
globalActivePower <- as.numeric(Data$Global_active_power)
#setup to save to file
png("plot2.png", width=480, height=480)
#do the plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#stop writing to file
dev.off()