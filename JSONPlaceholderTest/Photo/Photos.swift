//
//  Photos.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 13.07.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class Photo {
    
    let albumId: Int?
    let title: String?
    let url: URL?
    let thumbnailUrl: URL?
    
    init(data: [String: Any]) {
        self.albumId = data["albumId"] as? Int
        self.title = data["title"] as? String
        self.url = URL(string: data["url"] as! String)
        self.thumbnailUrl = URL(string: data["thumbnailUrl"] as! String)
    }
    
}
