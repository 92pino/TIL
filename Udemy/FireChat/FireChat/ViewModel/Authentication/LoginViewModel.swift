//
//  LoginViewModel.swift
//  FireChat
//
//  Created by 정진배 on 2020/12/21.
//

/*
 
 viewModel의 요점은 상대적인 특정 사항을 계산하는 데 도움이 되는 것
 
 */

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
