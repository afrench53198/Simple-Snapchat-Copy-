//
//  StoriesCollectionView.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class StoriesCollectionView: UICollectionView {

    var stories: [Story] = []
    

    func setup() {
        //Register Nib
        let nib = UINib(nibName: "StoryCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "Story")
        //Setup Layout
        self.contentInset = UIEdgeInsetsMake(8, 0, 8, 0)
        
        //Set delegate and dataSource
        self.delegate = self as UICollectionViewDelegate
        self.dataSource = self as UICollectionViewDataSource
    }


}


extension StoriesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - Data Source 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "Story", for: indexPath) as! StoryCell
        let story = stories[indexPath.item]
        cell.configure(with: story)
        return cell
    }


}
