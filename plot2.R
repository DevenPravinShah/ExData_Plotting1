## This script reads the data and creates "plot2.png" as per this assignment.
## The README.md of this repository has description of the assignment.
#
## I have downloaded and saved the source data file household_power_consumption.txt to
## Data folder that is at same level as the repository folder on my computer.
#
## Change this to pathname on your computer for the repository to run this script
#
setwd("~/Documents/GitHub/ExData_Plotting1") 
#
## Install, load PNG package
#
install.packages("png")
library("png", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")

power_consumption_data <- read.csv("../Data/household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors=FALSE, check.names = FALSE, comment.char="", quote='\"')
#
## Assignment is to plot data for two dates - Feb 01, 2007 and Feb 02, 2007
## Let's extract out data for these two dates in a new variable called data_feb_1_2_2007
#
data_feb_1_2_2007 <- subset(power_consumption_data, Date %in% c("1/2/2007", "2/2/2007"))
#
## Convert Date strings to Date class
#
data_feb_1_2_2007$Date <- as.Date(data_feb_1_2_2007$Date, format="%d/%m/%Y")
#
## Create POSIXct object
#
DateAndTime <- paste(data_feb_1_2_2007$Date, data_feb_1_2_2007$Time) # Concatenate date and time to one string
data_feb_1_2_2007$DateAndTime <- as.POSIXct(DateAndTime)
#
## Create the plot 
#
with(data_feb_1_2_2007, plot(Global_active_power ~ DateAndTime, type = "l", ylab="Global Active Power (kilowatts)"))
#
# 
## Copy graph to plot2.png file
#
dev.copy(png, file = "plot2.png")
#
## Turn off device
#
x<-dev.off()
