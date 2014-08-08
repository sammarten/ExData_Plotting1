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

# Create png file and plot histogram
png(filename="plot1.png", bg="transparent")
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
