//
//  ViewController.swift
//  RxCocoa-TableView
//
//  Created by EE201201 on 2020/12/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import SnapKit

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let lb = UILabel()
    let btn = UIButton(type: .system)
    let tf = UITextField()
    var str = PublishSubject<String?>()
    var arr = Array<String>()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        btn.setTitle("test", for: .normal)

        for i in 0...3 where i > 2 {
            print(i)
        }
        btn.rx.tap
            .map { "HELLO" }
            .subscribe(onNext: { [weak self] text in
                self?.arr.append(text)
            })
            .disposed(by: disposeBag)

        test()
        configureUI()
        print(arr)
    }

    func test() {
        print(1111)
        str.subscribe(onNext: {
            print("@@@ : ", $0)
        })
        .disposed(by: disposeBag)
    }

    func configureUI() {
        [lb, btn].forEach { view.addSubview($0) }

        lb.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
        }
        btn.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(lb.snp.bottom).offset(10)
        }
    }


}

