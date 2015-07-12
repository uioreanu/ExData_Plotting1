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
png(filename="plot3.png", width = 480, height = 480)

# output data
plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(dat$DateTime, dat$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(dat$DateTime, dat$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering1","Sub_metering2", "Sub_metering3"))

# closing device
dev.off()


