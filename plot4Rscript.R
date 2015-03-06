## download Dataset: Electric power consumption [20Mb] from "https://class.coursera.org/exdata-012/human_grading/view/courses/973506/assessments/3/submissions"
## unzip file and set in working directory

## read in data and combine date & time into one readable source
largedata<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
largedata<- subset(largedata,as.Date(largedata$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d'))
largedata<- subset(largedata,as.Date(largedata$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d'))
largedata$Date<-as.Date(largedata$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(largedata$Date), largedata$Time)
largedata$datetime <- as.POSIXct(datetime)
largedata$Global_active_power <- as.numeric(largedata$Global_active_power)

##create and save graph
png(filename="plot4.png", width=480, height=480, units="px", pointsize=12,bg="white", type="quartz")

##create format for graphs
par(mfrow=c(2,2))


##plot first line graph
plot(largedata$Global_active_power~largedata$datetime, type="l", ylab="Global Active Power", xlab="")

##plot second line graph
plot(largedata$Voltage~largedata$datetime, type="l", xlab="datetime", ylab="Voltage")

##Plot third line graph and add lines, legend onto graph
plot(largedata$Sub_metering_1~largedata$datetime, type="l", ylab="Energy sub metering", xlab="")
lines(largedata$Sub_metering_2~largedata$datetime, col="red")
lines(largedata$Sub_metering_3~largedata$datetime, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot fourth graph
plot(largedata$Global_reactive_power~largedata$datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()