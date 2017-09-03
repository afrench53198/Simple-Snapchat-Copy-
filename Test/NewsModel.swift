//
//  NewsModel.swift
//  Test
//
//  Created by Adam B French on 8/27/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit


struct NewsSource {
   
  
  

    var description: String
    var name: String
    var category: String
    var url: URL

    enum NewsSourceError: Error {
        case missingUrl
        case missingName
        case missingCategory
        case missingDescription
    }
   
    
    init(with Json: Json) throws {
        
        guard let description = Json["description"] as? String else { throw NewsSourceError.missingDescription }
        guard let name = Json["name"] as? String else { throw NewsSourceError.missingName}
        guard let category = Json["category"] as? String else { throw NewsSourceError.missingCategory}
        guard let url = Json["url"] as? String else { throw NewsSourceError.missingUrl }
        
        self.url = URL(string: url)!
        self.name = name
        self.description = description
        self.category = category
    
    }

}





