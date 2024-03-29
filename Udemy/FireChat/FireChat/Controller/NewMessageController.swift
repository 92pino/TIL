//
//  NewMessageController.swift
//  FireChat
//
//  Created by 정진배 on 2021/01/17.
//

import UIKit

private let reuseIdentifier = "UserCell"

protocol NewMessageControllerDelegate: class {
    func controller(_ controller: NewMessageController, wantsToStartChatWith user: User)
}

class NewMessageController: UITableViewController {

    // MARK: - Properties
    private var users = [User]()
    weak var delegate: NewMessageControllerDelegate?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        fetchUsers()
    }

    // MARK: - Selector
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - API
    func fetchUsers() {
        Service.fetchUsers { users in
            self.users = users

            self.tableView.reloadData()
        }
    }

    // MARK: - Helpers
    func configureUI() {
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))

        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }

}

// MARK: - NewMessageControllerDataSource

extension NewMessageController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.user = users[indexPath.row]
        print("DEBUG: Index row is \(indexPath.row)")
        print("DEBUG: User in arrray is \(users[indexPath.row].username)")
        return cell
    }
}

// MARK: - NewMessageControllerDelegate

extension NewMessageController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.controller(self, wantsToStartChatWith: users[indexPath.row])
    }
}
