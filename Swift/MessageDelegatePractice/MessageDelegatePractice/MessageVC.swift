//
//  ViewController.swift
//  MessageDelegatePractice
//
//  Created by JinBae Jeong on 2020/04/04.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
  
  lazy var message: MessageBox = {
    var msg = MessageBox()
    msg = MessageBox(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 300)))
    msg.frame.origin = CGPoint(x: (UIScreen.main.bounds.width - msg.bounds.width) * 0.5, y: (UIScreen.main.bounds.height - msg.bounds.height) * 0.5)
    msg.backgroundColor = .lightGray
    
    // 프로토콜을 상속받고 구현하게 되면 상속받은 프로토콜로 형변환이 가능해진다.
    msg.delegate = self
    
    return msg
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    view.addSubview(message)
  }


}

extension MessageVC: MessageBoxDelegate {
  func touchButton() {
    print("touchButton")
  }
}
