//
//  NewsPresenter.swift
//  TopNews
//
//  Created by Onie on 01.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

///The methods adopted by the object you use to implement the interaction between the View and Presenter.
protocol NewsViewProtocol: class {
    
    /// Function reload data adn shows news.
    func showNewsTable()
    
    
    /// This function show NoConnection text massage and refresh button.
    func showNoConnectionView()
}

///The methods adopted by the object that you use to implement the interaction between the Model and the View.
protocol NewsViewPresenterProtocol: class{
    init(view: NewsViewProtocol, networkService: NetworkManagerProtocol, coreDataService: CoreDataManagerProtocol)
    
    /**
      It calls the  **networkService’s** method **downloadNews**  and processes its response.
      - Parameters:
            - county: The country you want to see news about
            - category: News Categories: business, entertainment, health, science, sports, technology.
            - token: your apiKey for "NewsApi".
      */
    func downloadNews(country: String, category: String?, token:String) -> ()
    
    /// It calls **CoreDataService's** metod **saveFavoriteNews(article: String)**.
    /// - Parameter article:  Article wich you want to save in DataBase.
    func saveNews(article:SimpleArticle)
    
    var articles:[SimpleArticle] {get set}
}


///  The object that implements the interaction between the Model and the View.
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
                    self.view?.showNewsTable()
                    return
                }
                self.articles = articles
                self.view?.showNewsTable()
            case .failure(let error):
                print(error)
                self.view?.showNoConnectionView()
            }
        })
    }
    
    func saveNews(article:SimpleArticle){
        coreDataService.saveFavoriteNews(article: article)
    }
}
