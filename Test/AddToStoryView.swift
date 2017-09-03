//
//  AddToStoryView.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class AddToStoryView: UIView {
    
    
    
    var durationSlider: UISlider!
    var duration: Int!
    var durationLabel: UILabel!
    var addToStoryButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor  = .white
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureSubviews() {
        
        // Duration Slider Configuration
        let durationSliderFrame = CGRect(x: self.bounds.origin.x + 20 , y: self.bounds.midY, width: self.bounds.width - 40 , height: 20)
        durationSlider = UISlider(frame: durationSliderFrame)
        durationSlider.maximumValue = 10
        durationSlider.minimumValue = 1
        durationSlider.thumbTintColor = UIColor.snapChatRed()
        durationSlider.tintColor = UIColor.darkGray
        durationSlider.isContinuous = true
        
        // Adding function that changes label text as a target
        durationSlider.addTarget(self, action: #selector(AddToStoryView.sliderValueChanged(_:)), for: .valueChanged)
        
        self.addSubview(durationSlider)
        
        // Duration Label Configuration
        let durationLabelFrame = CGRect(x: self.bounds.origin.x + 8, y: durationSlider.frame.minY - 32, width: self.bounds.width - 16 , height: 24)
        durationLabel = UILabel(frame: durationLabelFrame)
        durationLabel.font = UIFont(name: "system", size: 16)
        durationLabel.textColor = UIColor.darkGray
        durationLabel.text = "Duration Time:  "
        durationLabel.textAlignment = .center
        self.addSubview(durationLabel)
        
        // Configuring the button that will trigger a segue to StoriesViewController. Target is added in PreviewViewController
        let buttonFrame = CGRect(x: self.bounds.origin.x, y: self.bounds.maxY - 48, width: self.bounds.width, height: 48)
        addToStoryButton = UIButton(type: .custom)
        addToStoryButton.frame = buttonFrame
        addToStoryButton.setTitle("Add to Story", for: .normal)
        addToStoryButton.titleLabel?.font = UIFont(name: "system", size: 24)
        addToStoryButton.backgroundColor = UIColor.snapChatRed()
        self.addSubview(addToStoryButton)
    }
    
    
    
    
    ///  updates the duration label with changing of the slider
    func sliderValueChanged(_ sender: UISlider) {
        duration =  Int(durationSlider.value)
        durationLabel.text = "Duration Time: \(duration!) "
        
    }
    
    
}
