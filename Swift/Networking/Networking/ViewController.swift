//
//  ViewController.swift
//  Networking
//
//  Created by JinBae Jeong on 2020/04/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let cellIdentifier: String = "friendCell"
  var friends: [Friend] = []
  
  lazy var tableView: UITableView = {
    let tb = UITableView()
    tb.translatesAutoresizingMaskIntoConstraints = false
    tb.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    
    return tb
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    
    [tableView].forEach { view.addSubview($0) }
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
    
    let session: URLSession = URLSession(configuration: .default)
    
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
      
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      guard let data = data else { return }
      
      do {
        let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
        self.friends = apiResponse.results
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      } catch (let err) {
        print(err.localizedDescription)
      }
    }
      dataTask.resume()
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(friends)
    return friends.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
    
    let friend: Friend = self.friends[indexPath.row]
    
    cell.textLabel?.text = friend.name.full
    cell.detailTextLabel?.text = friend.email
    
    guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return cell }
    guard let imageData: Data = try? Data(contentsOf: imageURL) else { return cell }
    cell.imageView?.image = UIImage(data: imageData)
    
    return cell
  }
  
  
}
