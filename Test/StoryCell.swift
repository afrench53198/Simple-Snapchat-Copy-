//
//  StoryCell.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var duration: Int!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
     imageView.layer.cornerRadius = 10
    }
    
    /// Function to fill the interface of the Collection View cell with the data from the model, and to style the cell
    func configure(with data: Story) {
        imageView.image = data.image
        duration = data.duration
    }
    
    
    
    
    
    
}
