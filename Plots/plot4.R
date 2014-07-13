#plot4
#Loading the data (it asumes that you have the data in your current work directory)
data <- read.csv2(file='household_power_consumption.txt', header=TRUE)
data$Date <- as.Date(data$Date, format='%d/%m/%Y')

##Select the specific dates for the plots
power_consuption <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") ,]

#converting in numerc type
for(i in colnames(power_consuption[,3:9])) { power_consuption[,i] <- as.numeric(as.character(power_consuption[,i]))}


date <- as.POSIXlt(paste(power_consuption$Date, power_consuption$Time))

png(filename="plot4.png",width=480, height=480)


par(mfrow=c(2,2))
#1
with(power_consuption,plot(date,Global_active_power,type="l",xlab="", ylab="Global Active Power"))
#2
with(power_consuption,plot(date,Voltage,type="l", xlab="datetime"))
#3
plot(date,power_consuption$Sub_metering_1, type="l", col="gray", ylab="Energy sub metering",xlab="")
lines(date,power_consuption$Sub_metering_2,type="l", col="red")
lines(date,power_consuption$Sub_metering_3,type="l", col="blue")
legend("topright", col = c("gray", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n" )
#4
with(power_consuption,plot(date,Global_reactive_power,type="l", xlab="datetime"))

dev.off()
