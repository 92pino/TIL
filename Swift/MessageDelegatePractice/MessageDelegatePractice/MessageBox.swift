//
//  MessageBox.swift
//  MessageDelegatePractice
//
//  Created by JinBae Jeong on 2020/04/04.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

// 대신 처리 해줄 객체를 저장해둘 프로퍼티
protocol MessageBoxDelegate: class {
  func touchButton()
}

class MessageBox: UIView {

  weak var delegate: MessageBoxDelegate?
  lazy var button: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("SEND", for: .normal)
    btn.sizeToFit()
    btn.frame.origin = CGPoint(x: (self.bounds.width - btn.bounds.width) * 0.5, y: (self.bounds.height - btn.bounds.height) * 0.5)
    btn.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    
    return btn
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure() {
    addSubview(button)
  }
  
  @objc func tapButton() {
    delegate?.touchButton()
  }
  
}
