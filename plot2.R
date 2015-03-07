# PROJECT 1 Module 4
# Plot # 2
# Original dataset has 2,075,259 rows and 9 columns
# The file "household_power_consumption.txt" should be in the working directory

library(lubridate)
library(grDevices)
Sys.setlocale("LC_TIME", "English") 

# Reading the data and selecting only data from the dates 2007-02-01 and 2007-02-02
data <- subset(read.table("household_power_consumption.txt",na.strings="?",header = TRUE, sep=";", dec=".",
                          colClasses=c(rep("character",2), rep("numeric",7))),Date=="1/2/2007"|Date=="2/2/2007")


# Creating a new variable that combines Date and Time
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S") #1/2/2007 00:00:00


# Building the plot and saving it to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(file= "plot2.png", width = 480, height = 480,bg = "transparent")   
with(data, plot(DateTime,Global_active_power, type="l", col= "black", main ="",xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

