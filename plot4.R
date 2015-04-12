# read in the data, using subset() to keep only those lines matching the Date condition
epc <- subset(read.table("./private/ExploratoryDataAnalysisCourse/household_power_consumption.txt",
              na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE),
              Date == "1/2/2007" | Date == "2/2/2007")

# convert date & time from character to POSIXct format and add to a new data frame
newTime <- strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")
df <- data.frame(epc,newTime)

# first display on screen device to make sure it's what I want
# then execute the line below to open and write to a png graphics device
png("./private/ExploratoryDataAnalysisCourse/plot4.png")

par(mfrow=c(2,2))

# upper left plot
par(mar=c(5.1,4.1,3,2.1))
plot(df$newTime,df$Global_active_power,ylab="Global Active Power",
     type="n",xlab="")
lines(df$newTime,df$Global_active_power)

# upper right plot
par(mar=c(5.1,4.1,3,2.1))
plot(df$newTime,df$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(df$newTime,df$Voltage)

# lower left plot
par(mar=c(5.1,4.1,3,2.1))
plot(df$newTime,df$Sub_metering_1,xlab="",ylab="Energy sub metering",
     type="n")
lines(df$newTime,df$Sub_metering_1)
lines(df$newTime,df$Sub_metering_2,col="red")
lines(df$newTime,df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1,bty="n")

# lower right plot
par(mar=c(5.1,4.1,3,2.1))
plot(df$newTime,df$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="n")
lines(df$newTime,df$Global_reactive_power)

dev.off()