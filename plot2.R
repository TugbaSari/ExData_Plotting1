# Share the energy consumption read code in all 4 plots, check "readData.r" to see how it is read
source("readData.R")

# Set locale to English to output short day names in x axis of the plot in English
Sys.setlocale("LC_ALL", "English")

# Read required columns from file
household_power_cons <- readHouseholdPowerConsumptionData("Global_active_power, Date, Time")

attach(household_power_cons)

# Create an additional column called "DateTime" in POSIXct format
household_power_cons <- transform(household_power_cons, 
                                  DateTime = as.POSIXct(paste(Date, Time, sep = " "), 
                                                        format = "%d/%m/%Y %H:%M:%S"
                                                        )
                                  )

# Open png device
png(filename = "plot2.png")

plot(household_power_cons$Global_active_power~household_power_cons$DateTime, 
      type = "l",
      xlab = "",
      ylab = "Global Active Power (kilowatts)"
    )

# Close png device
dev.off()

# Cleanup the workspace
remove(household_power_cons)
remove(readHouseholdPowerConsumptionData)
