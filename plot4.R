# Share the energy consumption read code in all 4 plots, check "readData.r" to see how it is read
source("readData.R")

# Import plot function
source("plotFunctions.R")

# Set locale to English to output short day names in x axis of the plot in English
Sys.setlocale("LC_ALL", "English") 

# Read required columns from file
household_power_cons <- createDateTimeColumn(readHouseholdPowerConsumptionData())

# Open png device
png(filename = "plot4.png")

# Split plot area to 4 cells
par(mfrow=c(2,2), mar= c(3,3,2,2), mgp=c(2,1,0))

# Create plots
plotActivePower(household_power_cons)
plotVoltage(household_power_cons)
plotSubMeterings(household_power_cons)
plotReactivePower(household_power_cons)

# Close png device
dev.off()

# Cleanup the workspace
remove(columns_to_read)
remove(household_power_cons)
