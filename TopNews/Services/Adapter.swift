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
    
     func printSmth()->SimpleArticle
}

class Adapter : AdapterProtocol{
    let imageService : ImageServiceProtocol
    init(imageService: ImageServiceProtocol){
        self.imageService = imageService
    }
    
    func printSmth()->SimpleArticle{
        print ("cvbhnjmk")
        return SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html")
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
