//
//  NetworkAssembler.swift
//  TopNews
//
//  Created by Onie on 03.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation


protocol NetworkManagerProtocol {
    func downloadNews(endpoint: Endpoint, completion: @escaping(Result<[SimpleArticle]?, Error>) -> ())
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    let networkSevice = NetworkService(URLSession(configuration: URLSessionConfiguration.default))
    let newsAPI:NewsAPI
    let checkConnection: NetworkConnectionServiceProtocol
    let adapter :AdapterProtocol
    
    private init() {
        newsAPI = NewsAPI(networkService: networkSevice)
        checkConnection = NetworkConnectionService()
        adapter = Adapter()
    }
    
    func downloadNews(endpoint: Endpoint, completion: @escaping(Result<[SimpleArticle]?, Error>) -> ()){
        if checkConnection.isConnectedToNetwork() == false{
            completion(.success(nil))
        }
        else{
            newsAPI.get(from: endpoint, completion: {result in
                switch result{
                case .success(let newsModel):
                    guard let articles = newsModel.articles else {
                        completion(.success([]))
                        return
                    }
                    var simpleArticles:[SimpleArticle] = []
                    for item in articles{
                        let simpleArticle = self.adapter.adapt(articleToAdapt: item)
                        simpleArticles.append(simpleArticle)
                    }
                    completion(.success(
                        simpleArticles))
                case .failure(let error):
                    print(error)
                    completion(.success([]))
                }
            })
        }
    } 
}

