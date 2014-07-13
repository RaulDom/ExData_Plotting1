#plot2
#Loading the data (it asumes that you have the data in your current work directory)
data <- read.csv2(file='household_power_consumption.txt', header=TRUE)
data$Date <- as.Date(data$Date, format='%d/%m/%Y')

##Select the specific dates for the plots
power_consuption <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") ,]

#converting in numerc type
for(i in colnames(power_consuption[,3:9])) { power_consuption[,i] <- as.numeric(as.character(power_consuption[,i]))}
#Change the language of the system time
Sys.setlocale("LC_TIME","English_United States.1252")
date <- as.POSIXlt(paste(power_consuption$Date, power_consuption$Time))
png(filename="plot2.png",width=480, height=480)
with(power_consuption,plot(date,Global_active_power,type="l", ylab="Global Active Power (kilowatts)"))
dev.off()
