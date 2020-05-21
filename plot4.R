# reading relevant data and subsetting the days we need (Feb 1 and 2)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))


#### Extracting all the variables we will need for the plots ####

# datetime
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# global active power
globalpower <- as.numeric(data$Global_active_power)
# sub metering 1 -3 
subdata <- data[,7:9]
# voltage
volt <- as.numeric(data$Voltage)
# global reactive power
globalreac <- as.numeric(data$Global_reactive_power)


#### Create our plot with a panel of four visualizations ####

# set up 4 panels with the proper margins for our 4 plots
par(mfrow = c(2,2), mar = c(4,4,2,1))

# Global Active Power over time
plot(date_time, globalpower, type="l", ylab = "Global Active Power (killowatts)", xlab = "")

# Voltage over time 
plot(date_time, volt, type="l", ylab = "Voltage (Volt)", xlab = "datetime")

# Energy sub metering over time for 1-3
plot(date_time, subdata$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(date_time, subdata$Sub_metering_2, col = "red")
lines(date_time, subdata$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2.5, bty = "n")

# Global Reactive Power over time
plot(date_time, globalreac, type="l", ylab = "Global Reactive Power (killowatts)", xlab = "datetime")

# save the plot as a png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
