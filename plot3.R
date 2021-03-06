## plots multiple sub metering lines by minute across the first two days of feb 2007

colHeaders <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power <- read.table("household_power_consumption.txt", header = TRUE, sep =";", col.names = colHeaders, na.strings="?") ## read the file in 

period <- subset(power, Date == "1/2/2007" | Date == "2/2/2007") ## get just the two days we need to report on 

period$DateTime<-as.POSIXct(paste(period$Date,period$Time), format="%d/%m/%Y %H:%M:%S") ## create a new DateTime column to use in the plot

png("plot3.png", width=480, height=480) ## open the device

#add the lines
plot(period$Sub_metering_1 ~ period$DateTime, type= "l", ylab="Energy sub metering", xlab="")
lines(period$DateTime, period$Sub_metering_2, col="red")
lines(period$DateTime, period$Sub_metering_3, col="blue")

## now add the legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

dev.off() 