
createDateTimeColumn <- function(dataset) {
  # Create an additional column called "DateTime" in POSIXct format
  transform(dataset, 
            DateTime = as.POSIXct(paste(dataset$Date, dataset$Time, sep = " "), 
                                  format = "%d/%m/%Y %H:%M:%S"
            )
  )
}

plotActivePower <- function(dataset) {
  plot(dataset$Global_active_power~dataset$DateTime, 
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)"
  )
}

plotVoltage <- function(dataset) {
  plot(dataset$Voltage~dataset$DateTime, 
       type = "l",
       xlab = "datetime",
       ylab = "Voltage"
  )
}

plotSubMeterings <- function(dataset) {
  # Create plot with only Sub_metering_1
  plot(x = dataset$DateTime,
       y = dataset$Sub_metering_1,
       type = "l",
       xlab = "",
       ylab = "Energy sub metering"
  )
  
  # Add Sub_metering_2 and Sub_metering_3 lines
  lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
  lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
  
  # Add legend
  legend('topright', 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c('black', 'red', 'blue'),
         lty = 1
  )
}

plotReactivePower <- function(dataset) {
  plot(dataset$Global_reactive_power~dataset$DateTime, 
       type = "l",
       xlab = "datetime",
       ylab = "Global_Reactive_Power"
  )
}
