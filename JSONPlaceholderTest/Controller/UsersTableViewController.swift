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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppRoot.shared.userService.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let index = (sender as! IndexPath).row
        let user = AppRoot.shared.userService.user(by: index)
        (segue.destination as! AlbumsTableViewController).userId = user!.id!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showAlbum", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppRoot.shared.userService.userCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = AppRoot.shared.userService.user(by: indexPath.row)
        
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
