# Read the data
data <- read.table('household_power_consumption.txt', na.strings = '?', sep = ';', 
                   header = TRUE)

# Create an additional column storing the Date Time data in POSIXlt format 
data$DateTime <- strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S')


# Open the PNG device and plot the data
png(filename = 'plot4.png', width = 480, height = 480, bg = NA)
par(mfcol=c(2,2), mar = c(4.1, 4.1, 4.1, 2.1))
plot(subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$DateTime,
     subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$Global_active_power, main = NA, 
     ylab = 'Global Active Power', xlab = NA, type = 'l')

plot(subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$DateTime,
     subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$Sub_metering_1, main = NA, 
     ylab = 'Energy sub metering', xlab = NA, type = 'l')
lines(subset(data, DateTime >= '2007-02-01' & 
               DateTime < '2007-02-03')$DateTime,
      subset(data, DateTime >= '2007-02-01' & 
               DateTime < '2007-02-03')$Sub_metering_2, col = 'red')
lines(subset(data, DateTime >= '2007-02-01' & 
               DateTime < '2007-02-03')$DateTime,
      subset(data, DateTime >= '2007-02-01' & 
               DateTime < '2007-02-03')$Sub_metering_3, col = 'blue')
legend(x = strptime('2007-02-01 17:00:00', 
                    format = '%Y-%m-%d %H:%M:%S'), y = 39, 
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col = c('black','red','blue'), lty = c(1,1), cex = 0.9, bty = 'n')

plot(subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$DateTime,
     subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$Voltage, main = NA, 
     ylab = 'Voltage', xlab = 'datetime', type = 'l')

plot(subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$DateTime,
     subset(data, DateTime >= '2007-02-01' & 
              DateTime < '2007-02-03')$Global_reactive_power, main = NA, 
     ylab = 'Global_reactive_power', xlab = 'datetime', type = 'l')
dev.off()
