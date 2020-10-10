library(dataiku)
library(forecast)
library(dplyr)

install.packages("dataiku")

setwd("C:/HK")
df = read.csv("Book1.csv")

head(df)

ts_passengers = ts(df$SeaLevel,
                   start=1954,end = 2017, frequency=1)
plot(ts_passengers)


m_ets = ets(ts_passengers)
f_ets = forecast(m_ets, h=30) # forecast 24 months into the future
write.csv(f_ets, "book_2.csv")
plot(f_ets)