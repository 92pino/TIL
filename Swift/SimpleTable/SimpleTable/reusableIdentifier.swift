//
//  reusableIdentifier.swift
//  SimpleTable
//
//  Created by JinBae Jeong on 2020/04/05.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

// MARK: - extension

extension NSObject {
  static var reusableIdentifier: String {
    return String(describing: self)
  }
}
