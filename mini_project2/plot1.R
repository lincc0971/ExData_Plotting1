#dowload file form https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
#to your work direction

NEI =  readRDS("summarySCC_PM25.rds")

years = c("1999","2002","2005","2008")
total_emission = 
    c(sum(NEI$Emissions[which(NEI$year==1999)]),
      sum(NEI$Emissions[which(NEI$year==2002)]),
      sum(NEI$Emissions[which(NEI$year==2005)]),
      sum(NEI$Emissions[which(NEI$year==2008)]))
png(file="plot1.png")

plot(years, total_emission, type = "o", main = "Total emissions", 
     xlab = "year", ylab = "tons", col = "red")

dev.off()
