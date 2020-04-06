//
//  Friend.swift
//  MyFriends
//
//  Created by JinBae Jeong on 2020/04/07.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

struct Friend: Codable {
  let name: String
  let age: Int
  let addressInfo: Address
  
  var nameAndAge: String {
    return self.name + "(\(self.age))"
  }
  
  var fullAddress: String {
    return self.addressInfo.city + ", " + self.addressInfo.country
  }
  
  enum CodingKeys: String, CodingKey {
    case name, age
    case addressInfo = "address_info"
  }
}

struct Address: Codable {
  let country: String
  let city: String
}
