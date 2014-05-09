#################################################################################
#                                                                               #
#       plot2.R: plot DateTime vs. Global_activity_power as required            #                                  #
#                                                                               #
#################################################################################


setwd("C:/DataScience_Exploratory")
library(sqldf)


### only read in needed data 
f <- file("household_power_consumption.txt")
data <- sqldf("select * from f where Date = '1/2/2007' OR Date = '2/2/2007'", 
              dbname = tempfile(), file.format = list(header = T, sep = ";"))


###    combine Date & Time, change to POSIXIt format as a new column: DateTime
data$DateTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


###   plot2: plot DateTime vs. Global_activity_power
png(file="plot2.png")
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
