//
//  NetworkService.swift
//  TopNews
//
//  Created by Onie on 03.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

/// This protocol defines the methods that the **NetworkService** class must have.
protocol NetworkProtocol: AnyObject {
    
    /// Initializer of class
    /// - Parameter session: the session in which the task will work
    init(_ session: URLSession)
    
    ///The function that forms and resumes the task
    /// - Parameters:
    ///   - request: request for download data
    ///   - completion: can be **Data?** or **Error**
    func performTask(with request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void)
}

class NetworkService: NetworkProtocol{
    
    private let session: URLSession
    
    required init(_ session: URLSession) {
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
