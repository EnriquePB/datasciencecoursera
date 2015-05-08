#First, we set the working directory where we have the file saved:
setwd("C:/Users/ebenoit/Documents/data science/04 Exploratory Data Analysis/exdata-data-household_power_consumption")

#We load the data in a data.frame. We have to make sure that there is a header
#(names of the colums), that it gets separated by ; and that the ? values are reported as missing values.
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",  na.strings="?")

#We convert the time and hour data to datetime style. We save the result in another dataframe:
times<-NULL
times<-cbind(day=strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S"), data[,3:9])

#Now, we take the rows that we need (from 1/2/2007 to 2/2/2007):
finaldata <- subset(times, day >= "2007-02-01" & day < "2007-02-03")

##PLOT4

#As before,We set the days so the data is shown as days of the week:
format(finaldata$day, format="%a")

#Now, we divide the graphics area into 4 parts (2 by 2):
par(mfcol=c(2,2))

## We create the graph of frequency of Global Active Power variable vs el the time, in days (PLOT2)
plot(x=finaldata$day, y=finaldata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# We create the graph of frequency of energy sub metering 1 vs days of the week.(PLOT3)
plot(x=finaldata$day, y=finaldata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=finaldata$day, y=finaldata$Sub_metering_2, type="l", col="red")
lines(x=finaldata$day, y=finaldata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), lwd=c(1.5,1.5, 1.5), bty="n", col=c("black", "blue", "red"), legend=c("Sub metering_1", "Sub metering_2", "Sub metering_3"))

#We plot the top-right graph:
plot(x=finaldata$day, y=finaldata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=finaldata$day, y=finaldata$Global_reactive_power, type="l", xlab="datetime", ylab="Energy_reactive_power")

# Finally, We save the file in a png as plot4.png:
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()

#Return the graph area to 1x1:
par(mfcol=c(1,1))