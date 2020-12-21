//
//  CustomTextField.swift
//  FireChat
//
//  Created by 정진배 on 2020/12/21.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String, isSecure: Bool) {
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = .white
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor : UIColor.white])
        isSecureTextEntry = isSecure
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
