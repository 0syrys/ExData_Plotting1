data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
plot1<-filter(data,Date=="1/2/2007" | Date=="2/2/2007")
plot1$Date<-as.Date(as.character(plot1$Date),"%d/%m/%Y")
plot1$Time<-strftime(paste(plot1$Date,as.character(plot1$Time)))
plot1$Global_active_power<-as.numeric(as.character(plot1$Global_active_power))
png(filename = "Plot1.png", width = 480, height = 480)
hist(plot1$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

