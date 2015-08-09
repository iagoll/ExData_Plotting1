a <- read.table("household_power_consumption.txt", sep=";")   ## read table with sep=";"
b1 <- subset(a,a[,1]=="1/2/2007")   ## subset 01/02/2007
b2 <- subset(a,a[,1]=="2/2/2007")   # subset 02/02/2007
c <- rbind(b1,b2)    ## row bind b1 and b2
colnames(c) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")   ## naming columns
xx <- c(1:2880)
gap <- as.numeric(levels(c[,3]))[c[,3]] ## GAP
volt <- as.numeric(levels(c[,5]))[c[,5]] ## Voltage
esm1 <- as.numeric(levels(c[,7]))[c[,7]] ## esm1
esm2 <- as.numeric(levels(c[,8]))[c[,8]] ## esm2
esm3 <- as.numeric(levels(c[,9]))[c[,9]] ## esm3
grp <- as.numeric(levels(c[,4]))[c[,4]] ## GRP
par(mfrow=c(2,2))
## Plot 1
plot(xx,gap,type="l", xaxt="n",xlab="", ylab = "Global Active Power (kilowatts)")
axis(1,at=0,labels = "Thu")
axis(1,at=1441,labels = "Fri")
axis(1,at=2880,labels = "Sat")
## Plot 2
plot(xx,volt,type="l", xaxt="n",xlab="datetime", ylab = "Voltage")
axis(1,at=0,labels = "Thu")
axis(1,at=1441,labels = "Fri")
axis(1,at=2880,labels = "Sat")
## Plot 3
plot(xx,esm1, type="l", col="black", xaxt="n",xlab="", ylab = "Energy sub metering")
lines(esm2, col="red")
lines(esm3, col="blue")
axis(1,at=0,labels = "Thu")   ## "Thu" mark
axis(1,at=1441,labels = "Fri")   ## "Fri" mark
axis(1,at=2880,labels = "Sat")   ## "Sat" mark
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,2), col=c("black","red","blue"), cex=0.5)
## Plot 4
plot(xx,grp,type="l", xaxt="n",xlab="datetime", ylab = "Global_reactive_power")
axis(1,at=0,labels = "Thu")
axis(1,at=1441,labels = "Fri")
axis(1,at=2880,labels = "Sat")
dev.copy(png, file="plot4.png")   ## saving into a PNG file
dev.off()   ## closing PNG device