##################################################################################
## R code to export the fighter data to a .csv from fightmetric.com
## Author:  Preston Vasquez
## Date:  12/26/2016
##################################################################################

## Libraries
library(XML)

## directory for the project
DIR <- "C:/Users/Preston/Documents/UFCProject"
setwd(DIR)

## Function to get the fighter statistics
getFighters <- function(S){
## URL for fighters statistics 
URL <- paste("http://www.fightmetric.com/statistics/fighters?char=", 
             S, "&page=all", sep ="")

## grab the page -- the table is parsed nicely
tables <- readHTMLTable(URL)

## Ouputing the data frame
return(data.frame(tables))
}

## Initializing big data frame with the first alphabetical input a and b
new <- rbind(getFighters("a"), getFighters("b"))

## Defining a dummy data frame to hold the big data
dataset <- data.frame()

## For loop to cycle through the letters to store fighters alphabetically
for (S in letters){
  temp <- getFighters(S)
  dataset <- rbind(dataset, temp)

  Sys.sleep(3)
}

## Deleting the first nonsense row
dataset <- dataset[-1,]

## Renaming the columns
colnames(dataset)[1] <- c("Fist")
colnames(dataset)[2] <- c("Last")
colnames(dataset)[3] <- c("Nickname")
colnames(dataset)[4] <- c("HT")
colnames(dataset)[5] <- c("WT")
colnames(dataset)[6] <- c("Reach")
colnames(dataset)[7] <- c("Stance")
colnames(dataset)[8] <- c("W")
colnames(dataset)[9] <- c("L")
colnames(dataset)[10] <- c("D")
colnames(dataset)[11] <- c("Belt")

write.csv(dataset, "fighters.csv",row.names=F)
