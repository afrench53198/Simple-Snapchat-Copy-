//
//  StoriesViewController.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController {
// This view controller recieves the story from PreviewVC with a segue. The image goes into story collectionView . With the story collection view there will be another collectionview with images parsed from JSon of different news sources
   
   
    var stories: [Story] = []
    
    @IBOutlet weak var storiesCollectionView: StoriesCollectionView!
    @IBOutlet weak var newsSourceCollectionView: NewsCollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storiesCollectionView.stories = self.stories
        storiesCollectionView.setup()
   }

   
}
