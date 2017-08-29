//
//  PreviewViewController.swift
//  Test
//
//  Created by Adam B French on 8/20/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

   
    // MARK: - Properties and IBOutlets
    var capturedImage: UIImage!
    var story: Story?
    var addToStoryView: AddToStoryView!
    
    
    
    @IBOutlet weak var picturePreview: UIImageView!
    
    // MARK: - Methods and IBActions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAddToStoryView()
        picturePreview.image = capturedImage
    }

    override func viewWillAppear(_ animated: Bool) {
       
        picturePreview.image = capturedImage
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToStoriesVC" {
            if let destinationVC = segue.destination as? StoriesViewController {
                destinationVC.stories.append(self.story!)
            print("Prepared For segue")
            }
        }
    }
    
    @IBAction func addPressed(_ sender: Any) {
    
    self.view.addSubview(addToStoryView)
    }
    @IBAction func deleteButtonPushed(_ sender: UIButton) {
       
        capturedImage = nil
        dismiss(animated: true, completion: nil)
    }

    func configureAddToStoryView() {
       // Setting up view Frame
        let viewSize = CGSize(width: self.view.frame.width - 80, height: self.view.frame.height * 0.3)
        let viewY = self.view.frame.midY - viewSize.height/2
        let viewFrame = CGRect(x: 40, y:viewY , width: viewSize.width, height: viewSize.height)
        addToStoryView = AddToStoryView(frame: viewFrame)
        addToStoryView.addToStoryButton.addTarget(self, action: #selector(self.addToStoryButtonPressed(_:)), for: .touchUpInside)
    }

    func addToStoryButtonPressed(_ sender: UIButton) {
        
        story = Story(image: self.capturedImage, duration: addToStoryView.duration)
        if story != nil {
            performSegue(withIdentifier: "ToStoriesVC", sender: self)
        }
    }




}
