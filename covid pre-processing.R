library(dplyr)
library(sqldf)

df = read.csv("covid_19_data.csv")
head(df)

df1 = tapply(df$Confirmed, df$ObservationDate, FUN = sum)
df2 = tapply(df$Deaths, df$ObservationDate,FUN = sum)
df3 = tapply(df$Recovered, df$ObservationDate,FUN = sum)

df4 = data.frame(unique(df$ObservationDate), df1, df2, df3)
names(df4)[2] = 'Confirmed'
names(df4)[3] = "Deaths"
names(df4)[4] = "Recovered"
names(df4)[1] = "ObservationDate"
write.csv(x=df4, file = "covid.csv")
