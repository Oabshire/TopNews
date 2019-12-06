//
//  DetailViewController.swift
//  TopNews
//
//  Created by Onie on 04.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: DetailViewPresenterProtocol!
    
    var article: SimpleArticle?
    
    let imageTableViewCell = ImageTableViewCell()
    let descriptionTableViewCell = DescriptionTableViewCell()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.tintColor = .white
        
        presenter.setArticle()
        super.viewDidLoad()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseID)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = imageTableViewCell
            cell.newsImageView.image = article?.image ?? #imageLiteral(resourceName: "Default")
            return cell
        } else {
            let cell = descriptionTableViewCell
            cell.titleLabel.text = article?.title
            cell.descriptionLabel.text = article?.description
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: false)
       }
}

extension DetailViewController: DetailViewProtocol{
    func setArticle(article: SimpleArticle?) {
        self.article = article
    }
}
