#set working directory
  setwd ("H:/Coursera/Course 4/ExData_Plotting1")

#load data
  df <- read.csv("household_power_consumption.txt", na.string ="?", sep =";", header = T)

#extract subset of data from 2007-02-01 to 2007-02-02
  df <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]

#combine date / time
  df$DateTime <- strptime(paste(df$Date, df$Time, sep =" "), format ="%d/%m/%Y %H:%M:%S")

#generate plot & export as png file
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2, 2))
  plot(df$DateTime, df$Global_active_power, type ="l", xlab ="", ylab ="Global Active Power")
  plot(df$DateTime, df$Voltage, type="l", xlab ="datetime", ylab ="Voltage")
  plot(df$DateTime, df$Sub_metering_1, type ="l", xlab ="", ylab ="Energy sub metering")
  lines(df$DateTime, df$Sub_metering_2, col = "red")
  lines(df$DateTime, df$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
  plot(df$DateTime, df$Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_Power")
  
#turn off device
  dev.off()