//
//  StoryCell.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {

    var duration: Int!

    @IBOutlet weak var imageView: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
      }

  
    func configure(with data: Story) {
      imageView.layer.cornerRadius = 10
      imageView.image = data.image
      duration = data.duration
}






}
