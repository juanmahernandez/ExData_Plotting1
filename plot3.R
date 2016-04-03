# plot3.R
# This script plots the third image, putting it into the file "plot3.png"

# zip filename
dataFile = "DataComsuption.zip"

if(!file.exists(dataFile) & !file.exists("household_power_consumption.txt")) {
    # Dataset download location
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dataFile, method = "curl")
}
if(!file.exists("household_power_consumption.txt")) {
    unzip(dataFile)
}

# reading household_power_consumption.txt, previously knowing that 
# the information we need are from row 66637 to row 69517
data <- read.table(file = "household_power_consumption.txt", skip = 66637, header = F, nrows=2880, sep = ";")
names(data) <- names(read.table(file = "household_power_consumption.txt", header = T, nrows=1, sep = ";"))

# chart plot
png("plot3.png", width=480, height=480)


plot(x = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
points(x = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_2, type = "l", col = "red")
points(x = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), y = data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 2.5 ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))


dev.off()