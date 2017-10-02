import sqlite3 as lite
import sys

con = lite.connect('weather.db')

with con:
    cur = con.cursor()

    cur.execute('DROP table if exists Weathers')
    cur.execute('CREATE table weather(day text,location text,weather text,temper  text)')
