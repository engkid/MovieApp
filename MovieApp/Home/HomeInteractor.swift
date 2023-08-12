//
//  HomeInteractor.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class HomeInteractor {
    
    // MARK: - Private properties -
    private let service: NetworkService
    
    init(service: NetworkService = NetworkService.shared) {
        self.service = service
    }
    
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorInterface {
    
    func getGenreList() async throws -> Genres? {
        if let url = GenreEndpoint.home.urlEndpoint {
            return try await self.service.performRequest(url: url)
        }
        return nil
    }
    
}
