//
//  TestViewModel.swift
//  MVVM-DesignPattern-Test
//
//  Created by EE201201 on 2020/12/24.
//

import Foundation

class TestViewModel {
    var tit: String?

    func changeProcessing(process: String) {
        print(process, tit)
        self.tit = process
    }
}
