a <- read.table("household_power_consumption.txt", sep=";")   ## read table with sep=";"
b1 <- subset(a,a[,1]=="1/2/2007")   ## subset 01/02/2007
b2 <- subset(a,a[,1]=="2/2/2007")   # subset 02/02/2007
c <- rbind(b1,b2)    ## row bind b1 and b2
colnames(c) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")   ## naming columns
pl1 <- as.numeric(levels(c[,3]))[c[,3]]   ## change the data on column 3 (Global active power) from 'factor' to 'numeric'
hist(pl1,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")   ## plot with title, color and label
dev.copy(png, file="plot1.png")   ## saving into a PNG file
dev.off()   ## closing PNG device
