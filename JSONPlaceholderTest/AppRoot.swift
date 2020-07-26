//
//  AppRoot.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation


class AppRoot {
    
    private static let serverAddress = "https://jsonplaceholder.typicode.com"
    
    //TODO: Может перенести в AppDelegate? Спросить у Ильи как это лучше сделать.
    public static let shared = AppRoot()
    
    var userService: UserService
    var albumServise: AlbumService
    var photoService: PhotoService
    
    private let network: NetworkService?
    
    private init () {
        if let serverUrl = URL(string: AppRoot.serverAddress) {
            network = NetworkService(serverUrl: serverUrl)
        } else {
            network = nil
            
            fatalError("Can't initialize network with url:\(AppRoot.serverAddress)")
        }
        
        userService = UserService(network: network!)
        albumServise = AlbumService(network: network!)
        photoService = PhotoService(network: network!)
        
    }
}
