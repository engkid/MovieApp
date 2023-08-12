//
//  HomeWireframe.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeWireframe: BaseWireframe<HomeViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = HomeViewController()
        super.init(viewController: moduleViewController)

        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
    
    func navigate(to destination: HomeNavigationOption, navigationController: UINavigationController? = nil) {
        switch destination {
        case .movieList(let movieId):
            navigationController?.pushWireframe(MovieListWireframe(movieId: movieId
                                                                  ))
        }
    }
}
