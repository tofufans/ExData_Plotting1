#################################################################################
#                                                                               #
#       plot1.R: plot histogram (Global_activity_power) as required             #                                  #
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


###   plot1:  histogram of Global_activity_power
png(file="plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", 
     main="Global Active Power")
dev.off()