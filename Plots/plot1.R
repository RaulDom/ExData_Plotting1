#Plot 1

#Loading the data (it asumes that you have the data in your current work directory)
data <- read.csv2(file='household_power_consumption.txt', header=TRUE)
data$Date <- as.Date(data$Date, format='%d/%m/%Y')

##Select the specific dates for the plots
power_consuption <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") ,]

#converting in numerc type
for(i in colnames(power_consuption[,3:9])) { power_consuption[,i] <- as.numeric(as.character(power_consuption[,i]))}

#Ploting
png(filename="plot1.png",width=480, height=480)
hist(power_consuption$Global_active_power, col="red", main="Global active power", xlab="Global Active Power (kilowatts)")
dev.off()
