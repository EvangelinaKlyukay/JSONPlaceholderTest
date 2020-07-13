//
//  AlbumService.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class AlbumService {
    
    private let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func loadAlbums(userId: Int, onSuccess: (([Album]) -> Void)?, onFail: ((Error) -> Void)?) {
        self.network.request(path: "/users/\(userId)/albums", parameters: [:], onSuccess: { (response) in
            if response.count == 0{
                return
            }
            
            var albums: [Album] = []
            
            response.forEach {
                let album: Album = Album(data: $0)!
                albums.append(album)
            }
            
            onSuccess?(albums)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
}
