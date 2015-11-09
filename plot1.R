########################
# Exploratory Data Analysis
# Course Project #1 Peter Dunham
########################


## The First step is to read in the data
## Assuming the folder is unzipped in working directory 
plot1<-function(){
  
  library(dplyr)
  par(mfrow = c(1, 1))
  
  ##Get raw data
  power.raw.data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  
  #Make it a dataframe
  power.df<-as.data.frame(power.raw.data)
  
  power.df$Date<-as.Date(power.df$Date, "%d/%m/%Y")

  filtered.df<-filter(power.df, Date>="2007-02-01" & Date<="2007-02-02")
 
  head(filtered.df, n=25)
  
  hist(as.numeric(as.character(filtered.df$Global_active_power)), col = "red" , xlab ="Global Active Power (kilowatts)", main="Global Active Power")
  
  dev.copy(png, file = "Plot1.png")  ## Copy my plot to a PNG file dev.off()
  dev.off()
  
}
