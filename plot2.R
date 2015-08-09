a <- read.table("household_power_consumption.txt", sep=";")   ## read table with sep=";"
b1 <- subset(a,a[,1]=="1/2/2007")   ## subset 01/02/2007
b2 <- subset(a,a[,1]=="2/2/2007")   # subset 02/02/2007
c <- rbind(b1,b2)    ## row bind b1 and b2
colnames(c) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")   ## naming columns
gap2 <- as.numeric(levels(c[,3]))[c[,3]]   ## change the data on column 3 (Global active power) from 'factor' to 'numeric'
days <- c(1:2880)   ## numbers 1 to 2880
plot(days,gap2,type="l", xaxt="n",xlab="", ylab = "Global Active Power (kilowatts)")   ## plot of 1:2880(x) vs Global Active Power
axis(1,at=0,labels = "Thu")   ## "Thu" mark
axis(1,at=1441,labels = "Fri")   ## "Fri" mark
axis(1,at=2880,labels = "Sat")   ## "Sat" mark
dev.copy(png, file="plot2.png")   ## saving into a PNG file
dev.off()   ## closing PNG device
