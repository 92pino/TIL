//
//  Friend.swift
//  FriendsCollection
//
//  Created by JinBae Jeong on 2020/04/13.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class FriendCell: UICollectionViewCell {
  let identifier: String = ""
  
  let nameAgeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "name"
    
    return label
  }()
  
  let addressLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "name"
    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  func configure() {
    [nameAgeLabel, addressLabel].forEach { addSubview($0) }
    
    autoLayout()
  }
  
  func autoLayout() {
    NSLayoutConstraint.activate([
      nameAgeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      nameAgeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      nameAgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
      nameAgeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
      addressLabel.leadingAnchor.constraint(equalTo: nameAgeLabel.leadingAnchor),
      addressLabel.trailingAnchor.constraint(equalTo: nameAgeLabel.trailingAnchor),
      addressLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 8),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
