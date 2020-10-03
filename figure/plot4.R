data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
plot4<-filter(data,Date=="1/2/2007" | Date=="2/2/2007")
plot4$Date<-as.Date(as.character(plot4$Date),"%d/%m/%Y")
plot4$Time<-strptime(paste(plot4$Date,as.character(plot4$Time)),format= "%Y-%m-%d %H:%M:%S")
plot4$Global_active_power<-as.numeric(as.character(plot4$Global_active_power))
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

with(plot4, {
  plot(x = Time, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x = Time, y = Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(x = Time, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = Time, y = Sub_metering_2, type = "l", col = "red")
  lines(x = Time, y = Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x = Time, y = Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()