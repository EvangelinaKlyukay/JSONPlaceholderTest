//
//  NetworkService.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class NetworkService {
    
    typealias RequestSuccessHandler = ([[String: Any]]) -> Void
    typealias RequestErrorHandler = (Error) -> Void
    
    enum HTTPMethod: String {
        case get = "GET"
    }
    
    private let urlSession = URLSession.shared
    private let serverUrl: URL
    
    init(serverUrl: URL) {
        self.serverUrl = serverUrl
    }
    
    func request(path: String, parameters: [String: Any], onSuccess: RequestSuccessHandler?, onFail: RequestErrorHandler?) {
        
        var components = URLComponents(url: self.serverUrl, resolvingAgainstBaseURL: true)
        components?.path = path
        
        guard let url = components?.url else {
            invoke(errorHandler: onFail, withDescription: "Malformed @components")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let task = self.urlSession.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if let error = error {
                onFail?(error)
                return
            }
            
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                self.invoke(errorHandler: onFail, withDescription: "Malformed response @data")
                return
            }
            
            let answer: [[String: Any]]
            
            if json is [String: Any] {
                answer = [json as! [String: Any]]
            } else if json is [[String: Any]] {
                answer = json as! [[String: Any]]
            } else {
                self.invoke(errorHandler: onFail, withDescription: "Malformed response @json")
                return
            }
            
            onSuccess?(answer)
        })
        
        task.resume()
    }
    
    private func invoke(errorHandler: RequestErrorHandler?, withDescription description: String) {
        let error = NSError(
            domain: "NetworkManager",
            code: -1,
            userInfo: [ NSLocalizedDescriptionKey: description ]
        )
        errorHandler?(error)
    }
    
}

