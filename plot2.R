dataf <- "./data//household_power_consumption.txt"
data <- read.table(dataf,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodaysData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(twodaysData$Global_active_power)
date_hour <- strptime(paste(twodaysData$Date, twodaysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(date_hour, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()