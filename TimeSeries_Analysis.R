library(dataiku)
library(forecast)
library(dplyr)

install.packages("dataiku")

setwd("C:/workdir") # set working directory
df = read.csv("Book1.csv")  # read any data as in dataframe

head(df) # check data formatimg

# pass the start, end and the frequency to perform the time series analysis
ts_passengers = ts(df$passengers,
                   start=1954,end = 2017, frequency=1)
plot(ts_passengers)

m_ets = ets(ts_passengers)
f_ets = forecast(m_ets, h=30) # forecast 24 months into the future
write.csv(f_ets, "book_2.csv")
plot(f_ets) # plot the result
