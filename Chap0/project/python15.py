# -*- coding: utf-8 -*-
"""
Created on Sun Aug 13 11:17:46 2017

@author: 12544
"""

from sys import argv 

script,filename = argv

txt = open(filename)

print ("Here's your file %r:" % filename)
print (txt.read())
print ("Type the filename again:")
file_again = input("> ")

txt_again = open(file_again)

print (txt_again.read())