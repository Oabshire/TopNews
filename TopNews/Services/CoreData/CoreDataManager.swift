//
//  CoreDataManager.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import CoreData


/// This protocol defines the methods that the **CoreDataManagerProtocol** class must have.
protocol CoreDataManagerProtocol {
    
    ///Function that reads data from a database.
    func readFavorites()-> [SimpleArticle]
    
    
    /// A function that saves data to a database.
    /// - Parameter article: Data to be saved.
    func saveFavoriteNews(article: SimpleArticle)
    
    
    /// Function that deletes data from a database.
    /// - Parameter indexPath: Data to be deleted.
    func deleteFavoriteNews(indexPath: IndexPath)
}


class CoreDataManager {
    
    public static let shared = CoreDataManager()
    private let stack = CoreDataStack.shared
    let managedContext: NSManagedObjectContext
    private init(){
        managedContext = stack.persistentContainer.viewContext
    }
}

extension CoreDataManager:  CoreDataManagerProtocol{
    func readFavorites() -> [SimpleArticle] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Article")
        var simpleArticles: [SimpleArticle] = []
        do {
            let articles = try managedContext.fetch(fetchRequest)
            for item in articles{
                let simpleArticle = SimpleArticle(title: item.value(forKey: "title") as! String,
                                                  description: item.value(forKey: "content") as! String,
                                                  image: UIImage(data: item.value(forKey: "image") as! Data) ??  #imageLiteral(resourceName: "Default"),
                                                  url: item.value(forKey: "url") as! String)
                simpleArticles.append(simpleArticle)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return simpleArticles
    }
    
    func saveFavoriteNews(article:SimpleArticle) {
        stack.persistentContainer.performBackgroundTask { (context) in
            let articleToSave = MOArticle(context: context)
            print("---------------Start Save-----------------")
            articleToSave.title = article.title
            articleToSave.content = article.description
            articleToSave.url  = article.url
            articleToSave.image = article.image.pngData()!
            print("----------------End Save----------------")
            try! context.save()
        }
    }
    
    func deleteFavoriteNews(indexPath: IndexPath) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Article")
        if let result = try? managedContext.fetch(fetchRequest) {
            print ("---!!!!Start Delete!!!!! ---")
            managedContext.delete(result[indexPath.row])
            print ("---!!!!End Delete!!!!! ---")
            try! managedContext.save()
        }
    }
    
}

