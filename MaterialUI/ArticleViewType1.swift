//
//  ArticleViewType1.swift
//  MaterialUI
//
//  Created by Team Azbow on 1/11/19.
//  Copyright © 2019 oshan. All rights reserved.
//

import UIKit

class ArticleViewType1: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        name.text = ""
    }
    
    
}
