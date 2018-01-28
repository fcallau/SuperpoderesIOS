//
//  TaggedImages.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 27/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
    struct TaggedImage: Decodable {
        let aspectRatio: Float
        let filePath: String?
        
        private enum CodingKeys: String, CodingKey {
            case aspectRatio = "aspect_ratio"
            case filePath = "file_path"
        }
    }
    
    let results: [TaggedImage]
}
