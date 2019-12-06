//
//  ModelNews.swift
//  TopNews
//
//  Created by Onie on 01.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation

// MARK: - NewsFeedAPIModel
struct NewsModel: Codable{
    var articles: [Article]?
    let status: String
    let totalResults: Int
    
    init() {
        self.status = "bad"
        self.totalResults = 0
        self.articles = nil
    }
    init(articles: [Article]?, status: String, totalResults: Int){
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
}

// MARK: - Article
struct Article: Codable, Equatable{
    
    let author: String?
    let content: String?
    let description: String?
    let publishedAt: String?
    let source: Source?
    let title: String?
    let url: String?
    let urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case description
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable, Equatable {
    let id: String?
    let name: String?
}

//let article = Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", url: nil, urlToImage: nil)
//      let article1 = Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "China's factory activity expands at quickest pace in almost three years - Fox Businessdfkgnrtkhn ferhgortng w noerjrthbewvwe er eorj  erg  trjh p't jhg", url: nil, urlToImage: nil)
//      let article2 = Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Many firms have no contingency plans should US-China trade war worsen, DHL survey says - CNBC", url: nil, urlToImage: nil)
