//
//  CustomInputAccessoryView.swift
//  FireChat
//
//  Created by 정진배 on 2021/01/18.
//

import UIKit

protocol CustomInputAccessoryViewDelegate: class {
    func inputView(_ inputView: CustomInputAccessoryView, wantsToSend message: String)
}

class CustomInputAccessoryView: UIView {

    // MARK: - Properties

    weak var delegate: CustomInputAccessoryViewDelegate?

    let messageInputTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isScrollEnabled = false

        return tv
    }()

    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemPurple, for: .normal)
        button.addTarget(self, action: #selector(handleSendMessage), for: .touchUpInside)

        return button
    }()

    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Message"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray

        return label
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        autoresizingMask = .flexibleHeight
        backgroundColor = .white

        layer.shadowOpacity = 0.25
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: -8)
        layer.shadowColor = UIColor.lightGray.cgColor

        addSubview(sendButton)
        sendButton.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(4)
            $0.trailing.equalTo(self.snp.trailing).offset(-8)
            $0.size.equalTo(50)
        }

        addSubview(messageInputTextView)
        messageInputTextView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(12)
            $0.leading.equalTo(self.snp.leading).offset(4)
            $0.trailing.equalTo(sendButton.snp.leading).offset(-8)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }

        addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints {
            $0.leading.equalTo(messageInputTextView.snp.leading).offset(4)
            $0.centerY.equalTo(messageInputTextView.snp.centerY) 
        }

        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    override var intrinsicContentSize: CGSize {
        return .zero
    }

    // MARK: - Selectors

    @objc func handleSendMessage() {
        guard let message = messageInputTextView.text else { return }
        delegate?.inputView(self, wantsToSend: message)
    }

    @objc func handleTextInputChange() {
        placeholderLabel.isHidden = !self.messageInputTextView.text.isEmpty
    }

}
