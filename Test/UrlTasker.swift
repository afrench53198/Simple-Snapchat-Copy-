//
//  UrlTasker.swift
//  Test
//
//  Created by Adam B French on 9/2/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class UrlTasker: NSObject {
    
    // Can put other methods for networking in this class. NOT met to be singleton for networking, just a facet 
    
    override init() {
        super.init()
        
    }
    /// Pre loads data for use in loading asynchronously
    func getData(with url: String, completion:(Data) -> Void) {
        
        let usingUrl = URL(string: url)!
        
        do {
            let data = try Data(contentsOf: usingUrl)
            completion(data)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
}



