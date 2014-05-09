#################################################################################
#                                                                               #
#   plot3.R: plot DateTime vs. Sub_metering_1, Sub_metering_2 & Sub_metering_3  #
#             with legend as required                                           #
#                                                                               #                                                            
#################################################################################


### set working directory and load package: sqldf
setwd("C:/DataScience_Exploratory")
library(sqldf)


### only read in needed data 
f <- file("household_power_consumption.txt")
data <- sqldf("select * from f where Date = '1/2/2007' OR Date = '2/2/2007'", 
              dbname = tempfile(), file.format = list(header = T, sep = ";"))


###    combine Date & Time, change to POSIXIt format as a new column: DateTime
data$DateTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


###   plot3: plot DateTime vs. Sub_metering_1, Sub_metering_2 & Sub_metering_3 with legend
png(file="plot3.png")
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=1, y.intersp=0.8,
       text.width=strwidth("Sub_metering_1"))
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
dev.off()