#dowload file form https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
#to your work direction

NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")

SCC_coal = SCC$SCC[grep("Coal",SCC$EI.Sector)]

NEI_coal=NEI[which(NEI$SCC %in% SCC_coal), c("year", "Emissions", "SCC")]

years = c("1999","2002","2005","2008")
coal_emissions_in_USA = c(sum(subset(NEI_coal, year ==1999, select= Emissions)),
                          sum(subset(NEI_coal, year ==2002, select= Emissions)),
                          sum(subset(NEI_coal, year ==2005, select= Emissions)),
                          sum(subset(NEI_coal, year ==2008, select= Emissions))
                          )
png(file="plot4.png")
plot(years, coal_emissions_in_USA, type = "o", main = "Coal Emissions in USA", 
     xlab = "year", ylab = "tons", col = "red")

dev.off()
