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
png("plot2.png", width = 480, height = 480)

plot(df_new2$Global_active_power~df_new2$dt, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()



