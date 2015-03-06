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

## create and save line graph
png(filename="plot2.png", width=480, height=480, units="px", pointsize=12,bg="white", type="quartz")
plot(largedata$Global_active_power~largedata$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
