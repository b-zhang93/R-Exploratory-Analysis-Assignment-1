# reading relevant data and subsetting the days we need (Feb 1 and 2)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# converting the Date variable from character to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subsetting the variable for the graph and converting to numeric as a check
global <- as.numeric(data$Global_active_power)


# create histogram
hist(global, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")

# save the plot as a png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()