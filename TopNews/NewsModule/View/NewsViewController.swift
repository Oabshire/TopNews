//
//  ViewController.swift
//  TopNews
//
//  Created by Onie on 01.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit


class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: NewsViewPresenterProtocol!
    
    let tableView = UITableView()
    
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    init(title: String, tabBarItem: UITabBarItem) {
        
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.tabBarItem = tabBarItem
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor =  UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Rockwell-Bold", size: 35.0) ?? UIFont.boldSystemFont(ofSize: 35)]
        self.tableView.separatorColor = UIColor.white
        
        
        view.backgroundColor = .lightGray
        
        presenter.downloadNews(country: "us", category: "entertainment", token: "3ea77deb1c4447eb8dd3619b369fb042")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = presenter.articles[indexPath.row]
        let datailViewController = ModuleAssembler.assemblyDetailModule(article: article)
        navigationController?.pushViewController(datailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as! NewsTableViewCell
        cell.nameLabel.text = presenter.articles[indexPath.row].title
        cell.newsImageView.image = presenter.articles[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let labelHight = NewsTableViewCell.contentHieght(text: presenter.articles[indexPath.row].title , maxWidth: tableView.frame.width * 0.8)
        return labelHight + view.frame.maxX - 75
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let saveAction = UITableViewRowAction(style: .destructive, title: "Save") { (_, _) in
            self.presenter.saveNews(article: self.presenter.articles[indexPath.row])
        }
        saveAction.backgroundColor = .orange
        
        return [saveAction]
    }
    
    @objc
    func refresh(){
        print("--------StartRefreshing-------")
        refreshControl.endRefreshing()
        presenter.downloadNews(country: "us", category: "entertainment", token: "3ea77deb1c4447eb8dd3619b369fb042")
        print("--------EndRefreshing-------")
    }
}

extension NewsViewController: NewsViewProtocol{
    func success() {
        DispatchQueue.main.async {
            self.view.addSubview(self.tableView)
            self.tableView.refreshControl = self.refreshControl
            self.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseID)
            self.tableView.reloadData()
        }
    }
    func failure(error: Error?) {
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
}
