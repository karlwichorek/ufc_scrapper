# ufcProject
We want to export data from the website fightmetric.com to predict the outcome of UFC fights.

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
