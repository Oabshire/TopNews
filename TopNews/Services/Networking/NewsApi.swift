//
//  NewsApi.swift
//  TopNews
//
//  Created by Onie on 03.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

protocol NewsAPIProtocol {
    
    func get(from endpoint: Endpoint,  completion: @escaping (Result<NewsModel, Error>) -> Void)
}

final class NewsAPI {
    
    private weak var networkService: NetworkProtocol!
    
    init(networkService: NetworkProtocol) {
        self.networkService = networkService
    }
}

extension NewsAPI: NewsAPIProtocol {
    
    func get(from endpoint: Endpoint, completion: @escaping (Result<NewsModel, Error>) -> Void) {
        networkService?.performTask(with: createRequest(endpoint), completion:{ [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let data):
                
                NewsParser.parse(data: data!, completion: { [weak self] result in
                    guard self != nil else {return}
                    switch result{
                    case .success(let newsModel):
                        completion(.success(newsModel))
                    case .failure(let error):
                        print("Parsing error")
                        completion(.failure(error))
                    }
                })
            case .failure( let error):
                completion(.failure(error))
            }
        })
    }
}
extension NewsAPI{
    private func createRequest(_ endpoint: Endpoint) -> URLRequest {
        var components = URLComponents(string: endpoint.baseURL + endpoint.path)
        
        var queryItems:[URLQueryItem] = []
        for params in endpoint.parameters{
            let oneQuerryItem = URLQueryItem(name: params.key, value: params.value)
            queryItems.append(oneQuerryItem)
        }
        
        components?.queryItems = queryItems
        
        let urlRequest = URLRequest(url:(components?.url!)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 120)
        
        print(urlRequest)
        
        return urlRequest
        
    }
}
