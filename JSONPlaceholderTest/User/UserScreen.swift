//
//  UserScreen.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class UserScreen {
    
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
    let website: String?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int
        self.name = data["name"] as? String
        self.email = data["email"] as? String
        self.phone = data["phone"] as? String
        self.website = data["website"] as? String
    }
}
