plot1 <- function(data=NULL) {
    
    ##Read in the data set
    x <- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na="?")
    x$Time <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
    x$Date <- as.Date(x$Date, "%d/%m/%Y")
    ##We only care about 2/1/07 and 2/2/07
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    x <- subset(x, Date %in% dates)
    
    ##Create a plot as a PNG file
    png("plot1.png", width=480, height=480)
    par(mfrow=c(1,1))
    hist(x$Global_active_power, col="red")
    hist(x$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
    dev.off()
}