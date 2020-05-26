//
//  AlbumsTableViewCell.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {

    @IBOutlet var imagePreviewAlbums: WebImageView!
    @IBOutlet var titleLabelAlbums: UILabel!
    
    var albumScreen: Album? {
        didSet {
            titleLabelAlbums.text = albumScreen?.title!
            //imagePreviewAlbums.load(url: imagePreviewAlbums!.url!)
            
        }
    }
    
}
