//
//  ImageHandler.swift
//  Test
//
//  Created by Adam B French on 8/22/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit



protocol MyImageDelegate {
    
    func passImages(images: [UIImage])
 }


@objc class ImageHandler: NSObject {
   
    
      // The array of images used in Memories/CameraRoll collection views
    var images: [UIImage] = []
   
    // tagging this variable with @objc and dynamic keywords so it can be used in Key-Value Observation
    @objc  dynamic var passingImages: [UIImage] = []
   
    // Local image array used to simulate photo data
    var imageArray = [UIImage(named: "Photo 1"),UIImage(named: "Photo 2"),UIImage(named: "Photo 3"),UIImage(named: "Photo 4"), UIImage(named: "Photo 5"), UIImage(named: "Photo 6"),UIImage(named: "Photo 7"),UIImage(named: "Photo 8"),UIImage(named: "Photo 9"), UIImage(named: "Photo 10"),UIImage(named: "Photo 11"),UIImage(named: "Photo 12"),UIImage(named: "Photo 13") ]
    var snapShot: UIImage? = nil
    
    
   
    func getImagesForCameraRollCollectionView() {
        for image in imageArray {
            images.append(image!)
        }
    }

    /// Gets an image from available images and runs completion block if the image needs to be passed
    func getImageForPicture(completion: (() -> Void)) {
        self.snapShot = self.imageArray[0]
        if self.snapShot != nil {
            completion()
        }
    }


}

extension ImageHandler: MyImageDelegate {
    
    /// Used for passing a single image, probably associated with a story
    func passImage(image: UIImage) {
        self.snapShot = image
    }
   /// Used for passing arrays of images between views 
    func passImages(images: [UIImage]) {
        self.passingImages = images
    }
    
    
}



