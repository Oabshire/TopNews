//
//  DetailPresenterTest.swift
//  TopNewsTests
//
//  Created by Onie on 10.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import XCTest
class MockDetailView: DetailViewProtocol {
    var article: SimpleArticle?
    
    func setArticle(article: SimpleArticle?) {
        self.article = article
    }
    
}
class DetailPresenterTest: XCTestCase {
    
    var view: MockDetailView!
    var presenter: DetailPresenterProtocol!
    var article: SimpleArticle!
    
    override func setUp() {
        //arrange
        article = SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html")
        view = MockDetailView()
        presenter = DetailPresenter(view: view, article: article)
        super.setUp()
    }
    
    override func tearDown() {
        article = nil
        view = nil
        presenter = nil
        super.tearDown()
    }
    
    func testDetailSetsValueCorrect(){
        //act
        presenter.setArticle()
        
        //assetn
        XCTAssertEqual(view.article, SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html") )
    }
    
}
