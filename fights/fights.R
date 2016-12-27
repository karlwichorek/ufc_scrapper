##################################################################################
## R code to export the figh data to a .csv or .txt from wikipedia.org
## Author:  Preston Vasquez
## Date:  12/27/2016
##################################################################################
ptm <- proc.time()

## Libraries
library(rvest)

## Directory for the project
DIR <- "C:/Users/Preston/Documents/UFCProject"
setwd(DIR)

## wiki sub URL for fights
subURL <- read.table("fightSubURL.txt")
fightSubURL <- subURL$V1

## Function to get the fighter statistics
getFights <- function(pageURL){
## URL for fight statistics
URL <- paste('https://en.wikipedia.org/wiki/', pageURL, sep="")

## Filling table with statistics using rvest syntax
table <- URL %>%  
  read_html %>% 
  html_nodes(xpath = '//*[@id="mw-content-text"]/table[2]') %>% 
  html_table()

## Return data frame
return(data.frame(table))
}

## Defining a dummy data frame to hold the big data
dataset <- data.frame()

## Length of fightSubURL
lenFSU <- length(fightSubURL)

for(i in 1:lenFSU){
  tryCatch({
  temp <- getFights(fightSubURL[i])
  colnames(temp)[1:8] <- c("WC", "F1", "DEF", "F2", "MTHD", 
                           "RND", "TIME", "NOTES")
  dataset <- rbind(dataset, temp)
  colnames(dataset)[1:8] <- c("WC", "F1", "DEF", "F2", "MTHD", 
                              "RND", "TIME", "NOTES")
  Sys.sleep(3)
  }, error = function(e){})
  
  ## output the fight and percentage complete
  print(paste("Importing Fight", i, "with", i/lenFSU*100, "% complete"))
}

## Storing data in a proxy without the notes column
refData <- dataset[,-8]

## Removing all rows that do not pertain to a fight or have a round 
## number
refData$RND <- as.numeric(refData$RND)
refData <- subset(refData, refData$RND != "NA")

## Writing the .csv
write.csv(refData, "fightsData.csv", row.names = F)

## Writing the .txt
write.table(refData, "fightsData.txt",row.names = F, quote = F)

## determinging CPU time
proc.time() - ptm
