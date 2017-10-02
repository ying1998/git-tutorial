#encoding: utf-8


import urllib.request
url = "https://github.com/ying1998/git-tutorial/issues/1"
data = urllib.request.urlopen(url).read()
data = data.decode('utf-8')

print(data)
