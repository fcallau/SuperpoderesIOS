//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 28/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.name!
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let firstAirDate = show.firstAirDate.flatMap { dateFormatter.date(from: $0)}
        let year = (firstAirDate?.year).map { String($0) }
        let genre = show.genres?.first?.name
        
        metadata = [year, genre].flatMap { $0 }.joined(separator: " . ")
    }
}

