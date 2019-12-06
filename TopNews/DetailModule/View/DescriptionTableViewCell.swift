//
//  DescriptionTableViewCell.swift
//  TopNews
//
//  Created by Onie on 04.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    public static let reuseID = "DetailDescripton"
    
    public let titleLabel = UILabel()
    public let descriptionLabel =  UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.textAlignment = .natural
        titleLabel.numberOfLines = 0
//        titleLabel.sizeToFit()
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        
        descriptionLabel.textAlignment = .natural
        descriptionLabel.numberOfLines = 0
//        descriptionLabel.sizeToFit()
        descriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    override func updateConstraints() {
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
       titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
        titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true

       descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
         descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
         descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        let heightForContentView = contentView.heightAnchor.constraint(equalToConstant:  contentHieght())
        heightForContentView.priority = UILayoutPriority(rawValue: 999)
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
    
    func contentHieght() -> CGFloat {
        let rectDescription: CGRect = descriptionLabel.text!.boundingRect(with: CGSize(width: contentView.frame.width, height: CGFloat.greatestFiniteMagnitude), options: ([.usesLineFragmentOrigin, .usesFontLeading]), attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Regular", size: 30) as Any], context: nil)
        let rectTitle: CGRect = titleLabel.text!.boundingRect(with: CGSize(width: contentView.frame.width, height: CGFloat.greatestFiniteMagnitude), options: ([.usesLineFragmentOrigin, .usesFontLeading]), attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 30) as Any], context: nil)
        let textHeight: CGFloat = rectTitle.size.height + rectDescription.size.height
        return textHeight
    }
}

