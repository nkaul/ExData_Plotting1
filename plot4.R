# plot4.R
# This R code generate the fourth plot of the Project 1 

# Reading the data from text file into a data frame using read.table
# Replacing '?' with proper NAs
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Updating the Date and Time columns in data frame to proper date and time classes
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format="%d/%m/%Y")

# we need to make sure that time column is associated with their particular dates
householdPowerConsumption$Time <- as.POSIXct(paste(householdPowerConsumption$Date, householdPowerConsumption$Time), format="%Y-%m-%d %H:%M:%S")

# Creating a subset of data from the dates 2007-02-01 and 2007-02-02.
subsetPwrCons <- householdPowerConsumption[householdPowerConsumption$Date =="2007-02-01" | householdPowerConsumption$Date =="2007-02-02", ]


# Generating Plot 4
# Generating the fourth Plot
# setting the plot parameters to be 2 rows and 2 column plots
par(mfrow = c(2, 2))

# sub-plot 1 - Global Active Power
plot(subsetPwrCons$Time, subsetPwrCons$Global_active_power, type="l", main="",xlab="" , ylab="Global Active Power")

# sub-plot 2 - Voltage over Time
plot(subsetPwrCons$Time, subsetPwrCons$Voltage, type="l", main="",xlab="Datetime" , ylab="Voltage")

# sub-plot 3 - Energey Submetering over time
plot(subsetPwrCons$Time, subsetPwrCons$Sub_metering_1, type="l", main="",xlab="", ylab="Energy Sub Metering",cex=0.8, cex.axis = 0.8)
lines(subsetPwrCons$Time, subsetPwrCons$Sub_metering_2, col="red", cex=0.8)
lines(subsetPwrCons$Time, subsetPwrCons$Sub_metering_3, col="blue", cex=0.8)
legend("topright", lty=1, cex=0.8, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust=0 )

# sub-plot 4 - Global reactive Power over time
plot(subsetPwrCons$Time, subsetPwrCons$Global_reactive_power, type="l", main="",xlab="Datetime" , ylab="Global Reactive Power")

# save plot to png file
dev.copy(png, file = "./plots/plot4.png", width=480, height=480) 
dev.off()  # close the PNG device



