//
//  ViewController.swift
//  ViewTransition
//
//  Created by JinBae Jeong on 2020/04/04.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Properties
  
  private let pushButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("PUSH", for: .normal)
    button.backgroundColor = .red
    button.addTarget(self, action: #selector(pushHandler), for: .touchUpInside)
    
    return button
  }()
  
  private let modalButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Modal Button", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(modalHandler), for: .touchUpInside)
    
    return button
  }()
  
  private let textField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "텍스트를 입력하세요"
    tf.addTarget(self, action: #selector(tfChangeValue), for: .editingChanged)
    
    return tf
  }()
  
  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "값이 바뀝니다."
    label.textColor = .black
    
    return label
  }()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    print("viewDidLoad")
    configUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    print("viewDidAppear")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print("viewWillAppear")
  }
  override func viewWillDisappear(_ animated: Bool) {
    print("viewWillDisappear")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    print("viewDidDisAppear")
  }

  // MARK: - Helper
  func configUI() {
    [pushButton, modalButton, textField, label].forEach { view.addSubview($0) }
    
    let guide = view.safeAreaLayoutGuide
    
    NSLayoutConstraint.activate([
      pushButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      pushButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
      modalButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 10),
      modalButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      textField.topAnchor.constraint(equalTo: modalButton.bottomAnchor, constant: 10),
      textField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
      label.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
    ])
  }

  // MARK: - Action
  @objc func pushHandler(_ sender: UIButton) {
    let navigator = SecondViewController()
    navigationController?.pushViewController(navigator, animated: true)
  }
  
  @objc func modalHandler(_ sender: UIButton) {
    let modal = ModalViewController()
    modal.modalPresentationStyle = .automatic
    modal.modalTransitionStyle = .coverVertical
    present(modal, animated: true, completion: nil)
  }
  
  @objc func tfChangeValue(_ sender: UITextField) {
    label.text = sender.text
  }
  
}

