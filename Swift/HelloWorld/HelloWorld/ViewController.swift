//
//  ViewController.swift
//  HelloWorld
//
//  Created by JinBae Jeong on 2020/04/01.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayHello(_ sender: UIButton) {
        self.uiTitle.text = "안녕하세요"
    }
    
}

