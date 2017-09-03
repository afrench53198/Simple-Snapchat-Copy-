//
//  NewsSourceViewController.swift
//  Test
//
//  Created by Adam B French on 9/2/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class NewsSourceViewController: UIViewController {
    
    var source: NewsSource?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
}
    
    func configureViews() {
        
        if source != nil {
            nameLabel.text = source?.name
            categoryLabel.text = "Category: \((source?.category)!)"
            descriptionLabel.text = source?.description
        }
    }
    
    @IBAction func goToWebsitePressed(_ sender: Any) {
       
        // Set webView frame
        let webViewFrame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y + 100, width: self.view.frame.width, height: self.view.frame.height)
        let webView = UIWebView(frame: webViewFrame)
        // Load the Url from source in the webView
        let request = URLRequest(url: (source?.url)!)
        webView.loadRequest(request)
        while webView.isLoading {
            continue
        }
        self.view.addSubview(webView)
    }
    
}
