//
//  main.swift
//  BOJ-2914
//
//  Created by 정진배 on 2021/02/03.
//

import Foundation

var copyrights = readLine()!.split(separator: " ").map { Int($0)! }
print(copyrights[0] * (copyrights[1] - 1) + 1)
