//
//  UserService.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol UserServiseDelegate: class {
    
    func usersUpdated(sender: UserService)
}

class UserService {
    
    weak var delegate: UserServiseDelegate?
    
    private let network: NetworkService
    private var users = [UserScreen]()
    
    init(network: NetworkService) {
        self.network = network
        self.network.request(path: "/users", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            response.forEach {
                let user: UserScreen = UserScreen(data: $0)
                self.add(user: user)
            }
            self.delegate?.usersUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
    
    func get(userByIndex index: Int) -> UserScreen? {
        return users[index]
    }
    
    func getUserCount() -> Int {
        return users.count
    }
    
    func add(user: UserScreen) {
        users.append(user)
    }
}
