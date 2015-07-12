############################
#
#	Exploratory Data Analysis
# exdata-030
#
# Course Project 1
# Electric power consumption / PLOT 2
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

# data-frame Datetime
dat<-data.frame(dat0_subset)

# create date-time field
dat$Datetime <- strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")

# Open device
png(filename="plot2.png", width = 480, height = 480)

# output data
plot(dat$Datetime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# weekdays are different because of local R settings (german)
 
# closing device
dev.off()


