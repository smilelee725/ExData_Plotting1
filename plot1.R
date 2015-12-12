x<-read.table("household_power_consumption.txt",header = TRUE, sep=';')

x$Date<-as.Date(x$Date,format="%d/%m/%Y")

xs<-subset(x,x$Date == as.Date("2007-02-01") | x$Date == as.Date("2007-02-02"))

gap <- as.numeric(as.character(xs$Global_active_power))

png("plot1.png",width=480,height=480)
hist(gap,col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
