//
//  MessageCell.swift
//  FireChat
//
//  Created by 정진배 on 2021/01/18.
//

import UIKit

class MessageCell: UICollectionViewCell {

    // MARK: - Properties

    var message: Message? {
        didSet { configure() }
    }

    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 32 / 2
    }

    private let textView = UITextView().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16)
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.textColor = .white
        $0.text = "Test Message"
    }

    private let bubbleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        view.layer.cornerRadius = 12

        return view
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(8)
            $0.bottom.equalTo(self.snp.bottom).offset(-4)
            $0.size.equalTo(32)
        }

        addSubview(bubbleContainer)
        bubbleContainer.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
            $0.width.lessThanOrEqualTo(250)
        }

        bubbleContainer.addSubview(textView)
        textView.snp.makeConstraints {
            $0.top.equalTo(bubbleContainer.snp.top).offset(4)
            $0.leading.equalTo(bubbleContainer.snp.leading).offset(12)
            $0.bottom.equalTo(bubbleContainer.snp.bottom).offset(-4)
            $0.trailing.equalTo(bubbleContainer.snp.trailing).offset(-12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func configure() {
        guard let message = message else { return }
        let viewModel = MessageViewModel(message: message)

        bubbleContainer.backgroundColor = viewModel.messageBackgroundColor
        textView.textColor = viewModel.messageTextColor
        textView.text = message.text
    }

}
