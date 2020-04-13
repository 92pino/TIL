//
//  ViewController.swift
//  FriendsCollection
//
//  Created by JinBae Jeong on 2020/04/13.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let cellId: String = "cellId"
  var friends: [Friend] = []

  private let collectionView: UICollectionView = {
    let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.register(FriendCell.self, forCellWithReuseIdentifier: "cell")
    
    return cv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    configure()
  }
  
  func configure() {
    let jsonDecoder: JSONDecoder = JSONDecoder()
    guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else { return }
    
    do {
      self.friends = try! jsonDecoder.decode([Friend].self, from: dataAsset.data)
    } catch {
      print(error.localizedDescription)
    }
    
    [collectionView].forEach{ view.addSubview($0) }
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.friends.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: FriendCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FriendCell
    
    let friend: Friend = self.friends[indexPath.item]
    
    cell.nameAgeLabel.text = friend.nameAndAge
    cell.addressLabel.text = friend.fullAddress
    
    return cell
  }
  
//  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    self.numberOfCell += 1
//    collectionView.reloadData()
//  }
}
