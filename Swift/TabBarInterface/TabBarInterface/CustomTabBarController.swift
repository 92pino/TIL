//
//  ViewController.swift
//  TabBarInterface
//
//  Created by JinBae Jeong on 2020/04/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewControllers = [
      createNaviController(viewController: FirstViewController(), title: "First"),
      createNaviController(viewController: SecondViewController(), title: "Second"),
    ]
  }

  private func createNaviController(viewController: UIViewController, title: String) -> UIViewController {
    let naviController = UINavigationController(rootViewController: viewController)
    naviController.tabBarItem.title = title
    
    return naviController
  }

}

