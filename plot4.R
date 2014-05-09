#################################################################################
#                                                                               #
#   plot4.R: plot 4 plots in 2 rows 2 columns as required                       #
#                                                                               #                                                            
#################################################################################


### set working directory and load package: sqldf
setwd("C:/DataScience_Exploratory")
library(sqldf)


### only read in needed data 
f <- file("household_power_consumption.txt")
data <- sqldf("select * from f where Date = '1/2/2007' OR Date = '2/2/2007'", dbname = tempfile(), file.format = list(header = T, sep = ";"))


###    combine Date & Time, change to POSIXIt format as a new column: DateTime
data$DateTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


### plot4: 4 plots in 2 rows 2 columns
png(file="plot4.png")
par(mfrow=c(2,2))

# plot1: histogram(Global_activity_power)
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# plot2: plot DateTime vs. Voltage
plot(data$DateTime, data$Voltage, type="l", xlab="datetime",ylab="Voltage",
     ylim=c(233,247))

# plot3: plot DateTime vs. Sub_metering_1, Sub_metering_2 & Sub_metering_3 with legend
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=1, y.intersp=0.8, bty="n",
       text.width=strwidth("Sub_metering_1"))
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")

# plot4: plot DateTime vs. Global_reactive_power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")     

dev.off()