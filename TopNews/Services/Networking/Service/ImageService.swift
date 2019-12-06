//
//  ImageService.swift
//  TopNews
//
//  Created by Onie on 06.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

protocol ImageServiceProtocol{
    func downloadImage(urlString: String) -> UIImage
}

class ImageService: ImageServiceProtocol{
    func downloadImage(urlString: String) -> UIImage {
        let urlOpt = URL(string: urlString)
        if let url = urlOpt{
            do {
                let dataImage = try Data(contentsOf: url)
                return UIImage(data: dataImage) ?? #imageLiteral(resourceName: "Default")
            } catch {
                print("-------!!!!some IMAGE error!!!------")
                return #imageLiteral(resourceName: "Default")
            }
        }
        print("-------!!!!some IMAGE error2!!!------")
        return #imageLiteral(resourceName: "Default")
    }
}
