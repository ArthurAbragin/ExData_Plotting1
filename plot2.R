library(dplyr)
d1<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "\"'", dec = ".",na.strings = "?", colClasses = NA, nrows = -1)

d2<-filter(d1,Date=='1/2/2007' | Date=='2/2/2007')

d2$Date <- as.Date(d2$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(d2$Date), d2$Time)
d2$Datetime <- as.POSIXct(datetime)

plot(d2$Global_active_power~d2$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
