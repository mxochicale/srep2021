


# Create global paths to call the following functions and files


* [ ] nonlinearTseries

```
homepath <- Sys.getenv("HOME")
#message( 'homepath: ',   homepath )
main_home_path <- '/quetzalcoalt'

library(devtools)
load_all( paste(homepath, main_home_path, '/nonlinearTseries', sep='' ))
```

added: Wed Feb 20 12:25:58 GMT 2019




`source(paste(getwd(),"/B_ami.R", sep=""), echo=TRUE)`
`source(  paste( getwd(), '/Ca_rp_aH.R', sep=''), echo=TRUE )`
`source(  paste( getwd(), '/Cb_rp_aV.R', sep=''), echo=TRUE )`





* [ ] cao97sub.so


```
#### testing path
homepath <- Sys.getenv("HOME")
#message( 'homepath: ',   homepath )
repo_paths <- '/quetzalcoalt/srep2019'

    dyn.load( paste(homepath, repo_paths, '/code/rfunctions/embedding_parameters/withCao1997/cao97sub.so', sep='') ) 
```


added: Wed Feb 20 12:25:58 GMT 2019
