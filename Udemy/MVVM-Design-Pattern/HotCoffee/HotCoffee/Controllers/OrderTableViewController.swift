//
//  OrderTableViewController.swift
//  HotCoffee
//
//  Created by 정진배 on 2021/01/13.
//

import UIKit

class OrderTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        populateOrders()
    }

    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
            fatalError("URL was incorrect")
            return
        }

        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        Webservice().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
