f 作用：打开文档，并实现中文交互 ， 字母"r"：可读

CWdic={} 建立一个字典
```
 cityweather = f.readline()

while  cityweather != '':
    CWlist = cityweather.split(",")
    city1=CWlist[0]
    weather1=CWlist[1]
    CWdic[city1] = weather1
    cityweather = f.readline()

f.close()
```

先读取文件的首行，然后判断文件是否为空，直至读取文件完全。
``
CWlist = cityweather.split(",")
``
可以分开 “北京，晴” 为“北京”   “晴”
