x<-read.table("household_power_consumption.txt",header = TRUE, sep=';')

x$Date<-as.Date(x$Date,format="%d/%m/%Y")

xs<-subset(x,x$Date == as.Date("2007-02-01") | x$Date == as.Date("2007-02-02"))

gap <- as.numeric(as.character(xs$Global_active_power))
s_m_1<-as.numeric(as.character(xs$Sub_metering_1))
s_m_2<-as.numeric(as.character(xs$Sub_metering_2))
s_m_3<-as.numeric(as.character(xs$Sub_metering_3))

v<-as.numeric(as.character(xs$Voltage),digits=9)
grp <- as.numeric(as.character(xs$Global_reactive_power))

t<-paste(xs$Date,xs$Time)
ts<-strptime(t,format = "%Y-%m-%d %H:%M:%S")

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,4,2))
## 1
plot(ts,gap,xlab="",ylab="Global Active Power (kilowatts)",pch = 1, type ="l")

## 2
plot(ts,v,xlab = "datetime", ylab="Voltage",pch = 1, type ="l")

## 3
plot(ts,s_m_1,xlab="",ylab="Energy sub metering",pch = 1, type ="l")
lines(ts,s_m_2,pch=1, type= "l",col="red")
lines(ts,s_m_3,pch=1, type= "l",col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(1,1,1),col = c("black","red","blue"),bty="n")

## 4
plot(ts,grp,xlab = "datetime", ylab="Global_reactive_power",pch = 1, type ="l")
dev.off()
