plot3<-function(){
  
  library(dplyr)
  
  ##Get raw data
  power.raw.data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  power.raw.data["DateTime"]<-paste(power.raw.data[,1],power.raw.data[,2])
  
  #Make it a dataframe
  power.df<-as.data.frame(power.raw.data)
  
  
  power.df$Date<-as.Date(power.df$Date, "%d/%m/%Y")
  power.df$DateTime<-as.POSIXct(strptime(power.df$DateTime, "%d/%m/%Y %H:%M:%S"))
  
  filtered.df<-filter(power.df, Date>="2007-02-01" & Date<="2007-02-02")
  head(filtered.df, n=10)
  
  sub1<-as.numeric(as.character(filtered.df$Sub_metering_1))
  sub2<-as.numeric(as.character(filtered.df$Sub_metering_2))
  sub3<-as.numeric(as.character(filtered.df$Sub_metering_3))
 
  
  
  head(filtered.df,n=10)
  plot(filtered.df$DateTime,sub1, type="l",xlab="",ylab="Energy sub metering")
  lines(filtered.df$DateTime,sub2, col="red")
  lines(filtered.df$DateTime,sub3, col="blue")
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1),
         col=c("black","blue","red"))
  
  
  dev.copy(png, file = "Plot3.png")  ## Copy my plot to a PNG file dev.off()
  dev.off()
}
