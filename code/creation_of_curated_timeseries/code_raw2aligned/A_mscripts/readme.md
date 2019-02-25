rawData_TO_TimeAlignedDataForSeparateActivitiesNN_p01_to_p22_octave_linux
---
## testing scripts, files and dependnecies

```
cd ..;
cd ..;
main_path = pwd;

```

```
octave --no-gui
```

Then run the m script:

```
test_hri_readrawdata
```

plot four time series


# Setting Up Paths

Set the paths where data is going to be saved and
check carefully where does the following paths are well defined.
```
cd ..;
cd ..;
main_path = pwd;
cd ..;
cd ..;
cd ..;
user_path = pwd;


data_path='/data_raw_p01-p22'
tmpdatapath='/tmp/phdtmpdata';
```





# Usage


## 1. create /tmp for data output
```
cd && mkdir -p tmp/phdtmpdata
```

## 2. Open a new terminal to run octave
```
octave --no-gui
```

Then run the m script:

```
A_hri_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux
```

output

```
data_path = /data_raw_p01-p22
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p01-HRI//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p02-HRI//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p03-HRI//')
  [2,1] = 0
}
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0


```



## 3. outcome data path


```
/home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux 
```

```
:~/tmp/phdtmpdata$ tree -d
.
└── time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux
    ├── p01-HRI
    ├── p02-HRI
    ├── p03-HRI
    ├── p04-HRI
    ├── p05-HRI
    ├── p06-HRI
    ├── p07-HRI
    ├── p08-HRI
    ├── p09-HRI
    ├── p10-HRI
    ├── p11-HRI
    ├── p12-HRI
    ├── p13-HRI
    ├── p14-HRI
    ├── p15-HRI
    ├── p16-HRI
    ├── p17-HRI
    ├── p18-HRI
    ├── p19-HRI
    ├── p20-HRI
    ├── p21-HRI
    └── p22-HRI

23 directories


```






