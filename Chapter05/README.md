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
$ ./cal.sh
$ ./cal.sh $year
$ ./cal.sh $month
$ ./cal.sh January 2022
$ ./cal.sh 1 2022
```



## 5.2 which 命令

```shell
$ echo $PATH

$ echo $PATH|sed 's/^:/.:/
  s/::/:.:/g
  s/:$/:./
  s/:/ /g'
  
E.G.
$ ./which.sh
$ ./which.sh hello
$ ./which.sh which
```



## 5.3 while until

##### for

```
for i in 文件列表
do
	循环体， $i依次取表中的元素值
done

for i #隐含地表示对shell文件的全部参数，即$*
	do
		ehco "hello"
	done
```

##### while

```
while commands
do
	循环体，命令返回状态为为，真，继续执行
done
```

##### until

```
until commands
do
	循环体，命令返回状态为为，假，继续执行
done
```

#### watchfor

```
$ ./watchfor3.sh peter

# login while running, then output
$ ./watchwho.sh 
```



## 5.4 trap捕获中断

- 按DEL键，**中断**信号发送给终端上正在运行的所有进程
- 挂断电话线，传送一个**挂断**信号

除非程序有专门处理中断信号的措施，否则，中断信号将一律终止程序的运行。

若是中断信号，后台运行的进程（使用&运行）能够得到保护，但如果是挂断信号，得不到保护。

```
kill -l
```

trap，能够生成中断信号发生时所要执行的命令序列，trap is a shell builtin 

```
trap 命令序列 信号值
```

命令序列是一个单一参数，一般用引号括起来，信号值是小整数，用于标识中断信号

```
...
trap 'rm -f FILE; exit 1' 1 2 15
while :
...
```





## overwrite 改写文件

```
$ sort file1 -o file2
$ sort file1 > file2
```

file1和file2是同一个文件，重定向符号>在排序之前就已经把输入文件截断。 加上-o选项的命令能正常工作，因为在输出文件建立之前，sort将输入排序并存放在一个临时文件中。

设计overwrite程序

```
./replace.sh sa yyh tmp2
```



## zap: 使用名字终止进程

ps命令得到进程标识符，再把它作为kill的参数输入，终止后台进程

终止进程是危险操作，保险方法：交互地运行zap命令，用pick命令选择要终止的进程

pick功能：pick顺次打印每个参数，并请求用户响应，用户响应为y才打印

```
./zap2.sh python

./pick.sh "shj sajds" dsjk
```





## pick命令：空格和参数--deprecated

read从标准输入读入一行文本，并把读到的文本（不含换行）赋给命名变量，常用于注册时，在.profile文件里设置环境

```
$ read greating
hello, yyh
$ echo $greating
```

## select

```
select 变量名 in 列表
do
	break
done
```



## news

