
  TopNewsTests.swift
  TopNewsTests

  Created by Onie on 01.12.2019.
  Copyright © 2019 Onie. All rights reserved.


import XCTest
@testable import TopNews

class MockView: NewsViewProtocol{
    var articles: [Article]?
    func setArticles(articles: [Article]) {
        self.articles = articles
    }
}

class NewsPresenterTest: XCTestCase {

    var view : MockView!
    var news: NewsModel!
    var presenter: NewsPresenter!

    override func setUp() {
        view = MockView()
        news = NewsModel(articles:[Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", url: nil, urlToImage: nil) , Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "China's factory activity expands at quickest pace in almost three years - Fox Businessdfkgnrtkhn ferhgortng w noerjrthbewvwe er eorj  erg  trjh p't jhg", url: nil, urlToImage: nil) , Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Many firms have no contingency plans should US-China trade war worsen, DHL survey says - CNBC", url: nil, urlToImage: nil)], status: "ok", totalResults: 3)

        presenter = NewsPresenter(view: view, news: news)
    }

    override func tearDown() {
        view = nil
        news = nil
        presenter = nil
    }

    func testModuleIsNotNilTest(){
        XCTAssertNotNil(view, "View is not nil")
        XCTAssertNotNil(news, "Model is not nil")
        XCTAssertNotNil(presenter, "Presenter is not nil")

    }

    func testView(){
        presenter.downloadNews()
        XCTAssertEqual(view.articles, [Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", url: nil, urlToImage: nil) , Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "China's factory activity expands at quickest pace in almost three years - Fox Businessdfkgnrtkhn ferhgortng w noerjrthbewvwe er eorj  erg  trjh p't jhg", url: nil, urlToImage: nil) , Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Many firms have no contingency plans should US-China trade war worsen, DHL survey says - CNBC", url: nil, urlToImage: nil)])
    }
}
