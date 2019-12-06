//
//  NewsAPIParser.swift
//  TopNews
//
//  Created by Onie on 03.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation


class NewsParser{
    
    
    static func parse(data: Data, completion: @escaping (Result<NewsModel, Error>) -> Void){
        do{
            let jsonData = try JSONDecoder().decode(NewsModel.self, from: data)
            
            completion(.success (jsonData))
        }catch{
            print(error)
            completion(.failure(error))
        }
    }
}
