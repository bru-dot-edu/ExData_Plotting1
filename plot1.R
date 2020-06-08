#R code for plot1.png
file <- "household_power_consumption 2.txt"
df <- read.table(file, header = TRUE, sep = ';', na.strings = "?")

#explore the dataset
dim(df)
head(df)
str(df)

#convert dates and subset the dataframe
df$Date <- as.Date(df$Date, tryFormats = c("%d/%m/%Y"))
df_new <- subset(df, df$Date >= '2007-02-01')
df_new2 <- subset(df_new, df_new$Date <= '2007-02-02')

#save histogram as png
png("plot1.png", width = 480, height = 480)
hist(df_new2$Global_active_power, 
     main = "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()



