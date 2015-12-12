x<-read.table("household_power_consumption.txt",header = TRUE, sep=';')

x$Date<-as.Date(x$Date,format="%d/%m/%Y")

xs<-subset(x,x$Date == as.Date("2007-02-01") | x$Date == as.Date("2007-02-02"))

gap <- as.numeric(as.character(xs$Global_active_power))

t<-paste(xs$Date,xs$Time)
ts<-strptime(t,format = "%Y-%m-%d %H:%M:%S")

png("plot2.png",width=480,height=480)
plot(ts,gap,xlab="",ylab="Global Active Power (kilowatts)",pch = 1, type ="l")
dev.off()
