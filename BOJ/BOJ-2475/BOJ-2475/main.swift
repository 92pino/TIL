//
//  main.swift
//  BOJ-2475
//
//  Created by 정진배 on 2021/02/03.
//
/*



 */
import Foundation

print(readLine()!.split(separator: " ").reduce(0,{$0+Int($1)!*Int($1)!})%10)
