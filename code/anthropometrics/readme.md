


# 20 participants

```
datafilename <- 'data_20p.csv'
```


```
> source( paste( getwd(), '/computing_statistics.R' ,sep='' ), echo=TRUE )
```


output
```

> summary(all_pNNanthropometric)
 Participant           Gender               Age        Handeness        
 Length:20          Length:20          Min.   :19.0   Length:20         
 Class :character   Class :character   1st Qu.:19.0   Class :character  
 Mode  :character   Mode  :character   Median :19.0   Mode  :character  
                                       Mean   :19.8                     
                                       3rd Qu.:20.0                     
                                       Max.   :25.0                     
 MusicTraining      RightArmLenght      Height          weight     
 Length:20          Min.   :47.00   Min.   :161.0   Min.   :48.00  
 Class :character   1st Qu.:50.75   1st Qu.:168.0   1st Qu.:60.88  
 Mode  :character   Median :52.50   Median :179.0   Median :73.70  
                    Mean   :53.45   Mean   :176.8   Mean   :72.87  
                    3rd Qu.:56.50   3rd Qu.:182.0   3rd Qu.:84.03  
                    Max.   :61.00   Max.   :196.0   Max.   :98.00  

> m <- mean(all_pNNanthropometric$Age)

> sd <- sd(all_pNNanthropometric$Age)

> message('mean age: ', m, '   SD age: ' , sd)
mean age: 19.8   SD age: 1.39924791829115

```





