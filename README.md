# ufcProject
We want to export data from the websites fightmetric.com and wikipedia.com to predict the outcome of UFC fights.

## fighters Folder

### fighters.R
This is the code used to pull a comprehensive list of fighters.  The data ran on 26 December 2016 resulted in a list of 2841 fighters.  Using the `proc.time()` function, the real CPU time to compile the code was 106.66 seconds:
```R
> ptm <- proc.time()
...
> proc.time() - ptm
   user  system elapsed 
   3.03    0.05  106.66 
```
### fightersData.txt
This is the data pulled from the most recent fighters.R run.

## fights folder

### fights.R
This is the code used to scrape a semi-comprehensive list of fights from wikipedia.  For this, we use the library `rvest` and pull data from https://en.wikipedia.org/wiki/ with the final part of the URL being imported by an exaustive .txt list of the fight sub-URL.  This method requires us to export an xpath from the HTML of each fight page of wikipedia, which will cause a long runtime.  Then we poor the data through a for loop centered around the `getFights()` function to fill a dummy data frame.  

Overall, the `proc.time()` function reveals that the real CPU time on my machine took 1120.67 seconds to compile:
```R
> proc.time() - ptm
   user  system elapsed 
  32.99   31.66 1120.67
```

#### `tryCatch({})` for the for loop
Some of the fights do not import properly (around 11/374).  There is no way to know which fights will cause an error, and, rather than risk termintating the for loop, we use the `tryCatch({})` function to skip the fights with errors.  


### fightersData.txt
We scrape our data from wikipedia.com, and so the variables are limited to:  fighter 1, fighter 2, method used to win, the round number, and the time.  By design, fighter 1 is always the victor / draw.  Later refiniment to the data will be made.

### fightSubURL.txt
This is the sub URL data for the .../wiki/... URL.  It is needed to compile fights.R.
