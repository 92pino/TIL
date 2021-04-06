//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by EE201201 on 2021/03/31.
//

import UIKit

class CustomTabBarItem: UIView {

    let image: UIImage
    let title: String

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tabImageView: UIImageView = {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init(tabBarItem item: UITabBarItem) {
        guard let selecteImage = item.image else {
            fatalError("You should set image to all view controllers")
        }

        self.image = selecteImage
        self.title = item.title ?? ""
        super.init(frame: .zero)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        [titleLabel, tabImageView].forEach { self.addSubview($0) }

        NSLayoutConstraint.activate([
            tabImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tabImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tabImageView.heightAnchor.constraint(equalToConstant: 25),
            tabImageView.widthAnchor.constraint(equalToConstant: 25),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 66),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
    }

}
