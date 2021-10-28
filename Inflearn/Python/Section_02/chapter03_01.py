# 데이터 타입
str1 = "Python"
bool = False
str2 = 'Anaconda'
float_v = 10.0 # 10 == 10.0 값은 같아도 타입은 다른 타입
int_v = 7
list = [str1, str2]
dict = {
    "name": "Machine Learning",
    "version": 2.0
}
tuple = (list, dict)
set = {7, 8, 9}

# 데이터 타입 출력
print(type(str1))
print(type(bool))
print(type(str2))
print(type(float_v))
print(type(int_v))
print(type(dict))
print(type(tuple))
print(type(set), set)

# 숫자형 연산자

### 정수 선언
i = 77
i2 = -14
big_int = 777777777777777777777777777777777777777777777777

### 정수 출력
print(i)
print(i2)
print(big_int)
print()

# 실수 출력
f = 0.9999
f2 = 3.141592
f3 = -3.9
f4 = 3 / 9

print(f, f2, f3, f4)
print()

# 연산 실습
i1 = 39
i2 = 939
big_int1 = 7777777777777777777777771
big_int2 = 7777777777777777777777772
f1 = 1.234
f2 = 3.939


print(i1 + i2)
print(f1 + f2)
print(type(big_int1 + f1))

print(abs(-10))

# 형 변환 실습
a = 3.
b = 6
c = .7
d = 12.7

print(type(a), type(b))
print(int(True))    # true: 1, false: 0
print(float(False))

print(abs(-7))
x, y = divmod(100, 8)   # x에는 몫, y에는 나머지
print(x, y)

print(pow(5, 3), 5 ** 3)

# 수치 연산에 특화된 연산을 하기 위한 패키지
# 외부에서 만들어진 패키기를 가져오기

import math   # mat라는 수학 계산을 도와주는 외부 모듈
print(math.pi)
print(math.ceil(5.1))   # ceil : x 이상의 수 중에서 가장 작은 정수
