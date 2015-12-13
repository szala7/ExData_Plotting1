data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # read the file

data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")

# using this format is simplify the search, but there are some things that keep in mind:
# first year-2006 in date-106 so the year 2007 is 107 and the mounth 12 is 11 so the February is 1!!!
# the days are normal

subdata <- subset(data,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot1.png",width = 480, height = 480)
hist(subdata$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowats)",col="red",ylim=c(0,1200))
dev.off()
