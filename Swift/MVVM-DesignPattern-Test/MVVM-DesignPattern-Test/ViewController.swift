//
//  ViewController.swift
//  MVVM-DesignPattern-Test
//
//  Created by EE201201 on 2020/12/24.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = TestViewModel()

    private let process: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Start"
        label.textColor = .white

        return label
    }()

    private let btn: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(onPressBtn(sender:)), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        process.text = viewModel.tit
    }

    private func setupLayout() {
        view.addSubview(process)
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            process.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            process.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -20),
        ])
    }

    @objc func onPressBtn(sender: UIButton) {
        print(11111)
        viewModel.changeProcessing(process: "Completed")
    }


}

