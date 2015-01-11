data <-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.string = "?")
good <- !is.na(factor(data$Date,levels = c("1/2/2007","2/2/2007"))) 
used <- data[good,]
date <- as.character(used$Date)
time <- as.character(used$Time)
s <- paste(as.character(used$Date),as.character(used$Time),sep = " ")
etime <- strptime(s,format = "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(etime,used$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(etime,used$Sub_metering_2,
      col = "red",lwd = 0.5)
lines(etime,used$Sub_metering_3,
      col = "blue",lwd = 0.5)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1,bty = "n")
dev.off()