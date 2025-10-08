## Calculate the average duration of storms in each year

### Data Source.

```
> attributes(storms)
$names
 [1] "name"                         "year"                         "month"                        "day"                         
 [5] "hour"                         "lat"                          "long"                         "status"                      
 [9] "category"                     "wind"                         "pressure"                     "tropicalstorm_force_diameter"
[13] "hurricane_force_diameter"    

$row.names
   [1]    1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24   25   26   27   28
  [29]   29   30   31   32   33   34   35   36   37   38   39   40   41   42   43   44   45   46   47   48   49   50   51   52   53   54   55   56
  [57]   57   58   59   60   61   62   63   64   65   66   67   68   69   70   71   72   73   74   75   76   77   78   79   80   81   82   83   84
  [85]   85   86   87   88   89   90   91   92   93   94   95   96   97   98   99  100  101  102  103  104  105  106  107  108  109  110  111  112
 [113]  113  114  115  116  117  118  119  120  121  122  123  124  125  126  127  128  129  130  131  132  133  134  135  136  137  138  139  140
...

> str(storms)
tibble [19,537 × 13] (S3: tbl_df/tbl/data.frame)
 $ name                        : chr [1:19537] "Amy" "Amy" "Amy" "Amy" ...
 $ year                        : num [1:19537] 1975 1975 1975 1975 1975 ...
 $ month                       : num [1:19537] 6 6 6 6 6 6 6 6 6 6 ...
 $ day                         : int [1:19537] 27 27 27 27 28 28 28 28 29 29 ...
 $ hour                        : num [1:19537] 0 6 12 18 0 6 12 18 0 6 ...
 $ lat                         : num [1:19537] 27.5 28.5 29.5 30.5 31.5 32.4 33.3 34 34.4 34 ...
 $ long                        : num [1:19537] -79 -79 -79 -79 -78.8 -78.7 -78 -77 -75.8 -74.8 ...
 $ status                      : Factor w/ 9 levels "disturbance",..: 7 7 7 7 7 7 7 7 8 8 ...
 $ category                    : num [1:19537] NA NA NA NA NA NA NA NA NA NA ...
 $ wind                        : int [1:19537] 25 25 25 25 25 25 25 30 35 40 ...
 $ pressure                    : int [1:19537] 1013 1013 1013 1013 1012 1012 1011 1006 1004 1002 ...
 $ tropicalstorm_force_diameter: int [1:19537] NA NA NA NA NA NA NA NA NA NA ...
 $ hurricane_force_diameter    : int [1:19537] NA NA NA NA NA NA NA NA NA NA ...

```

The problem is "Create a line plot that shows the average duration of storms overtime.  x-axis should be the year and the y-axis should be average storm duration."

To get the averge duration, we need to firstly get the duration of each storm.

There are two ways to calculate a new col duration based on existing cols.  If we look at col hour, seems the sample interval is 6-hour.  So we can count the rows with the same name and year, and multiple 6h to get the during in that year.
Another way to calculate duration is to calculate by time difference.  This way seems more safe.


```
> a<- storms %>% mutate(datetime = ymd_h(paste(year, month, day, hour,sep = "-"))) %>% group_by(name, year) %>% summarise(duration_h = as.numeric(difftime(max(datetime), min(datetime), units = "hour")), .groups = "drop") %>% group_by(year) %>% summarise(avg_d = mean(duration_h, na.rm = TRUE))
> 
> a
# A tibble: 48 × 2
    year avg_d
   <dbl> <dbl>
 1  1975  172.
 2  1976  183.
 3  1977  100 
 4  1978  121.
 5  1979  237 
 6  1980  177.
 7  1981  170.
 8  1982  127.
 9  1983  122.
10  1984  164.
# ℹ 38 more rows
# ℹ Use `print(n = ...)` to see more rows
```


