//
//  AlbumsTableViewController.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit


class AlbumsTableViewController: UITableViewController {
    
    var userId: Int!
    
    private var albums:[Album]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppRoot.shared.albumServise.loadAlbums(userId: userId, onSuccess: { albums in
            DispatchQueue.main.async {
                self.albums = albums
                self.tableView.reloadData()
            }
        }, onFail: { (error) in
            print(error)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let index = (sender as! IndexPath).row
        if let albums = self.albums {
            let album = albums[index]
            (segue.destination as! PhotoTableViewController).albumId = album.id
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showImage", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userCellAlbum = dequeueAlbumCell(fromTableView: tableView)!
        
        if let album = albums?[indexPath.row] {
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
