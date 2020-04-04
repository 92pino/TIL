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
  
  private let nameField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "이름을 입력해주세요"
    
    return tf
  }()
  
  private let ageField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "나이를 입력해주세요"
    tf.keyboardType = .numberPad
    
    return tf
  }()
  
  private let btnSingleTon: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Set Data to Singleton Instance", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(touchUpSetButton), for: .touchUpInside)
    
    return button
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
    [pushButton, modalButton, nameField, ageField, btnSingleTon].forEach { view.addSubview($0) }
    
    let guide = view.safeAreaLayoutGuide
    
    NSLayoutConstraint.activate([
      pushButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      pushButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
      modalButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 10),
      modalButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      nameField.topAnchor.constraint(equalTo: modalButton.bottomAnchor, constant: 20),
      nameField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      ageField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
      ageField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      btnSingleTon.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 20),
      btnSingleTon.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
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
  
  @objc func touchUpSetButton(_ sender: UIButton) {
    print(1111)
    UserInformation.shared.name = nameField.text
    UserInformation.shared.age = ageField.text
  }
  
}

