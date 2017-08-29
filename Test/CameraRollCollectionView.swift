//
//  CameraRollCollectionView.swift
//  Test
//
//  Created by Adam B French on 8/16/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class CameraRollCollectionView: UICollectionView {
    
    var imageHandler = ImageHandler()
    var memoriesDelegate: MyImageDelegate?
    var selectedImageArray: [UIImage] = []
    var addButton: UIButton!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.frame = frame
        setup()
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
   
    }
       func setup() {
      
        
        //register nib
        let nib = UINib(nibName: "ImageCellCollectionViewCell", bundle: nil)
        register(nib, forCellWithReuseIdentifier: "CameraRollCell")
        
        // Configure datasource/delegate and appearance; get data
        allowsMultipleSelection = true
        contentMode = .center
        backgroundColor = .clear
        delegate = self
        dataSource = self as UICollectionViewDataSource
        imageHandler.getImagesForCameraRollCollectionView()
        
        // Configure addButton
        configureButton()
        
}

    func configureButton(){
        let addButtonFrame = CGRect(x: self.frame.origin.x, y: self.frame.maxY - 56, width: self.frame.width, height: 56)
        addButton = UIButton(type: .custom)
        addButton.frame = addButtonFrame
        addButton.backgroundColor = UIColor.green
        addButton.setTitle("Add to Memories", for: .normal)
        addButton.tintColor = .white
        addButton.isEnabled = true
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
    }
   
    
    func addButtonPressed(_ button: UIButton) {
      
        memoriesDelegate = imageHandler
        memoriesDelegate?.passImages(images: selectedImageArray)
        addButton.removeFromSuperview()
        let indexPaths = self.indexPathsForSelectedItems
        for path in indexPaths! {
            self.deselectItem(at: path, animated: false)
        let cell = cellForItem(at: path)  as! ImageCellCollectionViewCell
            cell.selectionCheckmark.isHidden = true
        }
    }
   
}

extension CameraRollCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - Data Source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageHandler.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CameraRollCell", for: indexPath) as! ImageCellCollectionViewCell
        cell.configure(with: imageHandler.images[indexPath.item])
        return cell
    }
    
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        self.addSubview(addButton)
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCellCollectionViewCell
        cell.selectionCheckmark.isHidden = false
        
        if cell.isSelected {
            cell.selectionCheckmark.image = UIImage(named: "Checkmark black")
            let selectedImage = cell.imageView.image
            selectedImageArray.append(selectedImage!)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCellCollectionViewCell
        cell.selectionCheckmark.isHidden = true
        selectedImageArray.removeLast()
        if selectedImageArray.count == 0 {
            addButton.removeFromSuperview()
        }
    }
}


