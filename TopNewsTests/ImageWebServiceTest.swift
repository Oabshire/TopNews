//
//  ImageWebServiceTest.swift
//  TopNewsTests
//
//  Created by Onie on 10.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import XCTest

class ImageWebServiceTest: XCTestCase {

    var imageWebService: ImageServiceProtocol!
    
    override func setUp() {
        //arrange
        imageWebService = ImageWebService()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLoadImageWithValidUrl() {
        //act
        let resultImage = imageWebService.downloadImage(urlString: "https://static01.nyt.com/images/2019/12/10/world/10chezch1/10chezch1-facebookJumbo.jpg")
        //assert
        XCTAssertNotNil(resultImage)
    }

    func testLoadImageWithInvalidUrl() {
        //act
        let resultImage = imageWebService.downloadImage(urlString: "InvalidURL")
        //assert
        XCTAssertEqual(resultImage, #imageLiteral(resourceName: "Default") )
    }
}

