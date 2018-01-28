//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 27/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let biography: String?
    let birthday: String?
    let deathday: String?
    let identifier: Int64
    let name: String?
    let posterPath: [String]?
    let profilePath: String?
    let taggedImages: TaggedImages?
    
    
    private enum CodingKeys: String, CodingKey {
        case biography
        case birthday
        case deathday
        case identifier = "id"
        case name
        case posterPath = "poster_path"
        case profilePath = "profile_path"
        case taggedImages = "tagged_images"
    }
}
