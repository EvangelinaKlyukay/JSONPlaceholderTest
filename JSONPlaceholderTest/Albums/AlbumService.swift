//
//  AlbumService.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 18.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol AlbumServiceDelegate: class {
    
    func albumsUpdated(sender: AlbumService)
    
}

class AlbumService {
    
    weak var dalegate: AlbumServiceDelegate?
    
    private let network: NetworkService
    private var albums = [AlbumsScreen]()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func loadAlbums(userId: Int) {
        self.network.request(path: "/users/\(userId)/albums", parameters: [:], onSuccess: { (response) in
            if response.count == 0{
                return
            }
            var albums: [AlbumsScreen] = []
            
            response.forEach {
                let album: AlbumsScreen = AlbumsScreen(data: $0)
                albums.append(album)
            }
            self.albums = albums
            self.dalegate?.albumsUpdated(sender: self)
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
}
