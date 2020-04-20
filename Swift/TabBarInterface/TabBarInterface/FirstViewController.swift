//
//  FirstViewController.swift
//  TabBarInterface
//
//  Created by JinBae Jeong on 2020/04/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  private let btn: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("MOVE", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(moveView), for: .touchUpInside)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    [btn].forEach{view.addSubview($0)}
    
    NSLayoutConstraint.activate([
      btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    
    view.backgroundColor = .red
  }
  
  @objc func moveView(_ sender: UIButton) {
    show(ThridViewController(), sender: nil)
  }
}
