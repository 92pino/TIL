//
//  main.swift
//  BOJ-14681
//
//  Created by 정진배 on 2021/02/03.
//

import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!

if a > 0, b > 0 {
    print(1)
} else if a > 0, b < 0 {
    print(4)
} else if a < 0, b > 0 {
    print(2)
} else {
    print(3)
}
