//
//  JBTabBarController.swift
//  CustomTabBar
//
//  Created by EE201201 on 2021/03/31.
//

import UIKit

class JBTabBarController: UITabBarController {

    let customTabVC = CustomTabBarViewController()

    var tabBarControllers: [UIViewController]!


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init(tabBarControllers: [UIViewController], withAnimation: Bool = false) {
        super.init(nibName: nil, bundle: nil)

        print("@@@@@ : ", tabBarControllers)
        customTabVC.viewControllers = tabBarControllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - JBTabBarController
extension JBTabBarController: CustomTabBarControllerProtocol {
    func tabBarController(_ tabBarController: CustomTabBarViewController, didSelect viewController: UIViewController) {

    }
}
