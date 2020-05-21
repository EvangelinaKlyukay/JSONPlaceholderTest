//
//  AlbumsTableViewController.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit


class AlbumsTableViewController: UITableViewController, AlbumServiceDelegate {
    
    var userId: Int!
    var albums: User!
    
    func albumsUpdated(sender: AlbumService) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppRoot.shared.albumServise.dalegate = self
        AppRoot.shared.albumServise.loadAlbums(userId: self.userId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let index = (sender as! IndexPath).row
        let album = AppRoot.shared.userService.user(by: index)
        (segue.destination as! ImageTableViewController).album = album!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showImage", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.getAlbumsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let album = albums.get(albumIndex: indexPath.row)
        
        let userCellAlbum = dequeueAlbumCell(fromTableView: tableView)!
        
        if let album = album {
            userCellAlbum.albumScreen = album
        }
        
        return userCellAlbum
    }
    
    func dequeueAlbumCell(fromTableView tableView: UITableView) -> AlbumsTableViewCell? {
        if let cellAlbum = tableView.dequeueReusableCell(withIdentifier: "Albums") as? AlbumsTableViewCell {
            return cellAlbum
        }
        
        return nil
    }
    
    
}
