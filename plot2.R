# Share the energy consumption read code in all 4 plots, check "readData.r" to see how it is read
source("readData.R")

# Import plot function
source("plotFunctions.R")

# Set locale to English to output short day names in x axis of the plot in English
Sys.setlocale("LC_ALL", "English")

# Read required columns from file
household_power_cons <- createDateTimeColumn(readHouseholdPowerConsumptionData("Global_active_power, Date, Time"))

# Open png device
png(filename = "plot2.png")

plotActivePower(household_power_cons)

# Close png device
dev.off()

# Cleanup the workspace
remove(household_power_cons)
