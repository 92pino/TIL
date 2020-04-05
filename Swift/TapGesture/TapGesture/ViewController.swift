//
//  ViewController.swift
//  TapGesture
//
//  Created by JinBae Jeong on 2020/04/05.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let tf: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "tf"
    
    return tf
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    configure()
  }
  
  func configure() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapView))
    view.addGestureRecognizer(tap)
    
    [tf].forEach{ view.addSubview($0) }
    NSLayoutConstraint.activate([
      tf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      tf.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }

  @objc func tapView(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }

}
