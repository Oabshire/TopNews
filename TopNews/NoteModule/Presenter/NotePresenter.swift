//
//  NotePresenter.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import CoreData


/// The methods adopted by the object you use to implement the interaction between the View and Presenter.
protocol NoteViewProtocol: class {
    
    /// A function that peroal the table to display actual information from the database
    func setNews()
}


/// The methods adopted by the object that you use to implement the interaction between the Model and the View.
protocol NoteViewPresenterProtocol: class{
    init(view: NoteViewProtocol, coreDataService: CoreDataManagerProtocol)
    
    
    /// Function that reads data from a database and display it.
    func downloadNews()
    
    
    /// Function that deletes data from a database.
    /// - Parameter indexPath: indexPath where is the data to be deleted.
    func deleleNews(indexPath: IndexPath)
    
    
    /// Array where data from the database is saved
    var articles:[SimpleArticle] {get set}
}

///  The object that implements the interaction between the Model and the View.
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
        let articles =  coreDataService.readFavorites()
        self.articles = articles
        self.view?.setNews()
    }
    
    func deleleNews(indexPath: IndexPath){
        coreDataService.deleteFavoriteNews(indexPath:indexPath)
        self.articles.remove(at: indexPath.row)
    }
    
}

