//
//  ViewController.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit
import MessageUI

class UsersTableViewController: UITableViewController, UserServiseDelegate {
    
    var window: UIWindow?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.rowHeight = 150
            
            AppRoot.shared.userService.delegate = self
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return AppRoot.shared.userService.getUserCount()
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let user = AppRoot.shared.userService.get(userByIndex: indexPath.row)
            
            let userCell = dequeueUserCell(fromTableView: tableView)!
            
            if let user = user {
                userCell.userScreen = user
            }
            
            return userCell
        }
        
        func dequeueUserCell(fromTableView tableView: UITableView) -> UsersTableViewCell? {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Users") as? UsersTableViewCell {
                return cell
            }
            
            return nil
        }
    
    func usersUpdated(sender: UserService) {
         DispatchQueue.main.async {
             self.tableView.reloadData()
         }
         
    }
    
}