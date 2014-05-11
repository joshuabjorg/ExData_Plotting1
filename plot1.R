
data1 <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";")

data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data1)
plotdata <- data2

plotdata$Date   <- as.Date(data2$Date)               
plotdata$Time   <- strptime(paste(data2$Date, data2$Time),"%d/%m/%Y %T")         

for (i in 3:9) {
  plotdata[,i] <-as.numeric(as.character(data2[,i]))
}

View(plotdata)
View(data2)

par(mfrow=c(1,1))

with(plotdata, hist(plotdata$Global_active_power, 
                    xlab="Global Active Power (kilowatts)", 
                    main="Global Active Power", col="Red"))


dev.copy(png, file =
           "plot1.png", width=480, height=480
)
dev.off() 
