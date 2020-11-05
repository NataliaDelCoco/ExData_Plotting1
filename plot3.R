dataf <- "./data//household_power_consumption.txt"
data <- read.table(dataf,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodaysData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_hour <- strptime(paste(twodaysData$Date, twodaysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

submet1 <- as.numeric(twodaysData$Sub_metering_1)
submet2 <- as.numeric(twodaysData$Sub_metering_2)
submet3 <- as.numeric(twodaysData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(date_hour, submet1, type="l", ylab="Energy Submetering", xlab="")
lines(date_hour, submet2, type="l", col="red")
lines(date_hour, submet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),cex=1.)

dev.off()