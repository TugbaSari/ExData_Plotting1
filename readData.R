
## Use sqldf package to filter out unnecessary rows during read to improve read speed and memory usage.
if("sqldf" %in% rownames(installed.packages()) == FALSE) {
  install.packages("sqldf")
}

library(sqldf)

readHouseholdPowerConsumptionData <- function(columns = "*") {
  ## read power consumption data for 2 days
  read.csv.sql("household_power_consumption.txt",
                  sql = paste("select ", columns, " from file where Date in ('1/2/2007', '2/2/2007')"),
                  header = TRUE, 
                  sep = ";"
              )
}
