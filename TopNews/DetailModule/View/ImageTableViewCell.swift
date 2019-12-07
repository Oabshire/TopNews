//
//  ImageTableViewCell.swift
//  TopNews
//
//  Created by Onie on 04.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    public static let reuseID = "DetailImage"
    public var newsImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        newsImageView.image?.accessibilityFrame = newsImageView.frame
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.clipsToBounds = true
        contentView.addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func updateConstraints() {
        
        newsImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        newsImageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 0).isActive = true
        newsImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5).isActive = true
        
        
        let heightForContentView = newsImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.8)
        heightForContentView.priority = UILayoutPriority(rawValue: 1000)
        heightForContentView.isActive = true
        
        super.updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
