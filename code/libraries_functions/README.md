Setting up paths for packages and functions
---
The following lines are code extracs to call either 
(i) nonlinearTseries packages or 
(ii) different R functions.

# nonlinearTseries 

```
################################################################################
# (0) Defining paths for main_path, r_scripts_path, ..., etc.
homepath <- Sys.getenv("HOME")
setwd("../../../")
github_repo_path <- getwd()
libfun_path <- '/code/libraries_functions'
library(devtools)
load_all(paste(github_repo_path, libfun_path, '/nonlinearTseries', sep=""))
```


# cao97 

**NOTE1** Remember to source the `cao97_functions.R` and `cao97sub.so`
**NOTE2** Becareful with github path as it is defined to be in the Desktop

## cao97_functions.R

set up `cao97sub.so` 
at `/code/libraries_functions/rfunctions/embedding_parameters/withCao1997/cao97_functions.R`


```
#### Setting up paths
homepath <- Sys.getenv("HOME")
github_path <- '/Desktop/srep2020'
path_cao97sub_so <- '/code/libraries_functions/rfunctions/embedding_parameters/withCao1997/cao97sub.so'
    dyn.load( paste(homepath, github_path, path_cao97sub_so, sep='') )
```



# mutual information
```
cd $HOME/ ... /code/libraries_functions/rfunctions/embedding_parameters/mututalInformation 
./minfo datafile -b 100 -t 100 > r.mi

R
> source(paste(getwd(),"/comparison-2methods.R", sep=""), echo=TRUE)
> source(paste(getwd(),"/comparison-3methods.R", sep=""), echo=TRUE)
```






# `extra_rqa.R`


```
## LOADING FUNCTIONS
#github_path <- getwd()
#libfun_path <- '/code/libraries_functions'
#rfunctions_extra_rqa_R <- '/rfunctions/extra_rqa.R'

#### Calling `functions_extra_nonlinearTseries` 
#source( paste(github_repo_path, libfun_path, rfunctions_extra_rqa_R , sep='') )
```




# `ollin_cencah.R` 



```
github_repo_path <- getwd()
libfun_path <- '/code/libraries_functions'
rfunctions_ollin_cencah_R <- '/rfunctions/ollin_cencah.R'

### Calling `functions_ollin_cencah` 
source( paste(github_repo_path, libfun_path, rfunctions_ollin_cencah_R, sep='') )
```




