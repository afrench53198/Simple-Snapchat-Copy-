//
//  NoMemoriesView.swift
//  Test
//
//  Created by Adam B French on 8/22/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class NoMemoriesView: UIView {
    
    
    var sadFace = UIImageView()
    var statment = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.addSubview(statment)
        self.addSubview(sadFace)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
        statment.frame = CGRect(x: self.bounds.origin.x + 20, y: self.bounds.origin.y + 20, width: self.bounds.width - 40, height: 60)
        statment.font = UIFont(name: "System", size: 18)
        statment.textColor = .black
        statment.numberOfLines = 2
        statment.textAlignment = .center
        statment.text = "No Memories yet - Import some from your camera roll!"
        let sadFaceY = statment.frame.maxY  + 40
        let sadFaceX = statment.frame.midX - 40
        sadFace.frame = CGRect(x: sadFaceX, y: sadFaceY, width: 80, height: 80)
        sadFace.image = UIImage(named: "Emoji Copy")
    }
    
    
    
    
}





