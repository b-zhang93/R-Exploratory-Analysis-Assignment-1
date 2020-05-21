# reading relevant data and subsetting the days we need (Feb 1 and 2)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# combining date and time as a variable and subsetting sub metering 1-3 as a variable to plot 
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subdata <- data[,7:9]

# the plotting sub_metering_1, 2, and 3 over time and the legend
plot(date_time, subdata$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(date_time, subdata$Sub_metering_2, col = "red")
lines(date_time, subdata$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.75)

# save the plot as a png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()