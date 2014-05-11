#plot 3

elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses="character")
elec[, 1] <- paste(elec[, 1], elec[, 2], sep= " ")

require(lubridate)
elec[, 1] <- dmy_hms(elec[, 1])
mar <- with(elec, elec[year(Date) == 2007 &
                         month(Date) == 2 & day(Date) >= 1 & day(Date) <= 2, ])

rm(elec)
mar[, 3] <- as.numeric(mar[, 3])

#plot 3
par(new=TRUE)
png(file = "plot3.png", bg = "NA", width=480, height=480)
plot(mar[,1], mar[,7], type="n", xlab="", ylab="Energy Sub Metering")
lines(mar[,1], mar[,7], col="black", type="l")
lines(mar[,1], mar[,8], col="red", type="l")
lines(mar[,1], mar[,9], col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), lty="solid", legend=names(mar[7:9]))
dev.off()