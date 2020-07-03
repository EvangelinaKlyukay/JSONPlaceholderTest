//
//  UserService.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class UserService {
    
    private let network: NetworkService
    private var users = [User]()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func loadUsers(onSuccess: (([User]) -> Void)?, onFail: ((Error) -> Void)?) {
        self.network.request(path: "/users", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            response.forEach {
                if let user: User = User(data: $0) {
                    self.add(user: user)
                }
            }
            onSuccess?(self.users)
            
        }, onFail: { (error) in onFail?(error) })
    }
    
    func user(by index: Int) -> User? {
        return users[index]
    }
    
    var usersCount: Int {
        get {
            return users.count
        }
    }
    
    func add(user: User) {
        users.append(user)
    }
}
