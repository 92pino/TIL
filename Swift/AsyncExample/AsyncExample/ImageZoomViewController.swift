//
//  ImageZoomViewController.swift
//  AsyncExample
//
//  Created by JinBae Jeong on 2020/04/13.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {

  var asset: PHAsset!
  let imageManager: PHCachingImageManager = PHCachingImageManager()
  
  private let scrollView: UIScrollView = {
    let sv = UIScrollView()
    
    return sv
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    
    return imageView
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil) { image, _ in
        self.imageView.image = image
      }
    }
    

  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return self.imageView
  }
}
