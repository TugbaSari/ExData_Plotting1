# Share the energy consumption read code in all 4 plots, check "readData.r" to see how it is read
source("readData.R")

# This only contains data between 2007/02/01 - 2007/02/02
household_power_cons <- readHouseholdPowerConsumptionData("Global_active_power")

# Open png device
png(filename = "plot1.png")

# Create the histogram
hist(household_power_cons$Global_active_power, 
       xlab = "Global Active Power (kilowatts)",
       col = "Red",
       main = "Global Active Power"
     )

# Close png device
dev.off()

# Cleanup the workspace
remove(household_power_cons)
