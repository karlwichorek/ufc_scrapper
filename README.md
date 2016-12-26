# ufcProject
We want to export data from the website fightmetric.com to predict the outcome of UFC fights.

## fighters.R
This is the code used to pull a comprehensive list of fighters.  The data ran on 26 December 2016 resulted in a list of 2841 fighters.  Using the `proc.time()` function, the real CPU time to compile the code was 113.63 seconds:
```R
> ptm <- proc.time()
...
> proc.time() - ptm
   user  system elapsed 
   2.92    0.02  113.63 
```
