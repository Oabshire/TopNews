//
//  NewsPresenter.swift
//  TopNews
//
//  Created by Onie on 01.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

protocol NewsViewProtocol: class {
    func success()
    func failure(error: Error?)
}

protocol NewsViewPresenterProtocol: class{
    init(view: NewsViewProtocol, networkService: NetworkManagerProtocol, coreDataService: CoreDataManagerProtocol)
    func downloadNews(country: String, category: String?, token:String) -> ()
    func saveNews(article:SimpleArticle)
    var articles:[SimpleArticle] {get set}
}

class NewsPresenter: NewsViewPresenterProtocol{
    
    weak var view: NewsViewProtocol?
    let networkService: NetworkManagerProtocol!
    let coreDataService :CoreDataManagerProtocol!
    var articles: [SimpleArticle] = []
    
    required init(view: NewsViewProtocol, networkService: NetworkManagerProtocol, coreDataService: CoreDataManagerProtocol) {
        self.view = view
        self.networkService = networkService
        self.coreDataService = coreDataService
    }
    
    func  downloadNews(country: String, category: String?, token:String) -> (){
        
        var parameters:[String:String] = [:]
        
        if let categoryForEndpoint  = category{
         parameters = ["country": country,"category": categoryForEndpoint,"apiKey":token]
        }else {
        parameters = ["country": country,"apiKey":token]
        }
        let endpoint = Endpoint(baseURL: "https://newsapi.org/", path: "v2/top-headlines", parameters: parameters)
        networkService.downloadNews(endpoint: endpoint,completion: {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let optionalArticles):
                guard let articles = optionalArticles else{
                    self.view?.failure(error: nil)
                    return
                }
                self.articles = articles
                self.view?.success()
            case .failure(let error):
                print(error)
                self.view?.failure(error: error)
            }
        })
    }
    
    func saveNews(article:SimpleArticle){
        coreDataService.saveFavoriteNews(article: article)
    }
}
