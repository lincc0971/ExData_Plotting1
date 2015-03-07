
#dowload file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#set work direction to the file by setwd()

t1 <- read.table("household_power_consumption.txt", header = TRUE,sep= ";", nrows=24*60*60) #set max. number of row to load for reducing time  
t2 <- t1[which(t1[,1]=="1/2/2007"),] #day 1 data
t3 <- t1[which(t1[,1]=="2/2/2007"),] #day 2 data
rm(t1) #remove initail table
row.names(t2) <- seq(1:dim(t2)[1]) #rename row name
row.names(t3) <- seq(1:dim(t3)[1]) #rename row name
t4 <- rbind(t2,t3) #row combind

GAP = as.numeric(as.character(t4$Global_active_power)) #factor has to chage to character first and change to numeric


png(file="plot1.png", height= 480, width=480) #open png 

hist(GAP, col= "red", main ="Global Active Power",xlab = "Global Active Power(kilowattes)")

dev.off() #close png
