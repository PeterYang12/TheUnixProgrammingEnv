# 第五章 shell编程

shell满足：

- 交互式执行命令
- 编成运行命令

编程重要原则：

- 提高程序健壮性，能处理不正确输入
- 运行错误时，给出有用的提示信息

## 5.1 定制cal命令

```
$ cal
$ cal 10 2022
# 假设不支持如下指令，如何拓展？
$ cal October 2022
```

**只改变用户接口，不需要改动cal程序本身**

- cal可通过名字识别月份 -> 月份转换成数字
- 无参数 -> 只打印当月的月历
- 一个参数，且为月份 -> 打印当年相应月份的月历
- 一个参数，且为年份 -> 打印当年的月历
- 两个参数

```shell
$ ./cal.sh Feb 2000

#!/usr/bin/env bash
#cal: nicer interface to /usr/bin/cal
set -e

case $# in
        0) set `date`; m=$3; y=$4 ;; #'date'=$(date);;
        1) m=$1; y=$(date|awk '{print $4}');;
        *) m=$1; y=$2;;
esac

case $m in
        jan*|Jan*)      m=1 ;;
        feb*|Feb*)      m=2 ;;
        mar*|Mar*)      m=3 ;;
        apr*|Apr*)      m=4 ;;
        may*|May*)      m=5 ;;
        jun*|Jun*)      m=6 ;;
        jul*|Jul*)      m=7 ;;
        aug*|Aug*)      m=8 ;;
        sep*|Sep*)      m=9 ;;
        oct*|Oct*)      m=10;;
        nov*|Nov*)      m=11;;
        dec*|Dec*)      m=12;;
        [1-9] | 10 | 11 | 12 );;
        *)      y=$m; m="";;
esac

#echo month $m
#echo year $y

/usr/bin/cal $m $y
```



## which 命令

```
echo $PATH|sed 's/^:/.:/
> s/::/:.:/g
> s/:$/:./
> s/:/ /g'
```

 