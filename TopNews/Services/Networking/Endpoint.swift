//
//  Endpoint.swift
//  TopNews
//
//  Created by Onie on 02.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation



///The structure that describes the endpoint.
struct Endpoint {
    var baseURL: String
    var path: String
    var parameters: [String:String]
}
