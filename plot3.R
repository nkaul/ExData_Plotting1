# plot3.R
# This R code generate the third plot of the Project 1 

# Reading the data from text file into a data frame using read.table
# Replacing '?' with proper NAs
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Updating the Date and Time columns in data frame to proper date and time classes
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format="%d/%m/%Y")

# we need to make sure that time column is associated with their particular dates
householdPowerConsumption$Time <- as.POSIXct(paste(householdPowerConsumption$Date, householdPowerConsumption$Time), format="%Y-%m-%d %H:%M:%S")

# Creating a subset of data from the dates 2007-02-01 and 2007-02-02.
subsetPwrCons <- householdPowerConsumption[householdPowerConsumption$Date =="2007-02-01" | householdPowerConsumption$Date =="2007-02-02", ]


# Generating Plot 3
# Generating the third Plot - Energy Sub Metering(1,2,3) over Time 
plot(subsetPwrCons$Time, subsetPwrCons$Sub_metering_1, type="l", main="",xlab="", ylab="Energy Sub Metering",cex=0.8, cex.axis = 0.8)
lines(subsetPwrCons$Time, subsetPwrCons$Sub_metering_2, col="red", cex=0.8)
lines(subsetPwrCons$Time, subsetPwrCons$Sub_metering_3, col="blue", cex=0.8)

legend("topright", lty=1, cex=0.8, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust=0 )

# Saving the plot to png file
dev.copy(png, file = "./plots/plot3.png", width=480, height=480) 
dev.off()  # close the PNG device
