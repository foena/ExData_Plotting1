setwd("C:/User/Exploratory_Data_Analysis/coding")

# read in the whole data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# replace the characters of date by their date with the right formate
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# filter out data between 2007-2-2 and 2007-2-2 and remove incomplete datasets
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
t <- t[complete.cases(t),]


## Combine Date and Time column
date_Time <- paste(data$Date, data$Time)
date_Time <- setNames(date_Time, "Date_Time")
data <- data[ ,!(names(data) %in% c("Date","Time"))]
data <- cbind(date_Time, data)
data$date_Time <- as.POSIXct(date_Time)

# plot2:
plot(data$date_Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()