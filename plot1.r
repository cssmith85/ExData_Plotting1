#set working directory
  setwd ("H:/Coursera/Course 4/ExData_Plotting1")

#load data
  df <- read.csv("household_power_consumption.txt", na.string ="?", sep =";", header = T)

#extract subset of data from 2007-02-01 to 2007-02-02
  df <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]

#combine date / time
  df$DateTime <- strptime(paste(df$Date, df$Time, sep =" "), format ="%d/%m/%Y %H:%M:%S")

#generate plot & export as png file
  png("plot1.png", width=480, height=480)
  hist(df$Global_active_power, main ="Global Active Power", xlab ="Global Active Power (kilowatts)", col ="red")

#turn off device
  dev.off()