## download Dataset: Electric power consumption [20Mb] from:
"https://class.coursera.org/exdata-012/human_grading/view/courses/973506/assessments/3/submissions"
## unzip file and set in working directory

##read in data
largedata<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

##subsetting data for only the required dates
largedata<- subset(largedata,as.Date(largedata$Date,format='%d/%m/%Y')>=as.Date('2007-02-01',format='%Y-%m-%d'))
largedata<- subset(largedata,as.Date(largedata$Date,format='%d/%m/%Y')<=as.Date('2007-02-02',format='%Y-%m-%d'))
largedata$Global_active_power <- as.numeric(largedata$Global_active_power)

## creating and saving histogram 
png(filename="plot1.png", width=480, height=480, units="px", pointsize=12,bg="white", type="quartz")
hist(largedata$Global_active_power, col= "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
