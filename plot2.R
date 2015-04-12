plot2 <- function(data=NULL) {
    
    ##Read in the data set
    x <- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na="?")
    x$Time <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
    x$Date <- as.Date(x$Date, "%d/%m/%Y")
    ##We only care about 2/1/07 and 2/2/07
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    x <- subset(x, Date %in% dates)
    
    ##Create a plot as a PNG file
    png("plot2.png", width=480, height=480)
    par(mfrow=c(1,1))
    with(x, plot(Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
    with(x, lines(Time, Global_active_power))
    dev.off()
}