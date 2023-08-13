//
//  MovieListWireframe.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieListWireframe: BaseWireframe<MovieListViewController> {

    // MARK: - Module setup -

    init(movieId: String) {
        let moduleViewController = MovieListViewController()
        super.init(viewController: moduleViewController)

        let interactor: MovieListInteractorInterface = MovieListInteractor(movieId: movieId)
        let presenter = MovieListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieListWireframe: MovieListWireframeInterface {
    
    func navigateToMovieDetails(destination: MovieListNavigationOption, _ navigationController: UINavigationController? = nil) {
        switch destination {
        case .movieDetails(let movie):
            navigationController?.pushWireframe(MovieDetailWireframe(movie: movie))
            return
        }
    }
    
}