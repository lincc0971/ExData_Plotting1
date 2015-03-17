#dowload file form https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
#to your work direction

NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")

SCC_vehicle = SCC$SCC[grep("Vehicle",SCC$EI.Sector)]

Baltimore = subset(NEI, fips == "24510")
Baltimore_vehicle = Baltimore[which(Baltimore$SCC %in% SCC_vehicle),]

years = c("1999","2002","2005","2008")
Baltimore_veh_emission = 
  c(sum(subset(Baltimore_vehicle, year == 1999, select = Emissions)),
    sum(subset(Baltimore_vehicle, year == 2002, select = Emissions)),
    sum(subset(Baltimore_vehicle, year == 2005, select = Emissions)),
    sum(subset(Baltimore_vehicle, year == 2008, select = Emissions)))

png(file="plot5.png")
plot(years, Baltimore_veh_emission, type = "o", 
     main = "Vehicles Emissions in Baltimore", 
     xlab = "year", ylab = "tons", col = "red")
dev.off()