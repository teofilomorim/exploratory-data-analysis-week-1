## plot2.R

getwd()
setwd("E:/Documentos/Escola/UAlg/R Coursera/Exploratory Data Analysis/Week 1/")

Sys.setlocale("LC_TIME", "English") # changes the language of the program

mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
newdata<-subset(mydata, Date=="1/2/2007"|Date=="2/2/2007") # subsets the data

datetime<-as.POSIXct(paste(newdata$Date, newdata$Time), format="%d/%m/%Y %H:%M:%S", 
    tz="GMT")

class(newdata$Global_active_power)
gap<-as.numeric(as.character(newdata$Global_active_power)) # changes the data's 
                                                           # class to numeric

plot(datetime,gap, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", width=480,height=480,units="px",bg = "transparent")
dev.off()
