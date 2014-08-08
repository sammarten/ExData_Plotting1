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

# Create png file and plot stair step graph
png(filename="plot3.png", bg="transparent")
plot(data$Date, data$Sub_metering_1, 
     type="s", xlab="", ylab="Energy sub metering")

# Add additional data to the plot
points(data$Date, data$Sub_metering_2, type="s", col="red")
points(data$Date, data$Sub_metering_3, type="s", col="blue")

# Add legend
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1))
dev.off()