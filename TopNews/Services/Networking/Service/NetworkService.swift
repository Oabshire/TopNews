//
//  NetworkService.swift
//  TopNews
//
//  Created by Onie on 03.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    
    func performTask(with request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void)
}

class NetworkService: NetworkProtocol{
    
    private let session: URLSession
    
    init(_ session: URLSession) {
        self.session = session
    }
    
    func performTask(with request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {return}
            completion(.success(data))
            print("Data is resived")
        }
        task.resume()
    }
}
