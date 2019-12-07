//
//  WebViewController.swift
//  TopNews
//
//  Created by Onie on 07.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView:WKWebView!
    var loader:UIActivityIndicatorView!
    let tabbar = UITabBar()
    let url:URL
    
    init(url: URL){
        self.url = url
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        signInButton.center = CGPoint(x: view.center.x, y: view.center.y)
        //        view.addSubview(signInButton)
        
        
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.frame = view.frame
        
        let request = URLRequest(url: self.url)
        
        webView.load(request)
        
        view.addSubview(webView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
