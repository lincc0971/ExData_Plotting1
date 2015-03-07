t1 <- read.table("household_power_consumption.txt", header = TRUE,sep= ";", nrows=24*60*60)
t2 <- t1[which(t1[,1]=="1/2/2007"),]
t3 <- t1[which(t1[,1]=="2/2/2007"),]
rm(t1)
row.names(t2) <- seq(1:dim(t2)[1])
row.names(t3) <- seq(1:dim(t3)[1])
t4 <- rbind(t2,t3)
t4["pastetime"] = NA #create a new column
t4$pastetime = paste(t4$Date, t4$Time, sep=" ") #fill the new column
t4["strptime"] = NA #create another new column
t4$strptime = strptime(t4$pastetime, "%d/%m/%Y %H:%M:%S") #using strptime function to pastetime for new column

strptime = t4$strptime
GAP = as.numeric(as.character(t4$Global_active_power))
s1 = as.numeric(as.character(t4$Sub_metering_1))
s2 = as.numeric(as.character(t4$Sub_metering_2))
s3 = as.numeric(as.character(t4$Sub_metering_3))
voltage = as.numeric(as.character(t4$Voltage))
GRP = as.numeric(as.character(t4$Global_reactive_power))




png(file="plot4.png", height= 480, width=480)
#the par function should be after png function
par(mfrow=c(2,2)) # create 2X2 window
#1 fig.
plot(strptime, GAP, type= "l",ylab = "Global Active Power", xlab="")

#2 fig.
plot(strptime, voltage, type= "l",ylab = "Voltage", xlab="datetime")

#3 fig.
plot(strptime, s1, type= "l",ylab = "Energy sub metering", xlab="")
lines(strptime, s2, col = "red") #add line to fig.3
lines(strptime, s3, col = "blue") #add another line to fig.3
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 ,col=c("black","red","blue"))

#4 fig
plot(strptime, GRP, type= "l",ylab = "Global_reactive_power", xlab="datetime")

dev.off()