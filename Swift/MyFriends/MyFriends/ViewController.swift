//
//  ViewController.swift
//  MyFriends
//
//  Created by JinBae Jeong on 2020/04/07.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var friends: [Friend] = []

  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    tableView.delegate = self
    tableView.dataSource = self
    
    let jsonDecoder: JSONDecoder = JSONDecoder()
    guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
      return
    }
    
    do {
      self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
    } catch {
      print(error.localizedDescription)
    }
    
    tableView.reloadData()
    
    configure()
  }

  func configure() {
    [tableView].forEach{ view.addSubview($0) }
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.friends.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    
    let friend: Friend = friends[indexPath.row]
    cell.textLabel?.text = friend.nameAndAge
    cell.detailTextLabel?.text = friend.fullAddress
    
    return cell
  }
}
