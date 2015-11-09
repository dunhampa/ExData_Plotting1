plot4<-function(){
  
  library(dplyr)
  #library(lubridate)
  
  ##Get raw data
  power.raw.data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  power.raw.data["DateTime"]<-paste(power.raw.data[,1],power.raw.data[,2])
  
  #Make it a dataframe
  power.df<-as.data.frame(power.raw.data)
  
  #Covert to Date Time Class
  power.df$Date<-as.Date(power.df$Date, "%d/%m/%Y")
  power.df$DateTime<-as.POSIXct(strptime(power.df$DateTime, "%d/%m/%Y %H:%M:%S"))
  
  #Use only the subset of interest
  filtered.df<-filter(power.df, Date>="2007-02-01" & Date<="2007-02-02")
  
  
  sub1<-as.numeric(as.character(filtered.df$Sub_metering_1))
  sub2<-as.numeric(as.character(filtered.df$Sub_metering_2))
  sub3<-as.numeric(as.character(filtered.df$Sub_metering_3))
  
  
  
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  
  plot(filtered.df$DateTime,filtered.df$Global_active_power, type="l", ylab ="Global Active Power", xlab="")
  plot(filtered.df$DateTime,filtered.df$Voltage, type="l", ylab ="Voltage", xlab="datetime")
  
  plot(filtered.df$DateTime,sub1, type="l",xlab="",ylab="Energy sub metering")
  lines(filtered.df$DateTime,sub2, col="red")
  lines(filtered.df$DateTime,sub3, col="blue")
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1),
         col=c("black","blue","red"))
  plot(filtered.df$DateTime,filtered.df$Global_reactive_power, type="l", ylab ="Global_reactive_power", xlab="datetime")
  
  dev.copy(png, file = "Plot4.png") 
  dev.off()
  par(mfrow = c(1, 1))
  
  
  
}