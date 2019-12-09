//
//  NoteTableViewCell.swift
//  TopNews
//
//  Created by Onie on 05.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

/// A class that defines the view of cell

class NoteTableViewCell: UITableViewCell {
    
    public static let reuseID = "Note"
    
    public let nameLabel = UILabel()
    public var newsImageView = UIImageView()
    private let backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backView)
        addViewtoBackView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.frame = CGRect(x: self.contentView.frame.minX, y: self.contentView.frame.minY, width: self.contentView.frame.width*0.95, height: self.contentView.frame.height*0.95)
        backView.center = contentView.center
        addViewtoBackView()
    }
    
    private func addViewtoBackView(){
        
        
        backView.backgroundColor = .white
        
        nameLabel.textAlignment = .natural
        nameLabel.numberOfLines = 0
        nameLabel.sizeToFit()
        nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        nameLabel.sizeToFit()
        nameLabel.frame = CGRect(x: 0, y: 0, width: backView.frame.width*0.9, height: backView.frame.height)
        nameLabel.center = CGPoint(x: contentView.center.x, y: contentView.center.y * 0.3)
        nameLabel.textColor  = .black
        
        newsImageView.layer.masksToBounds = false
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.frame = CGRect(x: 0, y: 0, width: backView.frame.width*0.9, height: backView.frame.width*0.7)
        newsImageView.clipsToBounds = true
        newsImageView.center = CGPoint(x: backView.center.x, y: backView.center.y * 1.20)
        
        addSubview(nameLabel)
        addSubview(newsImageView)
        
        backView.layer.cornerRadius = 10
        backView.layer.masksToBounds = false
        let color = UIColor.gray
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowColor = color.cgColor
        newsImageView.clipsToBounds = true
        
        
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
    
    /// Function to calculate the height of content.
    /// - Parameters:
    ///   - text: Content text.
    ///   - maxWidth: Maximum width of the text.
    static func contentHieght(text: String, maxWidth: CGFloat) -> CGFloat {
        let rect: CGRect = text.boundingRect(with: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude), options: ([.usesLineFragmentOrigin, .usesFontLeading]), attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 20) as Any], context: nil)
        let textHeight: CGFloat = rect.size.height
        return textHeight
    }
}
