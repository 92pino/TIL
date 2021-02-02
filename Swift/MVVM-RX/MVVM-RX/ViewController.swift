//
//  ViewController.swift
//  MVVM-RX
//
//  Created by 정진배 on 2021/01/27.
//

import UIKit
import RxSwift
import SnapKit

class ViewController: UIViewController {

    let viewModel = EmailSignInViewModel()
    let disposeBag = DisposeBag()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Input Email"

        return tf
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Input Password"

        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func binding() {
        emailTextField.rx.text.
    }


}

