t1 <- read.table("household_power_consumption.txt", header = TRUE,sep= ";", nrows=24*60*60)
t2 <- t1[which(t1[,1]=="1/2/2007"),] 
t3 <- t1[which(t1[,1]=="2/2/2007"),] 
rm(t1)
row.names(t2) <- seq(1:dim(t2)[1])
row.names(t3) <- seq(1:dim(t3)[1])
t4 <- rbind(t2,t3)
t4["pastetime"] = NA #create a new column
t4$pastetime = paste(t4$Date, t4$Time, sep=" ") #fill the new column with date and time
t4["strptime"] = NA #create another new column
t4$strptime = strptime(t4$pastetime, "%d/%m/%Y %H:%M:%S") #using strptime function to pastetime for new column


GAP = as.numeric(as.character(t4$Global_active_power))
strptime = t4$strptime

png(file="plot2.png", height= 480, width=480)

plot(strptime, GAP, type= "l",ylab = "Global Active Power(kilowattes)", xlab="")

dev.off()