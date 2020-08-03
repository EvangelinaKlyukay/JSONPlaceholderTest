//
//  ImageTableViewController.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit


class PhotoTableViewController: UITableViewController {
    
    var albumId: Int!
    
    private var photos:[Photo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppRoot.shared.photoService.loadPhotos(albumId: albumId, onSuccess: { (photos) in
            DispatchQueue.main.async {
                self.photos = photos
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
         
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
        
                 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  
        let userCellPhoto = dequeueImageCell(fromTableView: tableView)!
                  
        if let photo = photos?[indexPath.row] {
                    
            userCellPhoto.photoScreen = photo
                    
        }
                
        return userCellPhoto
    }
             
    func dequeueImageCell(fromTableView tableView: UITableView) -> PhotoTableViewCell? {
        if let cellPhoto = tableView.dequeueReusableCell(withIdentifier: "Photos") as? PhotoTableViewCell {
            return cellPhoto
        }
        return nil
    }
}
