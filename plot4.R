############################
#
#	Exploratory Data Analysis
# exdata-030
#
# Course Project 1
# Electric power consumption / PLOT 3
#
############################

# preps
rm(list=ls())
gc()

# read data using data.table
library(data.table)
dat0<-fread('household_power_consumption.txt')
dim(dat0)
# print(object.size(dat0), unit="Mb")
# 143 Mb

# setting the right date format
dat0$Date <- as.Date(dat0$Date, "%d/%m/%Y")

#filter the two dates
dat0_subset <- subset(dat0, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))

# data-frame for DateTime
dat<-data.frame(dat0_subset)

# create date-time field
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")

# Open device
png(filename="plot4.png", width = 480, height = 480)

# output data
par(mfrow = c(2, 2))
# Global Active Power
plot(dat$DateTime, dat$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
# Voltage
plot(dat$DateTime, dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# Plot3: Sub_metering_1 data 
plot(dat$DateTime, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
# Plot3: Sub_metering_2 data 
points(dat$DateTime, dat$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
# Plot3: Sub_metering_3 data 
points(dat$DateTime, dat$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
# legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
# Global Reactive Power
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

# closing device
dev.off()


