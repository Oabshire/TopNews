//
//  AppDelegate.swift
//  TopNews
//
//  Created by Onie on 01.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import CoreData

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let tabBarController = UITabBarController()
        let first = UINavigationController(rootViewController: ModuleAssembler.assemblyNewsModule()) // клиент вызывает методы фабрикри
        let second = UINavigationController(rootViewController: ModuleAssembler.assemblyNoteModule())  // клиент вызывает методы фабрикри
        
        
        tabBarController.tabBar.tintColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        tabBarController.viewControllers = [first, second]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}

