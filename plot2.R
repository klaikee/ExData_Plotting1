# assumes datafile is in the working directory
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings= "?")
hpcsubset <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpcsubset$datetime <- strptime(paste(hpcsubset$Date, hpcsubset$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height= 480)
plot(hpcsubset$datetime,hpcsubset$Global_active_power,  type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

