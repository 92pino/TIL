//
//  CustomViewController.swift
//  CustomTabBar
//
//  Created by EE201201 on 2021/03/31.
//

import UIKit

@available(iOS 10.0, *)
public protocol CustomTabBarControllerProtocol: NSObjectProtocol {
    func tabBarController(_ tabBarController: CustomTabBarViewController, didSelect viewController: UIViewController)
}

@available(iOS 10.0, *)
public class CustomTabBarViewController: UIViewController, CustomTabBarDelegate {


    weak open var delegate: CustomTabBarControllerProtocol?

    public var selectedIndex: Int = 0
    public var previousSelectedIndex = 0

    public var viewControllers = [UIViewController]() {
        didSet {
            tabBar.viewControllers = viewControllers
        }
    }

    private lazy var tabBar: CustomTabBar = {
        let tabBar = CustomTabBar()
        tabBar.delegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()

    override open func viewDidLoad() {
        super.viewDidLoad()

    }

    func tabBar(_ tabBar: CustomTabBar, didSelectTabAt index: Int) {
        
    }

}
