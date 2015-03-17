#dowload file form https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
#to your work direction
library(ggplot2)

NEI =  readRDS("summarySCC_PM25.rds")
Baltimore = NEI[which(NEI$fips=="24510"),]
Baltimore_1999 = subset(Baltimore, year ==1999, select = c(year, Emissions,type))
Baltimore_2002 = subset(Baltimore, year ==2002, select = c(year, Emissions,type))
Baltimore_2005 = subset(Baltimore, year ==2005, select = c(year, Emissions,type))
Baltimore_2008 = subset(Baltimore, year ==2008, select = c(year, Emissions,type))
list_type = unique(Baltimore$type)

each_sum_1999 = c(sum(with(Baltimore_1999, subset(Emissions, type==list_type[1]))),
                  sum(with(Baltimore_1999, subset(Emissions, type==list_type[2]))),
                  sum(with(Baltimore_1999, subset(Emissions, type==list_type[3]))),
                  sum(with(Baltimore_1999, subset(Emissions, type==list_type[4]))))
each_sum_2002 = c(sum(with(Baltimore_2002, subset(Emissions, type==list_type[1]))),
                  sum(with(Baltimore_2002, subset(Emissions, type==list_type[2]))),
                  sum(with(Baltimore_2002, subset(Emissions, type==list_type[3]))),
                  sum(with(Baltimore_2002, subset(Emissions, type==list_type[4]))))
each_sum_2005 = c(sum(with(Baltimore_2005, subset(Emissions, type==list_type[1]))),
                  sum(with(Baltimore_2005, subset(Emissions, type==list_type[2]))),
                  sum(with(Baltimore_2005, subset(Emissions, type==list_type[3]))),
                  sum(with(Baltimore_2005, subset(Emissions, type==list_type[4]))))
each_sum_2008 = c(sum(with(Baltimore_2008, subset(Emissions, type==list_type[1]))),
                  sum(with(Baltimore_2008, subset(Emissions, type==list_type[2]))),
                  sum(with(Baltimore_2008, subset(Emissions, type==list_type[3]))),
                  sum(with(Baltimore_2008, subset(Emissions, type==list_type[4]))))

each_sum_all = c(each_sum_1999,each_sum_2002,each_sum_2005,each_sum_2008)

types = c(rep(list_type,4))
years = c(rep(1999,4),rep(2002,4), rep(2005,4), rep(2008,4))

X = data.frame(years, each_sum_all, types)


png(file="plot3.png")
qplot(years, each_sum_all, data = X, color= types,xlab = "year", ylab = "tons",
      geom =c("point", "smooth"),main = "Total emissions of each type in Baltimore",
      method = "loess")

dev.off()