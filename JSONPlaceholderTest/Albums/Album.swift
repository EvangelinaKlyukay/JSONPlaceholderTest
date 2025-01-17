//
//  AlbumsScreen.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation


struct Album {
    let id: Int
    let title: String?
        
    init?(data: [String: Any]) {
        guard let id = data["id"] as? Int else {
            return nil
        }
        
        self.id = id
        self.title = data["title"] as? String
    }
    
}
