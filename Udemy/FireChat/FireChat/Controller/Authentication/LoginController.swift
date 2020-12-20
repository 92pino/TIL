//
//  LoginController.swift
//  FireChat
//
//  Created by 정진배 on 2020/12/20.
//

import UIKit
import SnapKit

class LoginController: UIViewController {
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        
        return iv
    }()
    
    private let emailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let passwordContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .systemRed
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.width.height.equalTo(120)
        }
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.top.equalTo(iconImage.snp.bottom).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(32)
            $0.trailing.equalTo(view.snp.trailing).offset(-32)
        }
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
