//
//  EmailSignInViewModel.swift
//  MVVM-RX
//
//  Created by 정진배 on 2021/01/27.
//

import Foundation
import RxSwift
import RxRelay

// input : View로부터 받은 입력
// output : 로직을 통해서 나온 결과로 나오는 출력

class EmailSignInViewModel {
    let disposeBag = DisposeBag()

    let emailTextRelay = BehaviorRelay<String>(value: "")
    let passwordTextRelay = BehaviorRelay<String>(value: "")

    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(emailTextRelay, passwordTextRelay).map { username, password in
            return username.count > 0 && username.contains("@") && username.contains(".") && password.count > 0
        }
    }
}
