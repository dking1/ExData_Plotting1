## download Dataset: Electric power consumption [20Mb] from "https://class.coursera.org/exdata-012/human_grading/view/courses/973506/assessments/3/submissions"

## unzip file and set in working directory

## read in data and combine date & time into one readable source
largedata<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
largedata<- subset(largedata,as.Date(largedata$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d'))
largedata<- subset(largedata,as.Date(largedata$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d'))
largedata$Date<-as.Date(largedata$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(largedata$Date), largedata$Time)
largedata$datetime <- as.POSIXct(datetime)


## Create and save line graph
png(filename="plot3.png", width=480, height=480, units="px", pointsize=12,bg="white", type="quartz")
plot(largedata$Sub_metering_1~largedata$datetime, type="l", ylab="Energy sub metering", xlab="")

## add additional lines to graph
lines(largedata$Sub_metering_2~largedata$datetime, col="red")
lines(largedata$Sub_metering_3~largedata$datetime, col="blue")

## add legend to graph
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()