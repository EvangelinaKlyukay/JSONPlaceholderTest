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
    
    private var albums: [Int: [Album]] = [:]
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func loadAlbums(userId: Int, onSuccess: (([Album]) -> Void)?, onFail: ((Error) -> Void)?) {
        if let albums = self.albums[userId] {
            onSuccess?(albums)
            return
        }
        
        self.network.request(path: "/users/\(userId)/albums", parameters: [:], onSuccess: { (response) in
            var albums: [Album] = []
            
            if (response.count > 0) {
                response.forEach {
                    let album: Album = Album(data: $0)!
                    albums.append(album)
                }
            }
            
            self.albums[userId] = albums
            onSuccess?(albums)
            
        }, onFail: onFail)
    }
}
