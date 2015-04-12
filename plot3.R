# read in the data, using subset() to keep only those lines matching the Date condition
epc <- subset(read.table("./private/ExploratoryDataAnalysisCourse/household_power_consumption.txt",
              na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE),
              Date == "1/2/2007" | Date == "2/2/2007")

# convert date & time from character to POSIXct format and add to a new data frame
newTime <- strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")
df <- data.frame(epc,newTime)

# first display on screen device to make sure it's what I want
plot(df$newTime,df$Sub_metering_1,xlab="",ylab="Energy sub metering",
     type="n")
lines(df$newTime,df$Sub_metering_1)
lines(df$newTime,df$Sub_metering_2,col="red")
lines(df$newTime,df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1)

# now open and write to a png graphics device
png("./private/ExploratoryDataAnalysisCourse/plot3.png")
plot(df$newTime,df$Sub_metering_1,xlab="",ylab="Energy sub metering",
     type="n")
lines(df$newTime,df$Sub_metering_1)
lines(df$newTime,df$Sub_metering_2,col="red")
lines(df$newTime,df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1)
dev.off()