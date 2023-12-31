//
//  UserReviewsWireframe.swift
//  MovieApp
//
//  Created by k1d_dev on 14/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class UserReviewsWireframe: BaseWireframe<UserReviewsViewController> {

    // MARK: - Private properties -
    
    // MARK: - Module setup -

    init(movieId: String) {
        let moduleViewController = UserReviewsViewController()
        super.init(viewController: moduleViewController)

        let interactor = UserReviewsInteractor(movieId: movieId)
        let presenter = UserReviewsPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension UserReviewsWireframe: UserReviewsWireframeInterface {
}
