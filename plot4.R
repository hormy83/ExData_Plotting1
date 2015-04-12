plot4 <- function(data=NULL) {
    
    ##Read in the data set
    x <- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na="?")
    x$Time <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
    x$Date <- as.Date(x$Date, "%d/%m/%Y")
    ##We only care about 2/1/07 and 2/2/07
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    x <- subset(x, Date %in% dates)
    
    ##Create a plot as a PNG file
    png("plot4.png", width=480, height=480)
    
    par(mfrow=c(2,2))
    ## Make the first one
    with(x, plot(Time, Global_active_power, xlab="", ylab="Global Active Power", type="n"))
    with(x, lines(Time, Global_active_power))
    
    ## Make the second one
    with(x, plot(Time, Voltage, xlab="datetime", ylab="Voltage", type="n"))
    with(x, lines(Time, Voltage))
    
    ## Make the third one    
    with(x, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
    with(x, lines(Time, Sub_metering_1))
    with(x, lines(Time, Sub_metering_2, col="red"))
    with(x, lines(Time, Sub_metering_3, col="blue"))
    legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3') , lty=1, col=c('black', 'red', 'blue'), bty="n")
    
    ## Make the forth one
    with(x, plot(Time, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n"))
    with(x, lines(Time, Global_reactive_power))
    
    dev.off()
}