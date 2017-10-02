import sqlite3 as lite
import sys

def createdata():
    con = lite.connect('weather.db')

    with con:
        cur = con.cursor()

        cur.execute('DROP table if exists SeachWeathers')
        cur.execute('CREATE table SeachWeathers(day text,location text,weather text,temper  text)')


def insertdata(day,location,weather,temper):
    con = lite.connect('weather.db')
    with con:
        cur = con.cursor()
        cur.execute('INSERT into SeachWeathers values(?,?,?,?)',(day, location,weather,temper))
def retrievedata(location):
    con = lite.connect('weather.db')
    with con:
        cur = con.cursor()
        cur.execute('SELECT day,location,weather,temper from SeachWeathers where location =:location',{"location": location})
        WTR = cur.fetchone()
        resultdata = u'{},{}天气{},气温{}度.'.format(WTR[0],WTR[1],WTR[2],WTR[3])
        return resultdata


if __name__ == '__main__':
    createdata()
    insertdata('2017-10-2','beijing','cloud','30')
    print(retrievedata('beijing'))
