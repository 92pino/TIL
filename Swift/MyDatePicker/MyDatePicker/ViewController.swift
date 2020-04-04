//
//  ViewController.swift
//  MyDatePicker
//
//  Created by JinBae Jeong on 2020/04/05.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let dateFormatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = "YYYY/MM/dd hh:mm:ss"
    
    return formatter
  }()
  
  private let datePicker: UIDatePicker = {
    let dp = UIDatePicker()
    dp.translatesAutoresizingMaskIntoConstraints = false
    dp.addTarget(self, action: #selector(didDatePickerValueChanged), for: .valueChanged)
    
    return dp
  }()
  
  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "테스트"
    label.textAlignment = .center
    
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    configure()
  }

  func configure() {
    [datePicker, label].forEach{ view.addSubview($0) }
    
    NSLayoutConstraint.activate([
      datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      datePicker.heightAnchor.constraint(equalToConstant: 160),
      label.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
      label.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor, constant: 16),
      label.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor, constant: -16)
    ])
  }
  
  @objc func didDatePickerValueChanged(_ sender: UIDatePicker) {
    // sender : Datepicker
    // sender.date === datePicker.date
    let date: Date = sender.date
    let dateString: String = dateFormatter.string(from: date)
    label.text = dateString
  }
}

