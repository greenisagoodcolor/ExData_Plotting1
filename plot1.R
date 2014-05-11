#plot1.R

elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses="character")
elec[, 1] <- paste(elec[, 1], elec[, 2], sep= " ")

require(lubridate)
elec[, 1] <- dmy_hms(elec[, 1])
mar <- with(elec, elec[year(Date) == 2007 &
                         month(Date) == 2 & day(Date) >= 1 & day(Date) <= 2, ])

rm(elec)
mar[, 3] <- as.numeric(mar[, 3])

#plot 1
png(file = "plot1.png", bg = "NA", width=480, height=480)
hist(mar[,3], 
     col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()