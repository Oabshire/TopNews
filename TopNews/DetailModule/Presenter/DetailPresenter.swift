//
//  DetailPresenter.swift
//  TopNews
//
//  Created by Onie on 04.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

protocol  DetailViewProtocol: class {
    func setArticle(article: SimpleArticle?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, article: SimpleArticle?)
    func setArticle()
}

class DetailPresenter: DetailViewPresenterProtocol{
    
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
