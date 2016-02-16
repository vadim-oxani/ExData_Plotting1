# Download the data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','data.zip')
unzip('data.zip')

# Read the data
data <- read.table('household_power_consumption.txt', na.strings = '?', sep = ';', 
                   header = TRUE)

# Create an additional column storing the Date Time data in POSIXlt format 
data$DateTime <- strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S')

# Open the PNG device and plot the data
png(filename = 'plot1.png', width = 480, height = 480, bg = NA)
hist(subset(data, DateTime >= '2007-02-01' &
              DateTime < '2007-02-03')$Global_active_power, 
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', 
     col = 'red')
dev.off()