//
//  ImageService.swift
//  TopNews
//
//  Created by Onie on 06.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

///This protocol defines the methods that the ** ImageWebService** class must have.
protocol ImageServiceProtocol{
    
    /// This function download image and return it or Default Image.
    /// - Parameter urlString: String representation of url on which the Image is located
    func downloadImage(urlString: String) -> UIImage
}

class ImageWebService: ImageServiceProtocol{
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
