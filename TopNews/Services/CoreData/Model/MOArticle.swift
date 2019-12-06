//
//  MOArticle.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import Foundation
import CoreData

@objc(MOArticle)
internal class MOArticle: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var content: String
    @NSManaged var url: String
    @NSManaged var image: Data
}
