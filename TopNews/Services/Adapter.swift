//
//  Adapter.swift
//  TopNews
//
//  Created by Onie on 06.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

///This protocol defines the methods that the **Adapter** class must have.
protocol AdapterProtocol {
    
    /// A function that turns an article into a simple article
    /// - Parameter articleToAdapt: An article to turn into a simple article.
    func adapt(articleToAdapt: Article) -> SimpleArticle
}

class Adapter : AdapterProtocol{
    let imageService : ImageServiceProtocol
    init(){
        imageService = ImageWebService()
    }
    func adapt(articleToAdapt: Article) -> SimpleArticle{
        let title = articleToAdapt.title ?? ""
        let description = articleToAdapt.description ?? ""
        let image = imageService.downloadImage(urlString: articleToAdapt.urlToImage ?? "")
        let url = articleToAdapt.url ?? ""
        
        let simpleArticle = SimpleArticle(title: title, description: description, image: image, url: url)
        return simpleArticle
    }
}
