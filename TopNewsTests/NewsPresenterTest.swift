
//  TopNewsTests.swift
//  TopNewsTests
//
//  Created by Onie on 01.12.2019.
//  Copyright © 2019 Onie. All rights reserved.


import XCTest
import CoreData
@testable import TopNews

struct SimpleAtricle {
    var title: String
    var description: String
    var image: UIImage
    var url: String
}

class MockView: NewsViewProtocol{
    func showNewsTable() {}
    
    func showNoConnectionView() {}
}

class MockNetworkManager: NetworkManagerProtocol{
    func downloadNews(endpoint: Endpoint, completion: @escaping (Result<[SimpleArticle]?, Error>) -> ()) {
        let article = [SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html"), SimpleArticle(title: "Here’s the hard-money call for why the boom in the economy and stock market will continue - MarketWatch", description: "You might think the hard-money, recession-at-every-corner crowd would be predicting an imminent reversal in the stock market given the 20% gain for the Dow...", image: #imageLiteral(resourceName: "Default"), url: "https://www.marketwatch.com/story/heres-the-hard-money-call-for-why-the-boom-in-the-economy-and-stock-market-will-continue-2019-12-09")]
        completion (.success(article))
    }
}

class MockCoreDataService: CoreDataManagerProtocol{
    func readFavorites() -> [SimpleArticle] {
        let articles = [ SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html"),SimpleArticle(title: "Here’s the hard-money call for why the boom in the economy and stock market will continue - MarketWatch", description: "You might think the hard-money, recession-at-every-corner crowd would be predicting an imminent reversal in the stock market given the 20% gain for the Dow...", image: #imageLiteral(resourceName: "Default"), url: "https://www.marketwatch.com/story/heres-the-hard-money-call-for-why-the-boom-in-the-economy-and-stock-market-will-continue-2019-12-09") ]
        return articles
    }
    
    func saveFavoriteNews(article: SimpleArticle) {
    }
    
    func deleteFavoriteNews(indexPath: IndexPath) {
    }
}

class NewsPresenterTest: XCTestCase {
    var simpleArticle: SimpleArticle!
    var view : MockView!
    var networkService: MockNetworkManager!
    var coreDataService: MockCoreDataService!
    var presenter: NewsViewPresenterProtocol!
    
    override func setUp() {
        view = MockView()
        networkService = MockNetworkManager()
        coreDataService = MockCoreDataService()
        presenter = NewsPresenter(view: view, networkService: networkService, coreDataService:  coreDataService)
        super.setUp()
    }
    
    override func tearDown() {
        view = nil
        networkService = nil
        coreDataService = nil
        super.tearDown()
    }
    
    func testModuleIsNotNilTest(){
        XCTAssertNotNil(view, "View is not nil")
        XCTAssertNotNil(presenter, "Presenter is not nil")
    }
    
    func testPreseterSetsCorrectArticle(){
        presenter.downloadNews(country: "some country", category: nil, token: "rjgktelf;e")
            XCTAssertEqual(presenter.articles, [ SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html"), SimpleArticle(title: "Here’s the hard-money call for why the boom in the economy and stock market will continue - MarketWatch", description: "You might think the hard-money, recession-at-every-corner crowd would be predicting an imminent reversal in the stock market given the 20% gain for the Dow...", image: #imageLiteral(resourceName: "Default"), url: "https://www.marketwatch.com/story/heres-the-hard-money-call-for-why-the-boom-in-the-economy-and-stock-market-will-continue-2019-12-09")])
    }
}
