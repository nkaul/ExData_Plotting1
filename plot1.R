# plot1.R
# This R code generate the first plot of the Project 1 

# Reading the data from text file into a data frame using read.table
# Replacing '?' with proper NAs
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Updating the Date and Time columns in data frame to proper date and time classes
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format="%d/%m/%Y")

# we need to make sure that time column is associated with their particular dates
householdPowerConsumption$Time <- as.POSIXct(paste(householdPowerConsumption$Date, householdPowerConsumption$Time), format="%Y-%m-%d %H:%M:%S")

# Creating a subset of data from the dates 2007-02-01 and 2007-02-02.
subsetPwrCons <- householdPowerConsumption[householdPowerConsumption$Date =="2007-02-01" | householdPowerConsumption$Date =="2007-02-02", ]


# Generating Plot 1
# Generating the first Plot - Histogram for Gblobal Active Power
hist(subsetPwrCons$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")

# Saving the plot to png file
dev.copy(png, file = "./plots/plot1.png", width=480, height=480) 
dev.off()  # close the PNG device









