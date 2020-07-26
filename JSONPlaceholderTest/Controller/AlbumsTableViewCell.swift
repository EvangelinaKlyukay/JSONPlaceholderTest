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
   
    
    var albumScreen: Album? {
        didSet {
            titleLabelAlbums.text = albumScreen?.title!
            let photo = albumScreen?.get(photoIndex: 0)
            photoPreviewAlbums.load(url: (photo?.thumbnailUrl)!)
        }
    }
}
