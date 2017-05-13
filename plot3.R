# Share the energy consumption read code in all 4 plots, check "readData.r" to see how it is read
source("readData.R")

# Import plot function
source("plotFunctions.R")

# Set locale to English to output short day names in x axis of the plot in English
Sys.setlocale("LC_ALL", "English")

# Read required columns from file
columns_to_read <- "Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time"
household_power_cons <- createDateTimeColumn(readHouseholdPowerConsumptionData(columns_to_read))

# Open png device
png(filename = "plot3.png")

# Plot sub meterings
plotSubMeterings(household_power_cons)

# Close png device
dev.off()

# Cleanup the workspace
remove(household_power_cons)
