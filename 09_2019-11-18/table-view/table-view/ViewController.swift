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
    
    private var tableData: [String] = []
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableData = (0...30).map { "Row \($0)" }
        
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
        print("did select \(indexPath)")
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
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

