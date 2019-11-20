//
//  ViewController.swift
//  table-view
//
//  Created by Павел Усов on 19.11.2019.
//  Copyright © 2019 Pavel Usov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    private var tableData: [[String : Any]] = []
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableData = (1...10).map { ["isCheck": false, "title": "Невероятно огроменное дело под номером  0000-0000-000\($0)"] }
        
        todoTableView.dataSource = self
        todoTableView.refreshControl = refreshControl
        todoTableView.delegate = self
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }

    @objc private func refreshData(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableData = self.tableData.shuffled()
            self.todoTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func itemHandler(_ sender: UIBarButtonItem) {
        let isEditingNewState = !isEditing
        super.setEditing(isEditingNewState, animated: true)
        todoTableView.setEditing(isEditingNewState, animated: true)

        if isEditingNewState {
            navigationItem.leftBarButtonItem?.title = "Done"
            navigationItem.leftBarButtonItem?.style = .done
        } else {
            navigationItem.leftBarButtonItem?.title = "Edit"
            navigationItem.leftBarButtonItem?.style = .plain
        }
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var title = "Check"
        let isCheck: Bool = self.tableData[indexPath.row]["isCheck"] as! Bool
        
        if isCheck {
            title = "Uncheck"
        }
        
        
        let action = UIContextualAction(style: .normal, title: title) { (_, _, complection) in
            self.tableData[indexPath.row]["isCheck"] = !isCheck
            tableView.reloadRows(at: [indexPath], with: .automatic)
            complection(true)
        }
        
        action.backgroundColor =  isCheck ? .systemRed : .systemGreen
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        let item = tableData[indexPath.row]
        cell.labelView?.text = item["title"] as? String
        
        if let isCheck = item["isCheck"] as? Bool {
            if isCheck {
                cell.accessoryType = .checkmark
            }
        }
    
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                tableView.beginUpdates()
                tableView.deleteRows(at: [ indexPath ], with: .automatic)
                tableData.remove(at: indexPath.row)
                tableView.endUpdates()
            }
    }
}

