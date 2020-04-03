//
//  ViewController.swift
//  ImagePicker
//
//  Created by JinBae Jeong on 2020/04/04.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    
    return imageView
  }()
  
  private let imageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("사진 선택하기", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(touchUpSelectImageButton), for: .touchUpInside)
    
    return button
  }()
  
  lazy var imagePicker: UIImagePickerController = {
    let picker: UIImagePickerController = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.delegate = self
    
    return picker
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    imagePicker.delegate = self
    
    config()
  }
  
  func config() {
    let guide = view.safeAreaLayoutGuide
    
    [imageView, imageButton].forEach{view.addSubview($0)}
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
      imageView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
      imageView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
      imageView.bottomAnchor.constraint(equalTo: imageButton.topAnchor, constant: -20),
      imageButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
      imageButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
      imageButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
    ])
  }
  
  @objc func touchUpSelectImageButton(_ sender: UIButton) {
    present(imagePicker, animated: true, completion: nil)
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      imageView.image = originalImage
    }
    
    dismiss(animated: true, completion: nil)
  }

}
