//
//  ImageTableViewController.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit


class PhotoTableViewController: UITableViewController {
    
    var album: Album!
    
    private var photos:[Photo]?
    
    func photosUpdated(photos: [Photo]) {
        DispatchQueue.main.async {
            self.album.set(photos: photos)
            self.tableView.reloadData()
        }
    }
    
    func photoLoadFailed(error: Error) {
              print(error)
          }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        AppRoot.shared.photoService.loadPhotos(albumId: album.id, onSuccess: photosUpdated, onFail: photoLoadFailed)
    }
         
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.getPhotosCount()
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
