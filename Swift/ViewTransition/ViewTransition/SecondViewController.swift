//
//  SecondViewController.swift
//  ViewTransition
//
//  Created by JinBae Jeong on 2020/04/04.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  private let popButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("POP", for: .normal)
    button.addTarget(self, action: #selector(popHandler), for: .touchUpInside)
    
    return button
  }()
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "이름"
    
    return label
  }()
  
  private let ageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "나이"
    
    return label
  }()
  
    // MARK: - Lifecycle
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .orange
      
      print("1111 : ", UserInformation.shared.name)
      
      configUI()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    print("2222 : ", UserInformation.shared.name)
    nameLabel.text = UserInformation.shared.name
    ageLabel.text = UserInformation.shared.age
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    print("3333 : ", UserInformation.shared.name)
  }

    // MARK: - Helper
    func configUI() {
      [popButton, nameLabel, ageLabel].forEach { view.addSubview($0) }
      
      let guide = view.safeAreaLayoutGuide
      
      NSLayoutConstraint.activate([
        popButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
        popButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
        nameLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
        nameLabel.topAnchor.constraint(equalTo: popButton.bottomAnchor, constant: 10),
        ageLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
        ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
      ])
    }

    // MARK: - Action
    @objc func popHandler(_ sender: UIButton) {
      navigationController?.popViewController(animated: true)
    }

}
