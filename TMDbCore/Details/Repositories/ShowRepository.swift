//
//  ShowRepository.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 27/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol ShowRepositoryProtocol {
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail>
}

final class ShowRepository: ShowRepositoryProtocol {
    private let webService: WebService

    init(webService: WebService) {
        self.webService = webService
    }

    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail> {
        return webService.load(ShowDetail.self, from: .show(identifier: identifier))
    }
}
