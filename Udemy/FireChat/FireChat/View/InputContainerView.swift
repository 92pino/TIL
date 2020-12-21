//
//  InputContainerView.swift
//  FireChat
//
//  Created by 정진배 on 2020/12/21.
//

import UIKit
import SnapKit

class InputContainerView: UIView {
    
    init(image: UIImage?, textField: UITextField) {
        super.init(frame: .zero)
        
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = .white
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(self.snp.leading).offset(8)
            $0.width.height.equalTo(24)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(iv.snp.trailing).offset(8)
            $0.bottom.equalTo(self.snp.bottom).offset(-8)
            $0.trailing.equalTo(self.snp.trailing)
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(8)
            $0.bottom.equalTo(self.snp.bottom)
            $0.trailing.equalTo(self.snp.trailing)
            $0.height.equalTo(0.75)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
