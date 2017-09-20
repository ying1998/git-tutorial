f = open('weather_info.txt',"r", encoding = "utf-8")
cityweather = f.readline()
CWdic={}

while  cityweather != '':
    CWlist = cityweather.split(",")
    city1=CWlist[0]
    weather1=CWlist[1]
    CWdic[city1] = weather1
    cityweather = f.readline()

f.close()

help="""
    输入城市名，查询该城市的天气状况
    输入 help，获取帮助文档
    输入 history，获取查询历史
    输入 quit，退出天气查询
    """
CWdic['help'] = help

HTY =[]

def find_city(themap,sky):
    if sky in themap:
        return themap[sky]
    else:
        return "Not found"

def foundcity(themap,sky):
    city_found = find_city(CWdic,sky)
    if sky == 'help':
        print(city_found)
    elif sky == 'history':
        for h in HTY:
            print(h)
    else:
        print("%s 的天气状况为" %sky ,city_found)
        HTY.append("%s %s"%(sky,city_found))

while True:
    print("请输入指令或您要查询的城市名")
    sky = input("> ")
    if  sky =='quit' : break

    foundcity(CWdic,sky)
