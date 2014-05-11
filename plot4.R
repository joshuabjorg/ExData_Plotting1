
data1 <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";")

data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data1)
plotdata <- data2

plotdata$Date   <- as.Date(data2$Date)               
plotdata$Time   <- strptime(paste(data2$Date, data2$Time),"%d/%m/%Y %T")         

for (i in 3:9) {
  plotdata[,i] <-as.numeric(as.character(data2[,i]))
}

par(mfrow=c(2,2))

#plot top left
with(plotdata, plot(y=plotdata$Global_active_power, x=plotdata$Time,type="l",
                    ylab="Global Active Power",xlab="",main=""))

#plot top right
with(plotdata, plot(y=plotdata$Voltage,  x=plotdata$Time,type="l",
                    ylab="Voltage",xlab="datetime",main=""))

#plot bottom left
with(plotdata, plot(y=plotdata$Sub_metering_1, x=plotdata$Time,
                    ylab="Energy sub metering", xlab="",type="l",
                    main=""))

with(plotdata, lines(y=plotdata$Sub_metering_2, x=plotdata$Time,
                     col="Red"))

with(plotdata, lines(y=plotdata$Sub_metering_3, x=plotdata$Time,
                     col="Blue"))

legend("topright", lty =1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n",cex=.6,inset=.01)

#plot bottom right
with(plotdata, plot(y=plotdata$Global_reactive_power,  x=plotdata$Time,type="l",
                    ylab="Global_reactive_power",xlab="datetime",main=""))

dev.copy(png, file =
           "plot4.png", width=480, height=480)

dev.off() 
