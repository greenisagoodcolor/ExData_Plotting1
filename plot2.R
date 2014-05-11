#plot 2

elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses="character")
elec[, 1] <- paste(elec[, 1], elec[, 2], sep= " ")

require(lubridate)
elec[, 1] <- dmy_hms(elec[, 1])
mar <- with(elec, elec[year(Date) == 2007 &
                         month(Date) == 2 & day(Date) >= 1 & day(Date) <= 2, ])

rm(elec)
mar[, 3] <- as.numeric(mar[, 3])

#plot 2
png(file = "plot2.png", bg = "NA", width=480, height=480)
plot(mar[,1], mar[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(mar[,1], mar[,3])
dev.off()
