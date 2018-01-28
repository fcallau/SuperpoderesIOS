//
//  PersonPresenter.swift
//  TMDbCore
//
//  Created by Francesc Callau Brull on 27/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class PersonPresenter: DetailPresenter {
    private let repository: PersonRepositoryProtocol
    private let dateFormatter: DateFormatter
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: PersonRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64) {
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.person(withIdentifier: identifier)
            .map { [weak self] person in
                self?.detailSections(for: person) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
    }
    
    private func detailSections(for person: PersonDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(person: person, dateFormatter: dateFormatter))
        ]
        
        if let biography = person.biography {
            detailSections.append(.about(title: "About", detail: biography))
        }
        
//        if let overview = movie.overview {
//            detailSections.append(.about(title: "Overview", detail: overview))
//        }
//
//        let items = movie.credits?.cast.map { PosterStripItem(castMember: $0) }
//
//        if let items = items {
//            detailSections.append(.posterStrip(title: "Cast", items: items))
//        }
        
        return detailSections
    }
}
