install.packages("tidyquant")
install.packages("tidyverse")
options("getSymbols.warning4.0"=FALSE)
options("getSymbols.yahoo.warning"=FALSE)
library(tidyquant)
library("tidyverse")

tickers = c("ISF.L", "DAX")
# DJI + SPY
#ISF.L = FTSE 100 ETF + DAX = German ETF

getSymbols(tickers,
           from = "2017-01-01",
           to = "2019-01-15")

prices<- map(tickers,function(x) Ad(get(x)))
prices <- reduce(prices,merge)
colnames(prices) <- tickers
head(prices)
tick <- fortify(prices)
ggplot(data = tick, mappin = aes(x = DAX, y = ISF.L))+geom_point()+geom_smooth()


prices %>%
group_by(symbol) %>%
slice(1)

