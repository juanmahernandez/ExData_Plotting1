# plot1.R
# This script plots the first image, putting it into the file "plot1.png"

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
# the information we need are from row 66637 to row 69518
data <- read.table(file = "household_power_consumption.txt", skip = 66637, header = F, nrows = 2880, sep = ";")
names(data) <- names(read.table(file = "household_power_consumption.txt", header = T, nrows = 1, sep = ";"))

# chart plot
png("plot1.png", width = 480, height = 480)


hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")


dev.off()
