//
//  UserCell.swift
//  FireChat
//
//  Created by 정진배 on 2021/01/17.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {

    // MARK: - Properties
    var user: User? {
        didSet {
            configure()
        }
    }

    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 64 / 2
    }

    private let userNameLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.text = "Spiderman"
    }

    private let fullnameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.text = "Peter Parker"
    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(12)
            $0.size.equalTo(64)
        }

        let stack = UIStackView(arrangedSubviews: [userNameLabel, fullnameLabel])
        stack.axis = .vertical
        stack.spacing = 2

        addSubview(stack)
        stack.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.left.equalTo(profileImageView.snp.right).offset(12)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    func configure() {
        guard let user = user else { return }
        fullnameLabel.text = user.fullname
        userNameLabel.text = user.username

        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
        print("DEBUG: ", url)
    }

}
