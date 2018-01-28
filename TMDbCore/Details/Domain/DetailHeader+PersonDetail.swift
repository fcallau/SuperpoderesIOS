//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 27/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.name!
        
        // Select the first image with aspect ratio 16/9 from taggedImages and use it like backdrop
        var image: String?
        
        if let taggedImages = person.taggedImages {
            var i = 0
            var imageNotFound = true
            
            while ((i < taggedImages.results.count) && imageNotFound) {
                let taggedImage = taggedImages.results[i]
                
                if (taggedImage.aspectRatio > 1.5 && taggedImage.aspectRatio < 1.8) {
                    image = taggedImage.filePath
                    imageNotFound = false
                }
                
                i = i + 1
            }
        } else {
            image = nil
        }
        
        backdropPath = image
        
        posterPath = person.profilePath
        
        let birthday = (person.birthday.flatMap{ dateFormatter.date(from: $0) }?.year).map { String($0) }
        let deathday = (person.deathday.flatMap{ dateFormatter.date(from: $0) }?.year).map { String($0) }
        
        metadata = [birthday, deathday].flatMap { $0 }.joined(separator: " - ")
    }
}
