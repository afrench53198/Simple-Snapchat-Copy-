//
//  MemoriesViewController.swift
//  Test
//
//  Created by Adam B French on 8/16/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class MemoriesViewController: UIViewController{
    
    var  memoriesCollectionView: MemoriesCollectionView!
   @objc var cameraRollCollectionView: CameraRollCollectionView!
    
    
    
    var collectionViewSelectedImages: [UIImage] = []
    var noMemoriesView = NoMemoriesView()
    var cameraRollDelegate  : MyImageDelegate?
    var memoriesDelegate: MyImageDelegate?
    var imageHandler = ImageHandler()
   
    @IBOutlet weak var memoriesControl: UISegmentedControl!
    
    deinit {
        removeObserver(self, forKeyPath:  #keyPath(cameraRollCollectionView.imageHandler.passingImages))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       layoutViews()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let collectionViewFrameY = memoriesControl.frame.maxY + 10
        
        let collectionViewFrame = CGRect(x: 0, y: collectionViewFrameY, width: self.view.bounds.width, height: self.view.bounds.height - collectionViewFrameY)
        memoriesCollectionView = MemoriesCollectionView(frame: collectionViewFrame, collectionViewLayout: MemoriesAndCameraRollLayout())
         cameraRollCollectionView = CameraRollCollectionView(frame: collectionViewFrame, collectionViewLayout: MemoriesAndCameraRollLayout())
      setupMemoriesControl()
        // Checking to see if there are any images to display. If not, user will be prompted to add some
        if memoriesCollectionView.images.isEmpty {
            view.addSubview(noMemoriesView)
        } else {
            view.addSubview(memoriesCollectionView)
        }
        
        cameraRollDelegate = cameraRollCollectionView.imageHandler
        memoriesDelegate = memoriesCollectionView
        collectionViewSelectedImages = cameraRollCollectionView.selectedImageArray
      
        addObserver(self, forKeyPath: #keyPath(cameraRollCollectionView.imageHandler.passingImages), options: [.old, .new], context: nil)
    
    }
    

    
    
    // MARK: - Methods
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(cameraRollCollectionView.imageHandler.passingImages) {
            let images = cameraRollCollectionView.imageHandler.passingImages
            self.memoriesDelegate?.passImages(images: images)
            print("value observed ")
        }
        
    
    }
    
    
    func layoutViews() {
        
            let collectionViewFrameY = memoriesControl.frame.maxY + 10
            
            let collectionViewFrame = CGRect(x: 0, y: collectionViewFrameY, width: self.view.bounds.width, height: self.view.bounds.height - collectionViewFrameY)
       
    
        cameraRollCollectionView.frame = collectionViewFrame
        cameraRollCollectionView.bounds = collectionViewFrame
        memoriesCollectionView.frame = collectionViewFrame
        memoriesCollectionView.bounds = collectionViewFrame
        noMemoriesView.frame = collectionViewFrame
    }
    
    func setupMemoriesControl(){
        
        memoriesControl.addTarget(self, action: #selector(MemoriesViewController.memoriesControlValueChanged), for: .valueChanged)
    }
    
    /// When the segmented control value changed, the appropriate views are displayed and removed
    func memoriesControlValueChanged(){
       
        switch self.memoriesControl.selectedSegmentIndex {
        case 0:
           self.cameraRollCollectionView.removeFromSuperview()
            if memoriesCollectionView.images.isEmpty == false{
                self.view.addSubview(memoriesCollectionView)
            } else {
                self.view.addSubview(noMemoriesView)
            }
        case 1:
          self.view.addSubview(cameraRollCollectionView)
           noMemoriesView.removeFromSuperview()
           memoriesCollectionView.removeFromSuperview()
    default: print("Out of range")
        }
    }
    
    // MARK: - IBactions
    
    
    @IBAction func backToCameraVC(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - MyImageDelegate conformance 
    
    

}


