//
//  Adapter.swift
//  TopNews
//
//  Created by Onie on 06.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

protocol AdapterProtocol {
    func adapt(articleToAdapt: Article) -> SimpleArticle
}

class Adapter : AdapterProtocol{
    let imageService : ImageServiceProtocol
    init(){
        imageService = ImageService()
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
