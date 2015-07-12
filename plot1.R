############################
#
#	Exploratory Data Analysis
# exdata-030
#
# Course Project 1
# Electric power consumption / PLOT 1
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

# Open device
png(filename="plot1.png", width = 480, height = 480)

# output data
hist(as.numeric(dat0_subset$Global_active_power), main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

# closing device
dev.off()


