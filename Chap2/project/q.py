# -*- coding: utf-8 -*-
import requests
import json
import xlrd

city_book = xlrd.open_workbook( "thinkpage_cities.xls")
city_table = city_book.sheets()[1]
city_name = city_table.col_values(1)
HTY =[]


def find_weather(xinzhi):
    r_url = 'https://api.seniverse.com/v3/weather/now.json'
    r = requests.get(r_url, params = xinzhi).json()
    weatherdata = r['results'][0]['now']
    weathertime = r['results'][0]['last_update'][:-6].replace('T', ' ')
    weatherdata['time'] = weathertime
    return weatherdata

def judge_input(UserInput,xinzhi):
    if UserInput  in city_name:
            foundweather = find_weather(xinzhi)
            Str = "%s 的天气为 %s，温度为%s,更新时间：%s "%(UserInput,foundweather['text'],foundweather['temperature'],foundweather['time'])
            print(Str)
            HTY.append(Str)
    elif UserInput == "help":
            help="""
                输入城市名，查询该城市的天气状况
                输入 help，获取帮助文档
                输入 history，获取查询历史
                输入 quit，退出天气查询
                """
            print(help)
    elif UserInput == "history":
            for h in HTY:
                print(h)
    else:
            print("wrong")

while True:
    print("请输入您要查询的城市")
    UserInput = input(">")
    if UserInput == "quit" : break
    xinzhi = {
  'key': '4to9brumxf9woqhj',
  'location': UserInput,
  'language': 'zh-Hans',
  'unit': 'c'
    }

    judge_input(UserInput,xinzhi)
