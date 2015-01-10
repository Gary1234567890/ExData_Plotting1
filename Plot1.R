#read in data
full_data <- read.csv("household_power_consumption.txt",sep=";",header=T,na.strings = "?")
#create extra column as suggested
full_data$DateTime <- strptime(full_data$Date,full_data$Time,format="%d/%m/%Y %H:%M:%S")
#subset just the data for those two days
data <- subset(full_data, full_data$Date %in% c("1/2/2007","2/2/2007"))
#Get data for this plot...just the column Global_active_power
Global_active_power <- as.numeric(data$Global_active_power)
#setup printing to file
png("plot1.png",width=480,height=480)
#plot graph
hist(Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
#stop writing to file
dev.off()
