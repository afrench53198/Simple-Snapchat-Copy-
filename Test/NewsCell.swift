//
//  NewsCell.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /// Function to set cell's initial appearance with data
    func configure(with source: NewsSource) {
        
        self.nameLabel.text = source.name
        self.categoryLabel.text = source.category
    }
    
    
}
