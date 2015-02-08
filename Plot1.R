setwd("C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/")
directory <- getwd()
datafile <- "C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/household_power_consumption.txt"
data <- read.table(datafile, sep= ";", stringsAsFactors = FALSE, header= TRUE, 
                  na.strings="?",  dec=".")


subdata <- data[data$Date %in% c("2/1/2007","2/2/2007" ),]

png("C:/Users/538321/Documents/DataManagement/ExploratoryDataAnalysis/plot1.png", width = 480, height = 480)
histt(subdata$Global_Active_Power, col= "red", xlab= "Global Active Power(kilowatts)", ylab="Frequency", main = "Global Acive Power")

dev.off()

