from flask import Flask
from flask import render_template
from flask import request
import requests
import json
import xlrd

city_book = xlrd.open_workbook( "thinkpage_cities.xls")
city_table = city_book.sheets()[1]
city_name = city_table.col_values(1)
HTY =[]


def find_weather(city):
    xinzhi = {
    'key': '4to9brumxf9woqhj',
    'location': city,
    'language': 'zh-Hans',
    'unit': 'c'
    }
    r_url = 'https://api.seniverse.com/v3/weather/now.json'
    r = requests.get(r_url, params = xinzhi).json()
    weatherdata = r['results'][0]['now']
    weathertime = r['results'][0]['last_update'][:-6].replace('T', ' ')
    weatherdata['time'] = weathertime
    return weatherdata

app = Flask(__name__)

@app.route("/" )
def index():
    # return url_for('static',filename='body.html')
    return render_template("body.html")
@app.route("/cityname")
def search_request():
    if request.args.get('help')=="帮助":
        return render_template("help.html")
    elif request.args.get('query')=="查询":
        city = request.args.get('city')
        if city  in city_name:
                foundweather = find_weather(city)
                Str = "%s 的天气为 %s，温度为%s,更新时间：%s "%(city,foundweather['text'],foundweather['temperature'],foundweather['time'])
                HTY.append(Str)
                return render_template("query.html",Str=Str)
        else:
            return render_template("body.html")
    elif request.args.get('history')=="历史":
        return render_template("history.html" ,HTY=HTY)

if __name__ == "__main__":
    app.run(debug = True)
