//
//  AlbumsTableViewCell.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabelAlbums: UILabel!
    @IBOutlet var photoPreviewAlbums: WebImageView!
   
    private var photos: [Photo] = []
    
    var albumScreen: Album? {
        didSet {
//            self.backgroundColor = UIColor.yellow;
//            self.photoPreviewAlbums.backgroundColor = UIColor.red;
//            self.titleLabelAlbums.backgroundColor = UIColor.green;
//
            guard let album = self.albumScreen else {
                self.titleLabelAlbums.text = "undefined"
                return
            }

            titleLabelAlbums.text = album.title

            AppRoot.shared.photoService.loadPhotos(albumId: album.id, onSuccess: { [weak self, albumId = album.id] (photos) in
                if self?.albumScreen?.id != albumId { return }

                self?.photos = photos

                if let firstUrl = photos.first?.thumbnailUrl {
                    self?.photoPreviewAlbums.load(url: firstUrl)
                }

            }, onFail: { (error) in
                print(error)
            })
        }
    }
}
