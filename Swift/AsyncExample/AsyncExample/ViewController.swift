//
//  ViewController.swift
//  AsyncExample
//
//  Created by JinBae Jeong on 2020/04/08.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
  }()
  
  private let button : UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("download", for: .normal)
    button.setTitleColor(.red, for: .normal)
    button.addTarget(self, action: #selector(touchUpDownloadButton), for: .touchUpInside)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    configure()
  }

  func configure() {
    [imageView, button].forEach{ view.addSubview($0) }
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      imageView.widthAnchor.constraint(equalToConstant: 100),
      imageView.heightAnchor.constraint(equalToConstant: 100),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
    ])
  }

  @objc func touchUpDownloadButton(_ sender: UIButton) {
    // 이미지 다운로드 -> 이미지 뷰에 셋팅
    
    // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
    
    print(1111)
    guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg") else {
      return
    }
    
    OperationQueue().addOperation{
      let imageData: Data = try! Data.init(contentsOf: imageURL)
      let image: UIImage = UIImage(data: imageData)!
      OperationQueue.main.addOperation {
        self.imageView.image = image
      }
    }
    
  }
  
}

