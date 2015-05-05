## Exploratory Data Analysis - Course Project 1

# read in subset to dataframe power (see plot1.R for details)
power <- readRDS("power.rds")

# plot 2
png(file = "plot2.png")
with(power, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# close graphics device
dev.off()