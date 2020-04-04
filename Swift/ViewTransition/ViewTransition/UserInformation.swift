//
//  UserInformation.swift
//  ViewTransition
//
//  Created by JinBae Jeong on 2020/04/05.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

class UserInformation {
  // 타입프로퍼티로 인스턴스 생성
  // 타입프로퍼티로 인스턴스를 생성해서 할당해줬기 때문에 타입프로퍼티를 호출하면 항상 같은 인스턴스를 사용할수있다.
  static let shared: UserInformation = UserInformation()
  
  var name: String?
  var age: String?
}
