# reading relevant data and subsetting the days we need (Feb 1 and 2)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# combining date and time as a variable and subsetting global active powers as a variable to plot 
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global <- as.numeric(data$Global_active_power)

#plotting the two variables we just created
plot(date_time, global, type="l", ylab = "Global Active Power (killowatts)", xlab = "")

# save the plot as a png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()