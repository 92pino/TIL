//
//  LanguageTableViewCell.swift
//  SimpleTable
//
//  Created by JinBae Jeong on 2020/04/05.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

  lazy var leftLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  lazy var rightLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure() {
    [leftLabel, rightLabel].forEach{ addSubview($0) }
    NSLayoutConstraint.activate([
      leftLabel.topAnchor.constraint(equalTo: self.topAnchor),
      leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      rightLabel.topAnchor.constraint(equalTo: self.topAnchor),
      rightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      rightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }
  
}
