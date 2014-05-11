
data1 <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";")

data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data1)
plotdata <- data2

plotdata$Date   <- as.Date(data2$Date)               
plotdata$Time   <- strptime(paste(data2$Date, data2$Time),"%d/%m/%Y %T")         

for (i in 3:9) {
  plotdata[,i] <-as.numeric(as.character(data2[,i]))
}

par(mfrow=c(1,1))

with(plotdata, plot(y=plotdata$Sub_metering_1, x=plotdata$Time,
                    ylab="Energy sub metering", xlab="",type="l",
                    main="",))

with(plotdata, lines(y=plotdata$Sub_metering_2, x=plotdata$Time,
                    col="Red"))

with(plotdata, lines(y=plotdata$Sub_metering_3, x=plotdata$Time,
                     col="Blue"))

legend("topright", lty =1, col = c("black", "red", "blue"), 
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
?legend
dev.copy(png, file =
           "plot3.png", width=480, height=480)

dev.off() 
