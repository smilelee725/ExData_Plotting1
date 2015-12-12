x<-read.table("household_power_consumption.txt",header = TRUE, sep=';')

x$Date<-as.Date(x$Date,format="%d/%m/%Y")

xs<-subset(x,x$Date == as.Date("2007-02-01") | x$Date == as.Date("2007-02-02"))

s_m_1<-as.numeric(as.character(xs$Sub_metering_1))
s_m_2<-as.numeric(as.character(xs$Sub_metering_2))
s_m_3<-as.numeric(as.character(xs$Sub_metering_3))

t<-paste(xs$Date,xs$Time)
ts<-strptime(t,format = "%Y-%m-%d %H:%M:%S")

png("plot3.png",width=480,height=480)
plot(ts,s_m_1,xlab="",ylab="Energy sub metering",pch = 1, type ="l")
lines(ts,s_m_2,pch=1, type= "l",col="red")
lines(ts,s_m_3,pch=1, type= "l",col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(1,1,1),col = c("black","red","blue"),bty="n")
dev.off()
