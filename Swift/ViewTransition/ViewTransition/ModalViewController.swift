//
//  ModalViewController.swift
//  ViewTransition
//
//  Created by JinBae Jeong on 2020/04/04.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

  private let dismissBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("PUSH", for: .normal)
    button.backgroundColor = .red
    button.addTarget(self, action: #selector(dismissHandler), for: .touchUpInside)
    
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
      [dismissBtn].forEach { view.addSubview($0) }
      
      let guide = view.safeAreaLayoutGuide
      
      NSLayoutConstraint.activate([
        dismissBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
        dismissBtn.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
      ])
    }

    // MARK: - Action
    @objc func dismissHandler(_ sender: UIButton) {
      dismiss(animated: true, completion: nil)
    }

}
