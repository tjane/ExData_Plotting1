data <-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.string = "?")
good <- !is.na(factor(data$Date,levels = c("1/2/2007","2/2/2007"))) 
used <- data[good,]
date <- as.character(used$Date)
time <- as.character(used$Time)
s <- paste(as.character(used$Date),as.character(used$Time),sep = " ")
png("plot2.png")
plot (strptime(s,format = "%d/%m/%Y %H:%M:%S"),used$Global_active_power,
     type = "l",
     ylab = "Global Active Power(kilowatts)",
     xlab = "")

dev.off()