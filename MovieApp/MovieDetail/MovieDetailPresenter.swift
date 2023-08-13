//
//  MovieDetailPresenter.swift
//  MovieApp
//
//  Created by k1d_dev on 12/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MovieDetailPresenter {

    // MARK: - Private properties -

    private weak var view: MovieDetailViewInterface?
    private let interactor: MovieDetailInteractorInterface
    private let wireframe: MovieDetailWireframeInterface
    
    private var _title: String

    // MARK: - Lifecycle -

    init(
        view: MovieDetailViewInterface?,
        interactor: MovieDetailInteractorInterface,
        wireframe: MovieDetailWireframeInterface,
        title: String
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self._title = title
    }
}

// MARK: - Extensions -

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    
    var title: String {
        get {
            return _title
        }
        set {
            _title = newValue
        }
    }
    
    
    func viewDidLoad() async throws {
        
        var reviewDetailItem: [MovieDetailItem] = []
        let movie = interactor.movie
        let movieDetailItem = MovieDetailItem(section: .moviedetail, type: .movieDetail(movie))
        
        reviewDetailItem.append(movieDetailItem)
        
        let reviewResults = try? await interactor.getMovieReviews(id: "\(interactor.movie.id)")
        let trailerResults = try? await interactor.getMovieTrailers(id: "\(interactor.movie.id)")
        
        if let reviews = reviewResults?.results as? [UserReview] {
            
            let reviewItems = reviews.map { MovieDetailItem(section: .userReview, type: .userReviews($0)) }
            reviewDetailItem.append(contentsOf: reviewItems)
            
        }
        
        let trailerId = trailerResults?.results.first?.key ?? ""
        reviewDetailItem.append(MovieDetailItem(section: .movieTrailer, type: .movieTrailer(trailerId)))
        
        view?.applySnapshot(items: reviewDetailItem)
    }
    
}
