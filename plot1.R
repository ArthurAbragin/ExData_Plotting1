library(dplyr)
d1<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "\"'", dec = ".",na.strings = "?", colClasses = NA, nrows = -1)

d2<-filter(d1,Date=='1/2/2007' | Date=='2/2/2007')

hist(d2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
           freq = NULL, 
           include.lowest = TRUE, right = TRUE,
           density = NULL, angle = 45, col = "red", border = NULL,
           ylim = NULL,
           axes = TRUE, plot = TRUE, 
           warn.unused = TRUE)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
