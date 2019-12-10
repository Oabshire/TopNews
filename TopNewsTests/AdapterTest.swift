//
//  AdapterTest.swift
//  TopNewsTests
//
//  Created by Onie on 10.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import XCTest


class MockImageService : ImageServiceProtocol{
     func downloadImage(urlString: String?) -> UIImage {
        
         return #imageLiteral(resourceName: "Default")
     }
 }

class AdapterTest: XCTestCase {
    var imageService: MockImageService!
    var adapter: AdapterProtocol!
    
    override func setUp() {
        super.setUp()
        imageService = MockImageService()
        adapter = Adapter(imageService: imageService)
    }

    override func tearDown() {
        imageService = nil
        adapter = nil
        super.tearDown()
    }

    func testAdapterReturnsCorrectValue() {
        let str = adapter.printSmth()
        XCTAssertEqual(str,SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: "https://www.cnn.com/2019/12/09/investing/premarket-stocks-trading/index.html"))
//        let article = Article(author: "qer", content: "You wont find Apple TV 4K, or Apple Watch Series 3 deals, though\r\nPhoto by Vjeran Pavic / The Verge\r\nUpdated 10:46AM ET, December 1st: Amazon now has stock of the seventh-generation iPad in gold and space grey for $229, so weve added that below.\r\nBlack Friday… [+4960 chars]", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", publishedAt: nil, source: nil, title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", url: nil, urlToImage: nil)
//        let result = adapter.adapt(articleToAdapt: article)
//        
//        XCTAssertEqual(result, SimpleArticle(title: "Apple Cyber Monday deals: MacBook Air, iPad, Apple Watch Series 5, HomePod, AirPods - The Verge", description: "It’s been surprisingly easy to find good Black Friday deals on recent Apple products, and that remains mostly true for Cyber Monday. You can still find big discounts on the seventh-generation iPad, MacBook Air and Pro, and more.", image: #imageLiteral(resourceName: "Default"), url: ""))
    }
}
