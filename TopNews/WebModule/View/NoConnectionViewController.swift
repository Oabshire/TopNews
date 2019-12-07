//
//  NoConnectionViewController.swift
//  TopNews
//
//  Created by Onie on 07.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import  UIKit

class NoConnectionViewController: UIViewController{
    var label:UILabel = {
        let label = UILabel()
        label.text = "Отсутсвует подключение к интернету"
        label.font = UIFont(name: "g", size: 20)
        label.sizeToFit()
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.center = view.center
        view.addSubview(label)
    }
}
