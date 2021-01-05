//
//  ViewController.swift
//  VisualStuioAppCenter
//
//  Created by EE201201 on 2020/12/23.
//

import UIKit
import AppCenter
import AppCenterCrashes

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AppCenter.start(withAppSecret: "9a92ee91-3e81-41b2-8ecf-14611a922ef0", services:[
          Crashes.self
        ])

        view.backgroundColor = .yellow

        print("Distribute Complete")
    }


}

xcrun xcodebuild build-for-testing -configuration Debug -workspace VisualStuioAppCenter.xcworkspace -sdk iphoneos -scheme VisualStuioAppCenter -derivedDataPath ddp
