setwd("C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/")
directory <- getwd()
datafile <- "C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/household_power_consumption.txt"
data <- read.table(datafile, sep= ";", stringsAsFactors = FALSE, header= TRUE, 
                   na.strings="?", strip.white= TRUE, dec=".")
par(mfcol=c(2,2))

subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

png("C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/plot4.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Global_active_power, type = "l", lwd= 1, ylab = "Global Active Power", xlab="")
plot(subdata$DateTime, subdata$Voltage, type = "l", lwd= 1, ylab = "Voltage", xlab="datetime")
plot(subdata$DateTime, subdata$Sub_metering_1, type = "l", ylab = "Energy_Sub_Metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type= "l", col= "red")
lines(subdata$DateTime, subdata$Sub_metering_3, type= "l", col= "blue")
legend("topright", c("sub_metering_1", "sub_metering_2","sub_metering_3"), lty = 1, col= c("black","red","blue"),bty="n")
plot(subdata$DateTime, subdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="dateime")

dev.off()

rm(list = ls())