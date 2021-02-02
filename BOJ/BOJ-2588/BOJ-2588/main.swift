//
//  main.swift
//  BOJ-2588
//
//  Created by 정진배 on 2021/02/03.
//

import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!

print(a*(b%10))
print(a*((b%100)/10))
print(a*(b/100))
print(a*b)
