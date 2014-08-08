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
png(filename="plot2.png", bg="transparent")
plot(data$Date, data$Global_active_power, type="s", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()