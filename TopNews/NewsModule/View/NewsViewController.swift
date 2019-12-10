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
    
    var country = "ru"
    
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
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
        label.backgroundColor = .white
        label.text = "Отсутсвует подключение к интернету"
        label.font = UIFont(name: "g", size: 20)
        label.sizeToFit()
        return label
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
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setParameters))
        navigationController?.viewControllers[0].navigationItem.rightBarButtonItem = addButton
        
        
        view.backgroundColor = .white
        
        presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
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
        
        //__________Анимация_________
        let figure1  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 60))
        figure1.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure1.center = CGPoint(x: view.center.x - 13, y: view.center.y - 28)
        view.addSubview(figure1)
        
        let figure22  = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 10))
        figure22.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure22.center = CGPoint(x: view.center.x + 13, y: view.center.y - 25)
        view.addSubview(figure22)
        
        let figure2  = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 10))
        figure2.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure2.center = CGPoint(x: view.center.x + 28, y: view.center.y - 13)
        view.addSubview(figure2)
        
        let figure33  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        figure33.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure33.center = CGPoint(x: view.center.x + 25, y: view.center.y + 13)
        view.addSubview(figure33)
        
        let figure3  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 60))
        figure3.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure3.center = CGPoint(x: view.center.x + 13, y: view.center.y + 28)
        view.addSubview(figure3)
        
        let figure44  = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 10))
        figure44.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure44.center = CGPoint(x: view.center.x - 13, y: view.center.y + 25)
        view.addSubview(figure44)
        
        let figure4  = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 10))
        figure4.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure4.center = CGPoint(x: view.center.x - 28, y: view.center.y + 13)
        view.addSubview(figure4)
        
        let figure11  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        figure11.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        figure11.center = CGPoint(x: view.center.x - 25, y: view.center.y - 13)
        view.addSubview(figure11)
        
        var counter = 0
        
        print(counter)
        for item in view.subviews{
            UIView.animate(withDuration: 0.5, delay: 0.1 * TimeInterval(counter), options: [.repeat, .autoreverse, .beginFromCurrentState]                  , animations: {
                item.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 0)
            }, completion: { (_) in })
            counter = counter + 1
        }
        
        //__________Анимация_________
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
        refreshButton.isHidden = true
        label.isHidden = true
        
        print("--------StartRefreshing-------")
        refreshControl.endRefreshing()
        presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
        
        print("--------EndRefreshing-------")
        
        refreshButton.isHidden = false
        label.isHidden = false
    }
    
    @objc
    func setParameters(){
        let addTaskAllert = UIAlertController(title: "Выберете страну", message: nil, preferredStyle: .actionSheet)
        let russuiaAction = UIAlertAction(title: "Russia", style: .default){ _ in
            self.country = "ru"
            self.presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
        }
        let usaAction = UIAlertAction(title: "USA", style: .default){ _ in
            self.country = "us"
            self.presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
        }
        let ukraineAction = UIAlertAction(title: "Ukraine", style: .default){ _ in
            self.country = "ua"
            self.presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
             }
        let canadaAction = UIAlertAction(title: "Canada", style: .default){ _ in
            self.country = "ca"
            self.presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
             }
        let indiaAction = UIAlertAction(title: "India", style: .default){ _ in
            self.country = "in"
            self.presenter.downloadNews(country: self.country, category: nil, token: "3ea77deb1c4447eb8dd3619b369fb042")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        addTaskAllert.addAction(russuiaAction)
        addTaskAllert.addAction(usaAction)
        addTaskAllert.addAction(ukraineAction)
        addTaskAllert.addAction(canadaAction)
        addTaskAllert.addAction(indiaAction)
        addTaskAllert.addAction(cancelAction)
        present(addTaskAllert, animated: true, completion: nil)
    }
}

extension NewsViewController: NewsViewProtocol{
    func showNewsTable() {
        DispatchQueue.main.async {
            UIView.setAnimationsEnabled(false)
            self.view.layer.removeAllAnimations()
            self.view.addSubview(self.tableView)
            self.tableView.refreshControl = self.refreshControl
            self.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseID)
            self.tableView.reloadData()
        }
    }
    func showNoConnectionView(){
        UIView.setAnimationsEnabled(false)
        view.layer.removeAllAnimations()
        
        refreshButton.center = CGPoint(x: view.center.x ,y: view.center.y)
        label.center = CGPoint(x: view.center.x ,y: view.center.y + 60)
        
        view.addSubview(label)
        view.addSubview(refreshButton)
    }
}
