install.packages('TSstudio')
library('TSstudio')

file_url <-
  "https://raw.githubusercontent.com/PacktPublishing/Hands-On-Time-Se
ries-Analysis-with-R/master/Chapter%201/TOTALNSA.csv"

df1 <- read.csv(file = file_url, stringsAsFactors = FALSE)

class(df1)

str(df1)