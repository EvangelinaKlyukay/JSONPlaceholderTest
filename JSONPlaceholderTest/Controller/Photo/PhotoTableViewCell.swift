//
//  AlbumTableViewCell.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 13.07.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit


class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: WebImageView!
    @IBOutlet weak var titlePhoto: UILabel!
    
    weak var photos: Photo? {
        didSet {
            titlePhoto.text = photos?.title!
            photo.load(url: photos!.url!)
        }
    }
}
