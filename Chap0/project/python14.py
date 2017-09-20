# -*- coding: utf-8 -*-
"""
Created on Sun Aug 13 10:46:36 2017

@author: 12544
"""
from sys import argv

script,user_name = argv
prompt = '>'

print("Hi %s ,I'm the %s script."%(user_name,script))
print("I'd like to ask you a few questions.")
print ("Do you like me %s?" % user_name)
likes = input(prompt)

print ("Where do you live %s?"% user_name)
lives = input(prompt)

print ("What kind of computer do you have?")
computer = input(prompt)

print("""Alright, so you said %r about liking me . You live in %r. Not sure where taht is. And you have a %r computer .Nice"""%(likes,lives,computer))