#dowload file form https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
#to your work direction

NEI =  readRDS("summarySCC_PM25.rds")
Baltimore = NEI[which(NEI$fips=="24510"),]

years = c("1999","2002","2005","2008")
total_emission = 
  c(sum(Baltimore$Emissions[which(Baltimore$year==1999)]),
    sum(Baltimore$Emissions[which(Baltimore$year==2002)]),
    sum(Baltimore$Emissions[which(Baltimore$year==2005)]),
    sum(Baltimore$Emissions[which(Baltimore$year==2008)]))

png(file="plot2.png")
plot(years, total_emission, type = "o", main = "Total emissions in Baltimore",
     xlab = "year", ylab = "tons", col = "red",
     xlim = c(1999, 2008))

dev.off()