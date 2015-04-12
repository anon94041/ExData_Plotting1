# read in the data, using subset() to keep only those lines matching the Date condition
epc <- subset(read.table("./private/ExploratoryDataAnalysisCourse/household_power_consumption.txt",
              na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE),
              Date == "1/2/2007" | Date == "2/2/2007")

# convert date & time from character to POSIXct format and add to a new data frame
newTime <- strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")
df <- data.frame(epc,newTime)

# first display on screen device to make sure it's what I want
plot(df$newTime,df$Global_active_power,ylab="Global Active Power (kilowatts)",
     type="n",xlab="")
lines(df$newTime,df$Global_active_power)

# now open and write to a png graphics device
png("./private/ExploratoryDataAnalysisCourse/plot2.png")
plot(df$newTime,df$Global_active_power,ylab="Global Active Power (kilowatts)",
     type="n",xlab="")
lines(df$newTime,df$Global_active_power)
dev.off()