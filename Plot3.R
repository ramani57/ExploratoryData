setwd("C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/")
directory <- getwd()
datafile <- "C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/household_power_consumption.txt"
data <- read.table(datafile, sep= ";", stringsAsFactors = FALSE, header= TRUE, 
                   na.strings="?", strip.white= TRUE, dec=".")


subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

png("C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/plot3.png", width = 480, height = 480)

plot(subdata$DateTime, subdata$Sub_metering_1, type = "l", ylab = "Energy_Sub_Metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type= "l", col= "red")
lines(subdata$DateTime, subdata$Sub_metering_3, type= "l", col= "blue")
legend("topright", c("sub_metering_1", "sub_metering_2","sub_metering_3"), lty = 1, col= c("black","red","blue"))

dev.off()

