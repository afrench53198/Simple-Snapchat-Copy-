//
//  StoryView.swift
//  Test
//
//  Created by Adam B French on 8/30/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class StoryView: UIView {
    
    var imageView = UIImageView()
    var saveButton: UIButton!
    var imageHandler = ImageHandler()
    var tapHandler = UITapGestureRecognizer()
    var timeLabel: UILabel!
    var timer: Timer!
    var timerCounter = 10
    var story: Story?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init (frame: CGRect, story: Story) {
        super.init(frame: frame)
        
        self.story = story
        self.timerCounter = story.duration!
        self.imageView.image = story.image
      
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  
   
    override func layoutSubviews() {
        
        imageView.frame = self.frame
        
        let labelFrame = CGRect(x: imageView.bounds.maxX - 32, y: imageView.bounds.origin.y + 32, width: 32, height: 32)
        timeLabel.frame = labelFrame
        
        saveButton.frame = CGRect(x: imageView.bounds.origin.x + 32, y: imageView.bounds.maxY - 32, width: 32, height: 32)
        
    }
    
    func setup() {
        
        // Initialize and Configure Timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerDidFire(timer:)), userInfo: nil, repeats: true)
        
        // Initialize and Configure save button
        saveButton = UIButton(type: .custom)
        saveButton.backgroundColor = .blue
        saveButton.frame =  CGRect(x: imageView.bounds.origin.x + 32, y: imageView.bounds.maxY - 32, width: 32, height: 32)
    
        saveButton.setImage(#imageLiteral(resourceName: "Delete"), for: .normal)
        imageView.addSubview(saveButton)
        
        // Configure timer label
        let labelFrame = CGRect(x: imageView.bounds.maxX - 32, y: imageView.bounds.origin.y + 32, width: 32, height: 32)
        timeLabel = UILabel(frame: labelFrame)
        timeLabel.font = UIFont(name: "system", size: 24)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        timeLabel.backgroundColor = .black
        timeLabel.text = "\(story?.duration ?? 0)"
        imageView.addSubview(timeLabel)
        
        
       // Configure Gesture Recognizer
        tapHandler.addTarget(self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tapHandler)
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        
        timer.invalidate()
        self.removeFromSuperview()
    }
    
    func timerDidFire(timer: Timer) {
        
        timerCounter = (story?.duration)!
        timerCounter -= 1
        timeLabel.text = "\(timerCounter)"
        
        if timerCounter == 0 {
            self.removeFromSuperview()
        }
    }
    
    
}
