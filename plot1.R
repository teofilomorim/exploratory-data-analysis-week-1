## plot1.R

getwd()
setwd("E:/Documentos/Escola/UAlg/R Coursera/Exploratory Data Analysis/Week 1/")

Sys.setlocale("LC_TIME", "English") # changes the language of the program 

mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
newdata<-subset(mydata, Date=="1/2/2007"|Date=="2/2/2007") # subsets the data

class(newdata$Global_active_power)
gap<-as.numeric(as.character(newdata$Global_active_power)) # changes the data's 
                                                           # class to numeric
hist(gap, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.copy(png, file="plot1.png", width=480,height=480,units="px",bg = "transparent")
dev.off()

