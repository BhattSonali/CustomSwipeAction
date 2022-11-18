//
//  ViewController.swift
//  CustomSwipeAction
//
//  Created by Mac on 14/10/22.
//  12 pro max

import UIKit

class User {
    let name: String
    var isFavorite: Bool
    var isMuted: Bool
    
    init (name: String,
          isFavorite: Bool,
          isMuted: Bool
    ) {
        self.name = name
        self.isFavorite = isFavorite
        self.isMuted = isMuted
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var users: [User] = [
        "Hasti",
        "Khushi",
        "Hritika",
        "Darshan",
        "Dev",
        "Eric",
        "Rob Smith"
    ].compactMap({
        User(name: $0,
             isFavorite: false,
             isMuted: false)
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        title = "Swipe Action"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
        
    }
    // table view functions
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.users.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let user = users[indexPath.row]
        
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = users[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = user.name
        
        return cell
    }


}

