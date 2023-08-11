//
//  HomeInterfaces.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol HomeWireframeInterface: WireframeInterface {
    
}

protocol HomeViewInterface: ViewInterface {
    func applySnapshot(item: [HomeItem])
}

protocol HomePresenterInterface: PresenterInterface {
    
    func getGenreList() async throws
    
}

protocol HomeInteractorInterface: InteractorInterface {
    
    func getGenreList() async throws -> Genres
    
}