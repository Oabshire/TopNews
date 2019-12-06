//
//  NotePresenter.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import CoreData


protocol NoteViewProtocol: class {
    func setNews()
}

protocol NoteViewPresenterProtocol: class{
    init(view: NoteViewProtocol, coreDataService: CoreDataManagerProtocol)
    func downloadNews()
    func deleleNews(indexPath: IndexPath)
    
    var articles:[SimpleArticle] {get set}
}

class NotePresenter: NoteViewPresenterProtocol{
    
    weak var view: NoteViewProtocol?
    let coreDataService: CoreDataManagerProtocol!
    var articles: [SimpleArticle] = []
    
    required init(view: NoteViewProtocol, coreDataService: CoreDataManagerProtocol) {
        self.view = view
        self.coreDataService = coreDataService
    }
    
    func downloadNews(){
        print("______PresenterDowloadedNews_______")
//        let articles =  coreDataService.readFavorites()
//        self.articles = articles
//
//
        let fetchedResultsController: NSFetchedResultsController<MOArticle> = {
            let controller = coreDataService.getFetchedResultsController()
            return controller
        }()
        
        if let fetchedResults = fetchedResultsController.fetchedObjects {
            print(fetchedResults.count)
            articles = []
            var counter = 0
            for item in fetchedResults {
                let title = item.title
                let description = item.content
                let url = item.url
                let image = UIImage(data:item.image) ?? #imageLiteral(resourceName: "Default")
                
                let currentArticle = SimpleArticle(title: title, description: description, image: image, url: url)
                
                self.articles.append(currentArticle)
                
                counter = counter + 1
            }
            self.view?.setNews()
        }
    }
    func deleleNews(indexPath: IndexPath){
        coreDataService.deleteFavoriteNews(indexPath:indexPath)
        self.articles.remove(at: indexPath.row)
    }
    
    //    func downloadNews()->() {
    //        print("______PresenterDowloadedNews_______")
    //        let articles =  coreDataService.readFavorites()
    //
    //        self.view?.setNews(articles: articles)
    //    }
    
}

