//
//  Presenter.swift
//  TopNews
//
//  Created by Onie on 07.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

///The methods adopted by the object you use to implement the interaction between the View and Presenter.
protocol WebViewProtocol: class {
    
    /// This function shows WebView from sorse of news.
    func showWebView()
    
    /// This function show NoConnection text massage and refresh button.
    func showNoConnection()
}


/// The methods adopted by the object that you use to implement the interaction between the Model and the View.
protocol WebViewPresenterProtocol: class{
    init(view: WebViewProtocol, networkConnectionService: NetworkConnectionServiceProtocol)
    var networkConnectionService :NetworkConnectionServiceProtocol! { get }
    var view: WebViewProtocol? { get }
 
    
    ///This function check connecion and calls  view's **showWebView()**  metod or **showNoConnection()** metod.
    func checkConnection()
}

///  The object that implements the interaction between the Model and the View.
class WebPresenter: WebViewPresenterProtocol{
    
    let networkConnectionService :NetworkConnectionServiceProtocol!
    weak var view: WebViewProtocol?
    
    required init(view: WebViewProtocol, networkConnectionService: NetworkConnectionServiceProtocol) {
        self.view = view
        self.networkConnectionService = networkConnectionService
    }
    
    func checkConnection(){
        if networkConnectionService.isConnectedToNetwork() == true{
            self.view?.showWebView()
        } else{
            self.view?.showNoConnection()
        }
    }
}
