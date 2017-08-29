//
//  MemoriesAndCameraRollLayout.swift
//  Test
//
//  Created by Adam B French on 8/19/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class MemoriesAndCameraRollLayout: UICollectionViewFlowLayout {


    override init() {
        super.init()
      self.scrollDirection = .vertical
      self.itemSize = CGSize(width: 100, height: 100)
        self.sectionInset.top = 88
        self.sectionInset.left = 8
        self.sectionInset.right = 8
        
     
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }





}
