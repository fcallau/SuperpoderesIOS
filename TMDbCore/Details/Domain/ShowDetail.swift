//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 28/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let backdropPath: String?
    let firstAirDate: String?
    let identifier: Int64
    let name: String?
    let overview: String?
    let posterPath: String?
    let credits: Credits?
    let genres: [GenreInfo]?
    let homepage: String?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case identifier = "id"
        case name
        case overview
        case posterPath = "poster_path"
        case credits
        case genres
        case homepage
    }
}
