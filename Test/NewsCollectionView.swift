//
//  NewsCollectionView.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

public typealias Json = [String:Any]

class NewsCollectionView: UICollectionView {
    

    var sourceDelegate: NewsSourceDelegate?
    var tasker = UrlTasker()
    var newsSources: [NewsSource] = [] {
        didSet{
            reloadData()
        }
    }
    
    /// Register cells, configure layout, and gather data
    func setup() {
        
        getData()
        
        //Register Nibs
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "NewsCell")
        
        
        
        // Set Delegate and Data Source
        self.delegate = self as UICollectionViewDelegate
        self.dataSource = self as UICollectionViewDataSource
    }
    
}



extension NewsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func getData() {
        
        tasker.getData(with: "https://newsapi.org/v1/sources?language=en") { (data) in
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! Json
                if let sources = json["sources"] as? [Json] {
                    for source in sources {
                        let parsedSource = try NewsSource(with: source)
                        newsSources.append(parsedSource)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - Data Source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(newsSources.count)
        return newsSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let source = newsSources[indexPath.item]
        cell.configure(with: source)
        
        return cell
    }
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedSource = newsSources[indexPath.item]
        
        sourceDelegate?.collectData(with: selectedSource)
    }
    
    
    
    
}
