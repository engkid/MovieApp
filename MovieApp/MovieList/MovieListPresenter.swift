//
//  MovieListPresenter.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MovieListPresenter {

    // MARK: - Private properties -

    private weak var view: MovieListViewInterface?
    private let interactor: MovieListInteractorInterface
    private let wireframe: MovieListWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: MovieListViewInterface?,
        interactor: MovieListInteractorInterface,
        wireframe: MovieListWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension MovieListPresenter: MovieListPresenterInterface {
    
    func discoverMovie() async throws {
        
        Task {
            let movieListResult: MovieResults? = try? await interactor.discoverMovie(by: interactor.movieId ?? "")
            
            if let movies = movieListResult?.results as? [Movie] {
                let movieListItem = movies.map { movie in
                    MovieListItem(section: .movieList, type: .movieList(movie))
                }
                
                view?.applySnapshot(item: movieListItem)
            }
            
        }
    }
    
}
