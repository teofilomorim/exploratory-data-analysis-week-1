## plot4.R

getwd()
setwd("E:/Documentos/Escola/UAlg/R Coursera/Exploratory Data Analysis/Week 1/")

Sys.setlocale("LC_TIME", "English") #changes the language of the program

mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
newdata<-subset(mydata, Date=="1/2/2007"|Date=="2/2/2007") # subsets the data

datetime<-as.POSIXct(paste(newdata$Date, newdata$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

class(newdata$Global_active_power)
gap<-as.numeric(as.character(newdata$Global_active_power))# changes the data's 
                                                          # class to numeric
plot(datetime,gap, type="l",ylab="Global Active Power", xlab="")

class(newdata$Voltage)
volt<-as.numeric(as.character(newdata$Voltage))
plot(datetime, volt, type="l", ylab="Voltage", xlab="datetime")

class(newdata$Sub_metering_1);class(newdata$Sub_metering_2);class(newdata$Sub_metering_3)
sub1<-as.numeric(as.character(newdata$Sub_metering_1))
sub2<-as.numeric(as.character(newdata$Sub_metering_2))

plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, col="red")
lines(datetime, newdata$Sub_metering_3, col="blue")
legend("topright", col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1,
       bg="transparent", bty="n", y.intersp=0.75, seg.len=1.5)

class(newdata$Global_reactive_power)
gint<-as.numeric(as.character(newdata$Global_reactive_power))
plot(datetime, gint, type="l", ylab="Global_reactive_power", xlab="datetime")

par(mfrow = c(1, 1))

dev.copy(png, file="plot4.png", width=480,height=480,units="px",bg = "transparent")
dev.off()
