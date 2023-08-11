//
//  MovieListWireframe.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieListWireframe: BaseWireframe<MovieListViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = MovieListViewController()
        super.init(viewController: moduleViewController)

        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieListWireframe: MovieListWireframeInterface {
}
