//
//  MemoriesCollectionView.swift
//  Test
//
//  Created by Adam B French on 8/16/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class MemoriesCollectionView: UICollectionView, MyImageDelegate {

    
    var images: [UIImage?] = [] {
        didSet {
            reloadData()
        }
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
       super.init(frame: frame, collectionViewLayout: layout)
       self.collectionViewLayout = layout
        self.frame = frame
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //A function to configure the collection view and gather data
    func setup() {
   
        //Register Nib
        let nib = UINib(nibName: "ImageCellCollectionViewCell", bundle: nil)
        register(nib, forCellWithReuseIdentifier: "MemoriesCell")
        
        //Set properties of collectionView
        contentMode = .center
        allowsMultipleSelection = true
        backgroundColor = .clear
        dataSource = self as UICollectionViewDataSource
    
      }
    func passImages(images: [UIImage]) {
        for image in images {
           self.images.append(image)
        }
        
        print("MemoriesCollectionViewImages\(self.images.count)")
    }



}


extension MemoriesCollectionView: UICollectionViewDataSource {
    
        // MARK: - Data Source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
  
              return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = self.dequeueReusableCell(withReuseIdentifier: "MemoriesCell", for: indexPath) as! ImageCellCollectionViewCell
       
        cell.configure(with: images[indexPath.item]!)
        return cell
    }
}
