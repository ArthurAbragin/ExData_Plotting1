library(dplyr)
d1<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "\"'", dec = ".",na.strings = "?", colClasses = NA, nrows = -1)

d2<-filter(d1,Date=='1/2/2007' | Date=='2/2/2007')

d2$Date <- as.Date(d2$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(d2$Date), d2$Time)
d2$Datetime <- as.POSIXct(datetime)

with(d2, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='red')
  lines(Sub_metering_3~Datetime,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
