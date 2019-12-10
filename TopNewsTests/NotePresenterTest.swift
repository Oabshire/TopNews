//
//  NotePresenterTest.swift
//  TopNewsTests
//
//  Created by Onie on 10.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import XCTest

class MockNoteView: NoteViewProtocol{
    func setNews() {}
}


class NotePresenterTest: XCTestCase {
    var view : MockNoteView!
    var coreDataService: MockCoreDataService!
    var presenter : NotePresenter!
    
    
    override func setUp() {
        view = MockNoteView()
        coreDataService = MockCoreDataService()
        presenter = NotePresenter(view: view, coreDataService: coreDataService)
        super.setUp()
    }
    
    override func tearDown() {
        view = nil
        coreDataService = nil
        presenter = nil
        super.tearDown()
    }
    
    func testDownloadNewsIsCorrect() {
        presenter.downloadNews()
        XCTAssertEqual(presenter.articles, [ SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html"),SimpleArticle(title: "Here’s the hard-money call for why the boom in the economy and stock market will continue - MarketWatch", description: "You might think the hard-money, recession-at-every-corner crowd would be predicting an imminent reversal in the stock market given the 20% gain for the Dow...", image: #imageLiteral(resourceName: "Default"), url: "https://www.marketwatch.com/story/heres-the-hard-money-call-for-why-the-boom-in-the-economy-and-stock-market-will-continue-2019-12-09") ])
    }
    
}
