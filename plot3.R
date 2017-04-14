
data<- read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,dec='.')

subdata<- data[data$Date %in% c("1/2/2007","2/2/2007") , ]


sub_met_1<-as.numeric(subdata$Sub_metering_1)
sub_met_2<-as.numeric(subdata$Sub_metering_2)
sub_met_3<-as.numeric(subdata$Sub_metering_3)

datetime<- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S ")


png("plot3.png",width = 480 ,height = 480)

plot(datetime,sub_met_1,type="l",xlab = "" ,ylab = "Energy Sub Metering")

lines(datetime,sub_met_2,type="l",col="red")
lines(datetime,sub_met_3,type="l",col="blue")

legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,lwd = 2.5 ,col =c("black","red","blue"))


dev.off()