import random
# random.randint(x，y) 生成一个指定范围内的整数
num = random.randint(0,20)
# 统计用户猜测的次数
count = 1
# 用户猜的数字
print("please guess a number < 20")
# python3里面input()默认接收到的是str类型
x = int(input(">"))

while x != num and count < 10:
    if x > num:
        print("bigger,please guess once more")
        x = int(input(">"))
        count = count + 1
    else :
        print("smaller,please guess once more")
        x = int(input(">"))
        count = count + 1


if count < 10 :
    print("you are right")
else :
    print("sorry,game over")
