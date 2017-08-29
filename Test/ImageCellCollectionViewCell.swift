//
//  ImageCellCollectionViewCell.swift
//  Test
//
//  Created by Adam B French on 8/22/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class ImageCellCollectionViewCell: UICollectionViewCell {
   
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectionCheckmark: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
   
   
    /// Function to set cell's initial appearance with data
    public func configure(with image: UIImage) {
        self.imageView.image = image
        self.selectionCheckmark.isHidden = true
    }


   }
