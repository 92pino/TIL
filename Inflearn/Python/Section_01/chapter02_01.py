print('Python Start!')
print("Python Start!")
print('''Python Start!''')
print("""Python Start!""")

print()

print('P', 'Y', 'T', 'H', 'O', 'N', sep='   ')  # P   Y   T   H   O   N
print('P', 'Y', 'T', 'H', 'O', 'N', sep=',')    # P,Y,T,H,O,N
print('P', 'Y', 'T', 'H', 'O', 'N', sep='')     # PYTHON
print('010', '1234', '5678', sep='-')           # 010-1234-5678
print('python', 'gmail.com', sep='@')           # python@gmail.com

print()

print('Welcomd to', end=' ')
print('IT News', end=' ')
print('Web Site')

print()

import sys

print()

print('%s %s' % ('one', 'two'))
print('{} {}'.format('one', 'two'))
print('{1} {0}'.format('one', 'two'))
print()

print('%10s' % ('nice'))
print('%10s' % ('nice1234'))
print('%10s' % ('nice'))
print('{:>10}'.format('nice'))
print()
print('%-10s' % ('nice'))
print('{:10}'.format('nice'))
print()
print('{:_>10}'.format('nice'))
print('{:^10}'.format('nice'))

print()

print('%.5s' % ('123456'))
print('{:10.5}'.format('python study'))

print()

print('%.2f' % (33123.12312))
print('%05.2f' % (1.12345678))
print('{:06.2f}'.format(3.141592))