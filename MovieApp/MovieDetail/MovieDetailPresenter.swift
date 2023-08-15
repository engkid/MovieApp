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
import UIKit

final class MovieDetailPresenter {

    var movieId: String?
    
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
        
        async let reviewResults = try? await interactor.getMovieReviews(id: "\(interactor.movie.id)")
        async let trailerResults = try? await interactor.getMovieTrailers(id: "\(interactor.movie.id)")
        
        if let reviews = await reviewResults?.results as? [UserReview] {
            if reviews.isEmpty {
                let reviewItem = MovieDetailItem(section: .userReview, type: .emptyUserReview("No Review Available"))
                reviewDetailItem.append(contentsOf: [reviewItem])
                
            } else {
                let reviewItems = reviews.map { MovieDetailItem(section: .userReview, type: .userReviews($0)) }
                reviewDetailItem.append(contentsOf: reviewItems)
            }
            
        }
        
        if let trailers = await trailerResults?.results, !trailers.isEmpty {
            let randomIndex = Int.random(in: 0..<trailers.count)
            let randomTrailerKey = trailers[randomIndex].key
            
            reviewDetailItem.append(.init(section: .movieTrailer, type: .movieTrailer(randomTrailerKey)))
        } else {
            reviewDetailItem.append(.init(section: .movieTrailer, type: .emptyMovieTrailer("No Trailer Available")))
        }
        
        view?.applySnapshot(items: reviewDetailItem)
    }
    
    func navigate(to destination: MovieDetailsNavigationOption, navigationController: UINavigationController?) {
        self.wireframe.navigate(to: destination, navigationController: navigationController)
    }
    
}
