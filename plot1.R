#Exploratory Data Analysis Assignment 1
#Plot 1.R

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

#Open a png device
png('plot1.png',width = 480, height = 480)

#plotting the histogram
hist(electric_data$Global_active_power,
     col='red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')



dev.off()
