//
//  MovieListPresenter.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
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
}
