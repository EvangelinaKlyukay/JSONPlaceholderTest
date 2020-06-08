//
//  UserScreen.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

struct User {
    
    let id: Int
    let name: String
    let email: String?
    let phone: String?
    let website: URL?
    
    init?(data: [String: Any]) {
        guard let id = data["id"] as? Int else {
            return nil
        }
        self.id = id
        guard let name = data["name"] as? String else {
            return nil
        }
        self.name = name
        self.email = data["email"] as? String
        self.phone = data["phone"] as? String
        self.website = URL(string: data["website"] as! String)
    }
}
