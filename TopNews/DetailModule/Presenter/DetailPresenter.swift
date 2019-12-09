//
//  DetailPresenter.swift
//  TopNews
//
//  Created by Onie on 04.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

///The methods adopted by the object you use to implement the interaction between the View and Presenter.
protocol  DetailViewProtocol: class {
    
    /// This function set data to self article.
    /// - Parameter article: article to set.
    func setArticle(article: SimpleArticle?)
}

///The methods adopted by the object that you use to implement the interaction between the Model and the View.
protocol DetailPresenterProtocol: class {
    init(view: DetailViewProtocol, article: SimpleArticle?)
    func setArticle()
}

///  The object that implements the interaction between the Model and the View.
class DetailPresenter: DetailPresenterProtocol{
    
    weak var view: DetailViewProtocol?
    let article: SimpleArticle?
    
    required init(view: DetailViewProtocol, article: SimpleArticle?) {
        self.view = view
        self.article = article
    }
    
    public func setArticle() {
        self.view?.setArticle(article: article)
    }
    
    
}
