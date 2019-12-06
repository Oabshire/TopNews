//
//  CoreDataManager.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import CoreData

protocol CoreDataManagerProtocol {
    func readFavorites()-> [SimpleArticle]
    func saveFavoriteNews(article: SimpleArticle)
    func deleteFavoriteNews(indexPath: IndexPath)
    func getFetchedResultsController() -> NSFetchedResultsController<MOArticle>
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
                                                  image:/* UIImage(data: item.value(forKey: "image") as! Data) ?? */ #imageLiteral(resourceName: "Default"),
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
    
    func getFetchedResultsController() -> NSFetchedResultsController<MOArticle> {
        let context = stack.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MOArticle>(entityName: "Article")
                  fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                    managedObjectContext: context,
                                                    sectionNameKeyPath: nil,
                                                    cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        return controller
    }
    
}

