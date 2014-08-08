# Assumption that "household_power_consumption.txt" is in working directory
data <- read.csv("household_power_consumption.txt", 
                 sep=";", 
                 stringsAsFactors=FALSE,
                 colClasses=c("character", "character", "numeric", 
                              "numeric", "numeric", "numeric", 
                              "numeric", "numeric", "numeric"),
                 na.strings=c("?"))

# Pull out values for Feb 1-2, 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Concatenate Date and Time column with a space in-between
# Convert Date column to be of type POSIXlt
data$Date <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %T")

# Create png file
png(filename="plot4.png", bg="transparent")

# Two rows and two columns
par(mfrow=c(2,2))

plot(data$Date, data$Global_active_power, type="s", xlab="", ylab="Global Active Power")

plot(data$Date, data$Voltage, type="s", xlab="datetime", ylab="Voltage")

# Stair step graph
plot(data$Date, data$Sub_metering_1, 
     type="s", xlab="", ylab="Energy sub metering")

# Add additional data to the plot
points(data$Date, data$Sub_metering_2, type="s", col="red")
points(data$Date, data$Sub_metering_3, type="s", col="blue")

# Add legend
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1))

plot(data$Date, data$Global_reactive_power, type="s", xlab="datetime", ylab="Global_reactive_power")

dev.off()