//
//  Presenter.swift
//  TopNews
//
//  Created by Onie on 07.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

protocol WebViewProtocol: class {
    func succes()
    func failure()
}

protocol WebViewPresenterProtocol: class{
    init(view: WebViewProtocol, networkConnectionService: NetworkConnectionServiceProtocol)
    var networkConnectionService :NetworkConnectionServiceProtocol! { get }
    var view: WebViewProtocol? { get }
 
    
    func checkConnection()
}

class WebPresenter: WebViewPresenterProtocol{
    
    let networkConnectionService :NetworkConnectionServiceProtocol!
    weak var view: WebViewProtocol?
    
    required init(view: WebViewProtocol, networkConnectionService: NetworkConnectionServiceProtocol) {
        self.view = view
        self.networkConnectionService = networkConnectionService
    }
    
    func checkConnection(){
        if networkConnectionService.isConnectedToNetwork() == true{
            self.view?.succes()
        } else{
            self.view?.failure()
        }
    }
}
