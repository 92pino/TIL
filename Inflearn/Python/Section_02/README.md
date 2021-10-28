# Week 02

숫자형 사용법  

---
- 목차
    - [숫자형](#숫자형)
    - [문자형](#문자형)
---

```python
해당 타입이 갖고 있는 속성 혹은 함수를 보기 (dir 함수 사용)  
print(dir(type))
```

<h2 id="숫자형">숫자형</h2>

### 파이썬 지원 자료형

```python
int: 정수
float: 실수
complex: 복소수
bool: Boolean
str: 문자열(시퀀스)
list: 리스트(시퀀스)
tuple: 튜플(시퀀스)
set: 집합
dict: 사전

* 시퀀스란?  
반복을 처리할 수 있고, 순서가 있는 것들을 의미
```

```python
# 데이터 타입

- str type
    str1 = "Python"
    str2 = 'Anaconda'
    
- bool type
    bool = False
    
- float type
    float = 10.0 # 10 == 10.0 값은 같아도 타입은 다른 타입

- int type
    int = 7

- list type
    list = [str1, str2]
    
- dict type
    dict = {
        "name": "Machine Learning",
        "version": 2.0
    }

- tuple type
    tuple = (list, dict)

- set type
    set = {7, 8, 9}
```

### 숫자형 연산자
```python
+                   : 더하
-                   : 빼기
*                   : 곱하기
/                   : 나누기
//                  : 몫
%                   : 나머지기
abs(x)              : 절대값
pow(x, y), x ** y   : x의 y제곱
```

<h2 id="문자형">문자형</h2>

### 문자열의 길이 구하기
```python
str1 = "I am Python"
print(len(str1))
```

### 이스케이프 문자 사용
문자열 내에 특수 기호를 사용하기 위해 사용하는 기능
```python
ex)  
print('I\'m a Boy') # '' 내에 '를 사용할 수 없기 때문에 이때 \를 사용하여 '를 표시
```
|이스케이프|설명|
|:---:|:---:|
|\t|탭 만큼 띄우기|
|\n|개행|
|\\|문자|
|\'|문자|
|\"|문자|
|\000|널 문자|

### Raw String
이스케이핑 문자를 신경쓰지 않고 문자열 내에 이스케이핑 문자를 그대로 인식하는 기능
```python
'' 앞에 r을 붙여 raw string으로 변환
raw_s = r'D:\python\test'
```

### Multi line
```python
multi_str = '''
문자열1
문자열2
문자열3
'''
```

### 문자열 연산
```python
str_o1 = "Python"
str_o2 = "Swift"
print(str_o1 * 3)       # 문자열을 곱하기 연산으로 하면 숫자 정수형만큼 반복된 문자 출력
print(str_o1 + str_o2)
print('y' in str_o1)    # 문자열 내부에 'y'라는 알파벳이 있는지 확인
print('P' not in str_o1)    # 문자열 내부에 'P'라는 알파벳이 없는지 확인
```

### 문자열 함수(upper, isalnum, startswith, count, endswith, isalpha...)
|문자열 함수|설명|사용법|
|:---:|:---|:---|
|capitalize|첫 글자만 대문자로 변경|str_o1.capitalize()|
|startswith|첫 글자가 어떤거로 시작하는지 체크|str_o1.startswith('s')|
|endswith|끝 글자가 어떤거로 끝나는지 체크|str_o1.endswith('s')|
|replace|특정 문자를 다른 문자로 변경|str_o1.replace('thon', 'Good')|
|upper|전체 문자를 대문자로 변경|str_o1.upper()|
|sorted|정렬된 리스트 형태로 반환|sorted(str_o1)|
|split|문자열을 특정 문자를 기준으로 쪼개서 분리 후 리스트 형태로 반환|str_o1.split(' ')|

### 반복(시퀀스)
for i in im_str:
    print(i)

### 슬라이싱 🌟🌟🌟중요🌟🌟🌟
```python
# 0부터 시작할때는 0 혹은 마지막까지 슬라이싱 할 떄는 마지막 인덱스 생략 가능
# 음수일 때는 뒤에서부터 인덱스 시작
string[어디서부터 시작할지:슬라이싱하고싶은 인덱스 - 1:어떤 규칙으로 출력할지]
ex)
str = '12345'
str[:3]    # 123까지만 슬라이싱
str[3:]    # 45 슬라이싱
str[1:4:2]    # 24   >> 1~3까지 2씩 건너뛰면서 출력
str[-1:]    # 45
str[1:-1]   # 234
str[::2]    # 135
str[::-1]   # 54321 >> 역순으로 출력
```
