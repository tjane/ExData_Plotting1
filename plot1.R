data <-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.string = "?")
good <- !is.na(factor(data$Date,levels = c("1/2/2007","2/2/2007"))) 
used <- data[good,]
png("plot1.png")
hist(used$Global_active_power,
     main = "Global Active Power",
     breaks = 12,
     xlab = "Global Active Power(kilowats)",
     ylab = "Frequency",
     ylim = c(0,1200),
     col = "red")

dev.off()