//
//  WebViewController.swift
//  TopNews
//
//  Created by Onie on 07.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WebViewProtocol {
    
    
    var webView:WKWebView!
    var loader:UIActivityIndicatorView!
    let tabbar = UITabBar()
    
    let url:URL
    var presenter: WebViewPresenterProtocol!
    
    init(url: URL){
        self.url = url
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter.checkConnection()
        
    }
    
    func succes() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.frame = view.frame
        
        let request = URLRequest(url: self.url)
        
        webView.load(request)
        view.addSubview(webView)
    }
    
    func failure() {
        let refreshButton: UIButton = {
            let button = UIButton()
            button.setImage(#imageLiteral(resourceName: "refresh"), for: .normal)
            button.setImage(#imageLiteral(resourceName: "refreshTapped"), for: .highlighted)
            button.sizeToFit()
            button.addTarget(self, action: #selector(refresh), for:  .touchUpInside)
            return button
        }()
        let label:UILabel = {
            let label = UILabel()
            label.text = "Отсутсвует подключение к интернету"
            label.font = UIFont(name: "g", size: 20)
            label.sizeToFit()
            return label
        }()
        
        refreshButton.center = CGPoint(x: view.center.x ,y:view.center.y-40)
        label.center = CGPoint(x: view.center.x ,y:view.center.y+20)
        view.addSubview(label)
        view.addSubview(refreshButton)
    }
    
    @objc
    func refresh(){
        presenter.checkConnection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
