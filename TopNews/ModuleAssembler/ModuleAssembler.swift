//
//  ModuleAssembler.swift
//  TopNews
//
//  Created by Onie on 02.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit


///This protocol defines the methods that Assembler should have.
protocol Assembler{

    ///This function builds a News Module.
    static func assemblyNewsModule()-> UIViewController
    
    /// This function builds a Detail Module.
    /// - Parameter article: the article whose description will be shown
    static func assemblyDetailModule(article: SimpleArticle?)->UIViewController
    
    /// This function builds a Note Module.
    static func assemblyNoteModule()->UIViewController
    
    /// This function builds a Web Module.
    /// - Parameter url: url which Web View will open
    static func assemblyWebModule(url: URL)->UIViewController
}

class ModuleAssembler: Assembler{
    
    static func assemblyNewsModule() -> UIViewController {
        let tabBarItem = UITabBarItem(title: "Новости", image: UIImage(named: "news"), tag: 0)
        let view = NewsViewController(title: "TopNews",tabBarItem: tabBarItem)
        let networkService = NetworkManager.shared
        let coreDataServise = CoreDataManager.shared
        let presenter = NewsPresenter(view: view, networkService: networkService, coreDataService: coreDataServise)
        view.presenter = presenter
        return view
    }
    
    static func assemblyDetailModule(article: SimpleArticle?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, article: article)
        view.presenter = presenter
        return view
    }
    
    static func assemblyNoteModule()->UIViewController{
        let tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "favorites"), tag: 0)
        let view = NoteViewController(title: "Избранное",tabBarItem: tabBarItem)
        let coreDataService = CoreDataManager.shared
        let presenter = NotePresenter(view: view, coreDataService: coreDataService)
        view.presenter = presenter
        return view
    }
    
    static func assemblyWebModule(url: URL)->UIViewController{
        let networkConnectionService = NetworkConnectionService()
        let view = WebViewController(url: url)
        let presenter = WebPresenter(view: view, networkConnectionService: networkConnectionService)
        view.presenter = presenter
        
        return view
    }
}
