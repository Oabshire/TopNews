//
//  NoteViewController.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: NoteViewPresenterProtocol!
    
    let tableView = UITableView()
    
    
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
        
        view.addSubview(tableView)
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.reuseID)
        
        view.backgroundColor = .lightGray
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.reuseID, for: indexPath) as! NoteTableViewCell
        let article = presenter.articles[indexPath.row]
        cell.nameLabel.text = article.title
        cell.newsImageView.image = article.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let labelHight = NoteTableViewCell.contentHieght(text: presenter.articles[indexPath.row].title , maxWidth: tableView.frame.width * 0.8)
        return labelHight + view.frame.maxX - 75
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.downloadNews()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            self.presenter.deleleNews(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
}

extension NoteViewController: NoteViewProtocol{
    func setNews() {
        tableView.reloadData()
    }
    
}
