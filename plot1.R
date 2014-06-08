library(datasets)
data <- read.csv(file="household_power_consumption.txt", sep=";", na.strings=c("?"), colClasses = c("character","character",rep("numeric",7)))
data[[2]] <- strptime(paste(data[[1]],data[[2]]), format='%d/%m/%Y %H:%M:%S')
data[[1]] <- as.Date(data[[1]], format='%d/%m/%Y')
filtered <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02')  ,]
hist(filtered[[3]],xlab="Global Active Power (kilowatts)",col="#FF0000", main = "Global Active Power")
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()
