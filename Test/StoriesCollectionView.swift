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
    var associatedController: StoriesViewController?
    var storyView: StoryView!
    
    
    func setup() {
       
        //Register Nib and Header View
        let nib = UINib(nibName: "StoryCellnib", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "Story")
        let headerNib = UINib(nibName: "StoriesHeaderView", bundle: nil)
        self.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        //Setup Layout
        
        
        
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
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view: UICollectionReusableView? = nil
        
        if kind == UICollectionElementKindSectionHeader {
            let headerView = self.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! StoriesHeaderView
            
            return headerView
        }
        
        return view!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        print("selected")
        let item = self.dequeueReusableCell(withReuseIdentifier: "Story", for: indexPath) as! StoryCell
        item.imageView.image = stories[indexPath.item].image
        let selectedStory = stories[indexPath.item]
        storyView = StoryView(frame: (associatedController?.view.frame)!, story: selectedStory, VC: self.associatedController!)
        associatedController?.view.addSubview(storyView)
    }
    
       
    
    
}
