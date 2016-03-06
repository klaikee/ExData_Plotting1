# assumes datafile is in the working directory
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings= "?")
hpcsubset <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
png("plot1.png", width=480, height= 480)
hist(hpcsubset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()