## Exploratory Data Analysis - Course Project 1

# download and unzip power consumption file - note: separator is a ;
# note, I am not uploading/committing the 20mb file to the github repository
# I also save the subset as an rds file to load between output files
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, 
              method="curl", mode="wb")
unzip(temp, "household_power_consumption.txt")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert power Date and Time to a datetime POSIX variable
# note, character format for date in file is dd/mm/yyyy
power$datetime <- with(power, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# subset to the two desired dates: 2007-02-01 and 2007-02-02 and remove NAs
power <- power[power$datetime >= "2007-02-01 00:00:00" & power$datetime <= "2007-02-02 23:59:59",]
power <- power[complete.cases(power),]

# save power as an RData file to import for the future plots
saveRDS(power, file="power.rds")

# plot 1
png(file = "plot1.png")
hist(power$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)")

# close graphics device
dev.off()