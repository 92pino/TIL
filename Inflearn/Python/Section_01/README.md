# Week 01

---
- 목차
    - [print 사용법](#print)
    - [변수](#variable)
---

<h2 id="print">print 사용법</h2>

기본적으로 ```print()```를 사용하여 값을 출력  
print() 만 사용할 경우 개행

```python
print('Python Start!')      < 주로 사용
print("Python Start!")      < 주로 사용
print('''Python Start!''')
print("""Python Start!""")
```

### separator 옵션
print문 출력 시 여러 문자들을 원하는 텍스트로 붙여주는 역할

```python
print('P', 'Y', 'T', 'H', 'O', 'N', sep='   ')  # P   Y   T   H   O   N
print('P', 'Y', 'T', 'H', 'O', 'N', sep=',')    # P,Y,T,H,O,N
print('P', 'Y', 'T', 'H', 'O', 'N', sep='')     # PYTHON

print('010', '1234', '5678', sep='-')           # 010-1234-5678
print('python', 'gmail.com', sep='@')           # python@gmail.com
```

### end 옵션
print문 뒤에 마지막 부분을 어떻게 처리할건지 정해주는 역할 >> 기본적으로는 \n

```python
print('Welcomd to', end=' ')
print('IT News', end=' ')
print('Web Site')

# Welcomd to IT News Web Site
```

## 문자열 출력 방법
### format 사용(d : 정수, s: 문자열, f: 실수)
문자열을 formatting해서 보기 편하게 출력하게 해주는 역할

```python
# %s 개수만큼 값을 넣어줄 수 있다.
print('%s %s' % ('one', 'two'))         # one two
print('{} {}'.format('one', 'two'))     # one two
print('{1} {0}'.format('one', 'two'))   # two one

# %10s : 10자리의 문자열
print('%10s' % ('nice'))        #      nice  << 양수일 경우에는 오른쪽에 공백 
print('%10s' % ('nice1234'))    #  nice1234
print('{:>10}'.format('nice'))  #      nice
print('%-10s' % ('nice'))       # nice       << 음수일 경우에는 오른쪽에 공백 채움
print('{:10}'.format('nice'))   # nice       << >를 생략할 경우 오른쪽에 공백 채움
print('{:_>10}'.format('nice')) # ______nice << 공백 대신 원하는 글자(_)로 채움
print('{:^10}'.format('nice'))  #    nice    << 중앙정렬
print('%.5s' % ('123456'))      # 12345      << 원하는 자리수까지만 절삭
print('{:10.5}'.format('python study')) # 공간은 10자리지만 앞에서 5자리만 나와라

print('%0.2f' % (3.12312))      # %N.Mf << 총 N자리까지 출력, 소수점 M자리까지 나오게
# %5일 경우 앞에 빈 공백, 
print('%05.2f' % (1.12345678))      # 총 5자리, 소수점 2자리 << 01.12
print('{:06.2f}'.format(3.141592))
```

<h2 id="variable">변수</h2>
기본 선언
n = 3

### 다양한 변수 선언
1. Camel Case
  > 띄어쓰기 대신 이어지는 첫 글자를 대문자로 작성  
  > 함수, 변수 선언할 때 주로 사용
```python
camelCase
numberOfCollegeGraduates
studentGrade
```

2. Pascal Case
  > Camel Case와 유사하지만 맨 첫번째 글자도 대문자로 작성  
  > class를 선언할 때 주로 사용
```python
PascalCase
NumberOfCollegeGraduates
StudentGrade
```

3. Snake Case
  > 띄어쓰기 대신 뱀처럼 _를 이어서 영어 단어를 작성  
  > python에서 주로 사용
```python
snake_case
number_of_college_graduates
student_grade = 3
```

### 허용하는 변수 선언
- 특수문자(_, $ 제외), 숫자로 시작하는 변수는 사용 불가
- 예약어는 변수명으로 사용 불가