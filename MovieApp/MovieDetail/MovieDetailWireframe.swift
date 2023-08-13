//
//  MovieDetailWireframe.swift
//  MovieApp
//
//  Created by k1d_dev on 12/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieDetailWireframe: BaseWireframe<MovieDetailViewController> {

    // MARK: - Module setup -

    init(movie: Movie) {
        let moduleViewController = MovieDetailViewController()
        super.init(viewController: moduleViewController)

        let interactor = MovieDetailInteractor(movie: movie)
        let presenter = MovieDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self, title: movie.title)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieDetailWireframe: MovieDetailWireframeInterface {
    
    
    
}
