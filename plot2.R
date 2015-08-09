# Read the data
setwd('C:/Users/Da Hoang/Downloads/Compressed/exdata_data_household_power_consumption')
power_total = read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")

#Transform the Date variable into Date type and subsetting the date
power_total$Date = as.Date(power_total$Date,"%d/%m/%Y")
power = subset(power_total, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create the DateTime variable which is the concatenation of Date and Time
power$DateTime = paste(power$Date, power$Time)
power$DateTime = strptime(power$DateTime, "%Y-%m-%d %H:%M:%S")

#create the line plot
png("plot2.png")
par(mar = c(5,5,4,2))
plot(power$DateTime,power$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab="",type="l")
dev.off()