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
    var imageHandler = ImageHandler()
    var tapHandler = UITapGestureRecognizer()
    var timeLabel: UILabel!
    var timer: Timer!
    var timerCounter: Int = 5
    var story: Story?
    var viewController: StoriesViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    // I initialize the story view with the property viewController so the referenced view controller can do the segues/preparation
    init (frame: CGRect, story: Story, VC: StoriesViewController) {
        super.init(frame: frame)
        
        setup()
        self.story = story
        self.timerCounter = story.duration!
        self.imageView.image = story.image
        self.viewController = VC
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func layoutSubviews() {
        
        imageView.frame = self.frame
        
        let labelFrame = CGRect(x: self.frame.maxX - 56 , y: self.frame.origin.y + 32, width: 32, height: 32)
        timeLabel.frame = labelFrame
    }
    
    
    func setup() {
        
        // Initialize and Configure Timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerDidFire(timer:)), userInfo: nil, repeats: true)
        
        // Configure image view on which the story will be displayed
        imageView.frame = self.frame
        self.addSubview(imageView)
        
        // Configure timer label
        let labelFrame = CGRect(x: self.bounds.maxX - 32 , y: self.bounds.origin.y + 32, width: 40, height: 40)
        timeLabel = UILabel(frame: labelFrame)
        timeLabel.font = UIFont(name: "system", size: 40)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        timeLabel.backgroundColor = .clear
        timeLabel.text = "\(timerCounter)"
        imageView.addSubview(timeLabel)
        
        // Configure Gesture Recognizer
        tapHandler.addTarget(self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tapHandler)
        
    }
    // Tap the screen to exit story view
    func handleTap(_ sender: UITapGestureRecognizer) {
        
        timer.invalidate()
        self.removeFromSuperview()
    }
    // Updates the counter that keeps track of timer and UI
    func timerDidFire(timer: Timer) {
        
        timerCounter -= 1
        timeLabel.text = "\(timerCounter)"
        
        if timerCounter == 0 {
            self.removeFromSuperview()
        }
    }
    
    
    
    
}
