# Read the data
setwd('C:/Users/Da Hoang/Downloads/Compressed/exdata_data_household_power_consumption')
power_total = read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")

#Transform the Date variable into Date type and subsetting the date
power_total$Date = as.Date(power_total$Date,"%d/%m/%Y")
power = subset(power_total, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create the DateTime variable which is the concatenation of Date and Time
power$DateTime = paste(power$Date, power$Time)
power$DateTime = strptime(power$DateTime, "%Y-%m-%d %H:%M:%S")

#Create the four figures
png("plot4.png")
par(mar = c(5,5,4,2))
par("mfrow"= c(2,2))
plot(power$DateTime,power$Global_active_power,type="l", xlab = "", ylab = "Global Active Power")

plot(power$DateTime,power$Voltage,type="l", xlab = "DateTime", ylab = "Voltage")

plot(power$DateTime,power$Sub_metering_1,type="l", xlab = "", ylab = "Enery Sub metering")
lines(power$DateTime,power$Sub_metering_2,col = "Red")
lines(power$DateTime,power$Sub_metering_3,col = "Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1,cex=0.8)

power$Global_reactive_power = as.numeric(power$Global_reactive_power)
plot(power$DateTime,power$Global_reactive_power,type="l", xlab = "DateTime", ylab = "Global Reactive Power")
dev.off()



