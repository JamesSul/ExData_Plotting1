## Exploratory Data Analysis - Course Project 1

# read in subset to dataframe power (see plot1.R for details)
power <- readRDS("power.rds")

# plot 4
png(file = "plot4.png")
par(mfrow=c(2,2))

# top left plot
with(power, plot(datetime, Global_active_power, type="l", xlab = "", ylab="Global Active Power"))

# top right plot
with(power, plot(datetime, Voltage, type="l"))

#bottom left plot
with(power, plot(datetime, Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering"))
with(power, lines(datetime, Sub_metering_1))
with(power, lines(datetime, Sub_metering_2, col="red"))
with(power, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "blue", "red"), bty="n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# bottom right plot
with(power, plot(datetime, Global_reactive_power, type="l"))

# close graphics device
dev.off()

# reset environment
par(mfrow=c(1,1))
