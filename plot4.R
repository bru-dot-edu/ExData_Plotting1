
#R code for plot1.png
file <- "household_power_consumption 2.txt"
df <- read.table(file, header = TRUE, sep = ';', na.strings = "?")
df$dt <- with(df, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
df$Date <- as.Date(df$Date, tryFormats = c("%d/%m/%Y"))
df_new <- subset(df, df$Date >= '2007-02-01')
df_new2 <- subset(df_new, df_new$Date <= '2007-02-02')

#explore the dataset
dim(df)
head(df)
str(df)

#save histogram as png
png("plot4.png", width = 480, height = 480)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(df_new2$Global_active_power~df_new2$dt, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(df_new2$Voltage~df_new2$dt, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(df_new2$dt, 
     df_new2$Sub_metering_1,
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(df_new2$dt, 
      df_new2$Sub_metering_2,
      col = "red")
lines(df_new2$dt, 
      df_new2$Sub_metering_3,
      col = "blue")
legend(lty=1, 
       "topright", 
       col=c("black", "red", "blue"),  
       legend=c("Sub_metering_1", 
                "Sub_metering_2", 
                "Sub_metering_3"))

plot(df_new2$Global_reactive_power~df_new2$dt, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_relative_power")

dev.off()



