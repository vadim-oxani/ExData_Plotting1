# Read the data
data <- read.table('household_power_consumption.txt', na.strings = '?', sep = ';', 
                   header = TRUE)

# Create an additional column storing the Date Time data in POSIXlt format 
data$DateTime <- strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S')

# Open the PNG device and plot the data
png(filename = 'plot2.png', width = 480, height = 480, bg = NA)
plot(subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$DateTime,
     subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$Global_active_power, main = NA, 
     ylab = 'Global Active Power (kilowatts)', xlab = NA, type = 'l')
dev.off()


