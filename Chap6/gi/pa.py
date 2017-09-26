#encoding: utf-8
import urllib.request

url = "https://github.com/"
data = urllib.request.urlopen(url).read()
data = data.decode('utf-8')
print(data)
