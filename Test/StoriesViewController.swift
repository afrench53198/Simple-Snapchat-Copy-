//
//  StoriesViewController.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit


protocol NewsSourceDelegate {
    var source: NewsSource? {get set}
    func collectData(with source: NewsSource)
}




class StoriesViewController: UIViewController {
// This view controller recieves the story from PreviewVC with a segue. The image goes into story collectionView . With the story collection view there will be another collectionview with images parsed from JSon of different news sources
   
    var source: NewsSource?
    var stories: [Story] = []
    var storyView: StoryView?
    
    @IBOutlet weak var storiesCollectionView: StoriesCollectionView!
    @IBOutlet weak var newsSourceCollectionView: NewsCollectionView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storiesCollectionView.associatedController = self
        storiesCollectionView.stories = self.stories
        storiesCollectionView.setup()
        storyView = storiesCollectionView.storyView
        
 
        newsSourceCollectionView.sourceDelegate = self
        newsSourceCollectionView.setup()
   }
    
    override func viewDidLayoutSubviews() {
        
        if storyView != nil {
           storyView!.frame = self.view.frame
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSource" {
            if let destination = segue.destination as? NewsSourceViewController {
                destination.source = self.source
            }
        }
    }
}

extension StoriesViewController: NewsSourceDelegate {
    
    func collectData(with source: NewsSource) {
        
        self.source = source
       
        self.performSegue(withIdentifier: "ShowSource", sender: self)
    }
    
    
}
