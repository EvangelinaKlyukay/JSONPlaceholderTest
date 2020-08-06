//
//  PhotoViewController.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 06.08.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photos: Photo?
    
    @IBOutlet weak var photoImage: WebImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImage.load(url: (photos?.url)!)
    }    
}
