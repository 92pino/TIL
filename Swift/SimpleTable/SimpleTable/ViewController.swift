//
//  ViewController.swift
//  SimpleTable
//
//  Created by JinBae Jeong on 2020/04/05.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let cellIdentifier: String = "cell"
  
  let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
  let english: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v" ,"w", "x", "y", "z"]
  
  var dates: [Date] = []
  
  let dateFormatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.dateStyle = .medium
    
    return formatter
  }()
  
  let timeFormatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.timeStyle = .medium
    
    return formatter
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView(frame: view.frame, style: .grouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    return tableView
  }()
  
  private let tableBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Add Data", for: .normal)
    button.addTarget(self, action: #selector(touchUpAddButton), for: .touchUpInside)
    button.setTitleColor(.red, for: .normal)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    tableView.delegate = self
    tableView.dataSource = self
    
    configure()
  }

  func configure() {
    let guide = view.safeAreaLayoutGuide
    [tableView, tableBtn].forEach{ view.addSubview($0) }
    
    tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reusableIdentifier)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      
      tableBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      tableBtn.topAnchor.constraint(equalTo: tableView.bottomAnchor),
      tableBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
    ])
  }
  
  @objc func touchUpAddButton(_ sender: UIButton) {
    dates.append(Date())
    
//    self.tableView.reloadData()
    tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return korean.count
    case 1:
      return english.count
    case 2:
      return dates.count
    default:
      return 0
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section < 2 {
      let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
      let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
      
      cell.textLabel?.text = text
      
      if indexPath.row == 1 {
        cell.backgroundColor = .red
      } else {
        cell.backgroundColor = .white
      }
      
      return cell
    } else {
      // dequeueReusableCell : queue에 쌓여있던 재사용 가능한 셀을 꺼내와서 재사용한다.
      guard let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reusableIdentifier, for: indexPath) as? CustomCell else {
        preconditionFailure("가져오기 실패")
      }
      
      if indexPath.row == 1 {
        cell.backgroundColor = .red
      } else {
        cell.backgroundColor = .white
      }
      
      cell.leftLabel.text = dateFormatter.string(from: dates[indexPath.row])
      cell.rightLabel.text = timeFormatter.string(from: dates[indexPath.row])
      
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = SecondViewController()
    vc.textToSet = String(indexPath.row)
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section < 2 {
      return section == 0 ? "한글" : "영어"
    }
    
    return nil
  }
  
}
