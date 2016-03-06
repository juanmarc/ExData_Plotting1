##################################################################################################
# plot3 code file
# Exploratory Data Analysis--Course Project 1
# Marc Hidalgo
# 6 Mar 2016
#
# This r code create the required plot3 for the course project based on electric power
# consumption data from the UC Irvine Machine Learning Repository.
#
# A full description of the input data is available at the the following site:
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#
##################################################################################################
setwd("/Users/Marc/coursera/")

## if necessary, download and unzip the source files
filename <- "household_power_consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

## clean/remove any variables currently in the workspace
rm(list=ls())

## read in the data and extract the Global Active Power Data
powerData <- read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE)
powerDataFeb1_2_2007 <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(powerDataFeb1_2_2007$Global_active_power)

## convert the date/time from character to a numeric date time group
dtg <- strptime(paste(powerDataFeb1_2_2007$Date, powerDataFeb1_2_2007$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

## plot the data as required and write to file
png("plot3.png", width=480, height=480)
plot(dtg,powerDataFeb1_2_2007$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dtg,powerDataFeb1_2_2007$Sub_metering_2,col="red")
lines(dtg,powerDataFeb1_2_2007$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),border="black",lty=c(1,1,1))
dev.off()