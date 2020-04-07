//
//  ViewController.swift
//  PhotosExample
//
//  Created by JinBae Jeong on 2020/04/07.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

  var fetchResult: PHFetchResult<PHAsset>!
  let imageManager: PHCachingImageManager = PHCachingImageManager()
  
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    configure()
    
    PHPhotoLibrary.shared().register(self)
  }
  
  func configure() {
    [tableView].forEach{ view.addSubview($0) }
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    
    tableView.dataSource = self
    tableView.delegate = self
    
    let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    
    switch photoAuthorizationStatus {
      case .authorized:
        print("접근 허가됨")
        requestCollection()
      case .denied:
        print("접근 불허")
      case .notDetermined:
        print("아직 응답하지 않음")
        PHPhotoLibrary.requestAuthorization { (status) in
          switch status {
          case .authorized:
              print("사용자가 허용함")
              self.requestCollection()
              OperationQueue.main.addOperation {
                self.tableView.reloadData()
              }
            case .denied:
              print("사용자가 불허함")
            default: break
          }
        }
      case .restricted:
        print("접근 제한")
    }
  }
  
  func requestCollection() {
    let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
    
    guard let cameraRollCollection = cameraRoll.firstObject else {
      return
    }
    
    let fetchOptions = PHFetchOptions()
    fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
  }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.fetchResult?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
    let asset: PHAsset = fetchResult.object(at: indexPath.row)
    
    imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil) { (image, _) in
      cell.imageView?.image = image
    }
    
    return cell
  }
  
  // tableView delegate
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let asset: PHAsset = self.fetchResult[indexPath.row]
      
      PHPhotoLibrary.shared().performChanges({
        PHAssetChangeRequest.deleteAssets([asset] as NSArray)
      }, completionHandler: nil)
    }
  }
  
  func photoLibrayDidChange(_ changeInstance: PHChange) {
    guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
    
    fetchResult = changes.fetchResultAfterChanges
    
    OperationQueue.main.addOperation {
      self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
  }
}
