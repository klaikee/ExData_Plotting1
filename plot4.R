# assumes datafile is in the working directory
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings= "?")
hpcsubset <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpcsubset$datetime <- strptime(paste(hpcsubset$Date, hpcsubset$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height= 480)
par(mfrow=c(2,2))
#1
plot(hpcsubset$datetime,hpcsubset$Global_active_power,  type="l", xlab="",ylab="Global Active Power")
#2
plot(hpcsubset$datetime, hpcsubset$Voltage, type="l", xlab="datetime",ylab="Voltage")
#3
plot(hpcsubset$datetime,hpcsubset$Sub_metering_1,  type="l", col="black", xlab="",ylab="Energy sub metering")
lines(hpcsubset$datetime, hpcsubset$Sub_metering_2, col="red")
lines(hpcsubset$datetime, hpcsubset$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, bty = "n")
#4
plot(hpcsubset$datetime, hpcsubset$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
dev.off()
