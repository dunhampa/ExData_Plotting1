plot2<-function(){
  
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
  
  ydata<-filtered.df$Global_active_power
  xdata<-filtered.df$DateTime
  
  plot(xdata,ydata, type="l", ylab ="Global Active Power (kilowatts)", xlab="")
  
  dev.copy(png, file = "Plot2.png")  ## Copy my plot to a PNG file dev.off()
  dev.off()
}
