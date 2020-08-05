//
//  PhotoService.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 13.07.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class PhotoService {
    
    private let network: NetworkService
    
    private var photos: [Int: [Photo]] = [:] // self.photos[albumId] -> [Photo]
    
    init(network: NetworkService) {
        
        self.network = network
        
    }
    
    func loadPhotos(albumId: Int, onSuccess: (([Photo]) -> Void)?, onFail: ((Error) -> Void)?) {
        
        if let photos = self.photos[albumId] {
            onSuccess?(photos)
            return
        }
        
        self.network.request(path: "/albums/\(albumId)/photos", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            var photos: [Photo] = []
            
            response.forEach {
                let image: Photo = Photo(data: $0)
                photos.append(image)
            }
            onSuccess?(photos)
            
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
}
