# Share the energy consumption read code in all 4 plots, check "readData.r" to see how it is read
source("readData.R")

# Set locale to English to output short day names in x axis of the plot in English
Sys.setlocale("LC_ALL", "English")

# Read required columns from file
household_power_cons <- readHouseholdPowerConsumptionData("Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time")

attach(household_power_cons)

# Create an additional column called "DateTime" in POSIXct format
household_power_cons <- transform(household_power_cons, 
                                  DateTime = as.POSIXct(paste(Date, Time, sep = " "), 
                                                        format = "%d/%m/%Y %H:%M:%S"
                                  )
)

# Open png device
png(filename = "plot3.png")

# Create plot with only Sub_metering_1
plot(x = household_power_cons$DateTime,
     y = household_power_cons$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
)

# Add Sub_metering_2 and Sub_metering_3 lines
lines(household_power_cons$DateTime, household_power_cons$Sub_metering_2, col = "red")
lines(household_power_cons$DateTime, household_power_cons$Sub_metering_3, col = "blue")

# Add legend
legend('topright', 
         names(household_power_cons[1 : 3]),
         col = c('black', 'red', 'blue'),
         lty = 1
       )


# Close png device
dev.off()

# Cleanup the workspace
remove(household_power_cons)
remove(readHouseholdPowerConsumptionData)
