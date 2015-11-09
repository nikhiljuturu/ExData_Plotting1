#Exploratory Data Analysis Assignment 1
#Plot 3.R

#File Path
file_path<-'D:/Coursera/Exploratory Data Analysis/Data/Assignment 1/household_power_consumption.txt'

#Read File
full_data<-read.table(file_path,header = TRUE, sep=";",stringsAsFactors=FALSE)

#Filter only the data required
electric_data<-full_data[full_data$Date %in% c('1/2/2007','2/2/2007'),]

#Converting the time into strptime format
datetime <- strptime(paste(electric_data$Date, electric_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting Global Active power to numeric
electric_data$Global_active_power <- as.numeric(electric_data$Global_active_power)

#Converting Submetering to numeric
electric_data$Sub_metering_1 <- as.numeric(electric_data$Sub_metering_1)
electric_data$Sub_metering_2 <- as.numeric(electric_data$Sub_metering_2)
electric_data$Sub_metering_3 <- as.numeric(electric_data$Sub_metering_3)

#Converting Voltage to numeric
electric_data$Voltage <- as.numeric(electric_data$Voltage)


#Open a png device
png('plot4.png',width = 480, height = 480)

#Creating Matrix
par(mfrow = c(2, 2)) 

#Plotting the elements
plot(datetime, electric_data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(datetime, 
     electric_data$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

#plotting the histogram
plot(datetime, electric_data$Sub_metering_1, 
     type = 'l',
     ylab = 'Energy sub metering',
     xlab = " ")

#adding submetering 2 and submetering 3 as lines

lines(datetime, electric_data$Sub_metering_2, type = 'l', col='red')
lines(datetime, electric_data$Sub_metering_3, type = 'l', col='blue')

#Adding legend to the top right for all submetering
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, electric_data$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")


dev.off()
