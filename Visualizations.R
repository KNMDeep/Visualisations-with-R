#Libararies needed for a proper wordcloud
library(wordcloud)
library(ggplot2)
library(tm)
library(plotrix)

#Before you start generating a wordcloud, check for the working directory
getwd()

#Read the dataframe in.
Data <- read.csv("WC.csv")
#select the column that contains text(usually, select the column that needs a wordcloud)
Data <- Data$text

#The following script will help in cleaning the text. 
Data <- Corpus(VectorSource(Data))
Data <- tm_map(Data, removePunctuation)
Data <- tm_map(Data, function(x)removeWords(x,stopwords("english")))
Data <- tm_map(Data, removeNumbers)
Data <- tm_map(Data, PlainTextDocument)
Data <- tm_map(Data, tolower)

#Wordcloud
wordcloud(Data, min.freq = 25, max.words = 100, colors = brewer.pal(5, "Dark2"), random.color = T)


#Pie
Pie <- read.csv("PC.csv")
pie(Pie$Percentage, Pie$Device, main = "Percentage of Phone Users")
pie3D(Pie$Percentage, labels=Pie$Device, explode=0.1, main = "Percentage of Phone Users")

#Bar
barplot(Pie$Percentage, names.arg = Pie$Device)

#histogram
hist(Pie$Percentage, names.arg = Pie$Device, col = "blue")
