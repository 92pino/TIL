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
  
    // MARK: - Lifecycle
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .orange
      
      configUI()
    }

    // MARK: - Helper
    func configUI() {
      [popButton].forEach { view.addSubview($0) }
      
      let guide = view.safeAreaLayoutGuide
      
      NSLayoutConstraint.activate([
        popButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
        popButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
      ])
    }

    // MARK: - Action
    @objc func popHandler(_ sender: UIButton) {
      navigationController?.popViewController(animated: true)
    }

}
