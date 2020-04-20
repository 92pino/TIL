//
//  ViewController.swift
//  Alert
//
//  Created by JinBae Jeong on 2020/04/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  private let btn01: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(touchUpShowAlertButton), for: .touchUpInside)
    button.setTitle("Show Alert", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
  }()
  
  private let btn02: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(touchUpShowActionSheetButton), for: .touchUpInside)
    button.setTitle("Show Action Sheet", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    [btn01, btn02].forEach { view.addSubview($0) }
    NSLayoutConstraint.activate([
      btn01.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      btn01.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      btn02.topAnchor.constraint(equalTo: btn01.bottomAnchor, constant: 10),
      btn02.leftAnchor.constraint(equalTo: btn01.leftAnchor),
    ])
  }
  
  // MARK: - Method
  func showAlertController(style: UIAlertController.Style) {
    
    let alertController: UIAlertController
    alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
    
    let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction) in
      print("OK pressed")
    })
    
    // cancel style은 1개만 사용할 수 있다.
    let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    
    let handler: (UIAlertAction) -> Void
    handler = { (action: UIAlertAction) in
      print("action pressed \(action.title ?? "")")
    }
    
    let someAction: UIAlertAction
    someAction = UIAlertAction(title: "Some", style: .destructive, handler: handler)
    
    let anotherAction: UIAlertAction = UIAlertAction(title: "Another", style: .default, handler: handler)
    
    alertController.addAction(someAction)
    alertController.addAction(anotherAction)
    
    alertController.addTextField { (field: UITextField) in
      field.placeholder = "플레이스 홀더"
      field.textColor = .red
    }
    
    present(alertController, animated: true) {
      print("Alert controller shown")
    }
  }
  
  // MARK: - Action
  @objc func touchUpShowAlertButton(_ sender: UIButton) {
    showAlertController(style: .alert)
  }
  
  @objc func touchUpShowActionSheetButton(_ sender: UIButton) {
    showAlertController(style: .actionSheet)
  }


}

