# 파이썬 문자형

# 문자열 생성
str1 = "I am Python"
str2 = 'Python'
str3 = '''How are you?'''
str4 = '''Thank you!'''

print(len(str4))

str1_t1 = ''
str2_t2 = str()

print('I\'M Boy')

escape_str1 = "Do you have a \"retro games\"?"
print(escape_str1)
escape_str2 = 'What\'s on TV?'
print(escape_str2)

t_s1 = "Click \t Start!"
t_s2 = "New Line \n Check!"

print(t_s1)
print(t_s2)

raw_s1 = r'D:\python\test'
print(raw_s1)

print()

multi_str = f'''
문자열1
문자열2
{raw_s1}
문자열3
'''

print(multi_str)

str_o1 = 'Python'
str_o2 = 'Apple'
str_o3 = 'iPhone'
str_o4 = 'iPad'
str_o5 = 'Seoul Daejeon Busan Jejue'

print(str_o1 + str_o2 + str_o3 + str_o4)
print('py' in str_o1)
print('P' not in str_o1)

ss = str(66)
print((type(ss)))

ss = int(10.111)
print(ss)
print(dir(str))
str_o1 = 'python'
print(str_o1.capitalize())
print("endswith?: ", str_o2.endswith('s'))
print(str_o1.replace('thon', 'Good'))
print(str_o1.upper())
print(sorted(str_o1))
print(str_o5.split(' '))

im_str = "Good Boy!"
print(dir(im_str))

for i in im_str:
    print(i)


str_s1 = "Nice Python"
print(str_s1[0:3])

str = '12345'
print(str[3:])    # 123까지만 슬라이싱
print(str[1:4:2])
print(str_s1[-5:])
print(str_s1[1:-1])
print(str[::2])