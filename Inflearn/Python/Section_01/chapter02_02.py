n = 700
print('{}'.format(n))

m = 800
n = 800

print(id(m))
print(id(n))
print(id(m) == id(n))
print()

m = n = z = i = 800

print(id(m))
print(id(n))
print(id(z))
print(id(i))
print(id(m) == id(n))
print()

# 다양한 변수 선언
studentGrade = 3    # camelCase
StudentGrade = 3    # PascalCase
student_grade = 3   # snake_case

# 허용하는 변수 선언 법
age = 1
Age = 2
aGe = 3
a_g_e = 4
_age = 5
# 1AGE = 6