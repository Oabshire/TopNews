//
//  ButtonTableViewCell.swift
//  TopNews
//
//  Created by Onie on 07.12.2019.
//  Copyright © 2019 Onie. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    public static let reuseID = "DetailButton"
    
    public var urlOptional : URL? = nil
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Посмотреть в источнике"
        label.textColor = .white
        label.font = UIFont(name: "NotoSansOriya-Bold", size: 25)
        label.sizeToFit()
        return label
    }()
    
    let buttonView :UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.10, green:0.4, blue:0.35, alpha: 1.0)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(buttonView)
        buttonView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        buttonView.frame = contentView.frame
        label.center = contentView.center
        super.updateConstraints()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
