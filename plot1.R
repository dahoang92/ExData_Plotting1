# Read the data
setwd('C:/Users/Da Hoang/Downloads/Compressed/exdata_data_household_power_consumption')
power_total = read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")

#Transform the Date variable into Date type and subsetting the date
power_total$Date = as.Date(power_total$Date,"%d/%m/%Y")
power = subset(power_total, Date >= "2007-02-01" & Date <= "2007-02-02")

#Creat the DateTime variable which is the concatenation of Date and Time
power$DateTime = paste(power$Date, power$Time)
power$DateTime = strptime(power$DateTime, "%Y-%m-%d %H:%M:%S")

#change the factor variable into numeric variable
power$Global_active_power = as.numeric (power$Global_active_power)

#creating the histogram plot of Global_active_power and save it to the png file
png("plot1.png")
par(mar = c(5,5,4,2))
hist(power$Global_active_power,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "Red", ylim = c(0,1300))
dev.off()

