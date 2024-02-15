//
//  MovieListPresenterTests.swift
//  MovieListPresenterTests
//
//  Created by k1d_dev on 11/08/23.
//

import XCTest
@testable import MovieApp

final class MovieListPresenterTests: XCTestCase {
	
	private var presenter: MovieListPresenter<MovieListViewInterfaceMock>!
	private var interactor: MovieListInteractorMock!
	private var wireframe: MovieListWireframeMock!
	private var view: MovieListViewInterfaceMock!
	
	override func setUp() {
		interactor = MovieListInteractorMock()
		wireframe = MovieListWireframeMock()
		view = MovieListViewInterfaceMock()
		presenter = MovieListPresenter(view: view, interactor: interactor, wireframe: wireframe)
	}
	
	override func tearDown() {
		interactor = nil
		wireframe = nil
		view = nil
		presenter = nil
	}
	
	func testDiscoverMovieSuccess() async {
		var mockResult: Result<TMDBApiResult<Movie>, Error>?
		
		let expectation = XCTestExpectation(description: "Discover movie success")
		
		mockResult = .success(
			.init(
				id: 1,
				page: nil,
				results: [
					.init(adult: false, backdropPath: nil, genreIds: [1], id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 0.0, posterPath: nil, releaseDate: "", title: "Mock Movie", video: true, voteAverage: 0.0, voteCount: 0)], totalPages: nil, totalResults: nil
			)
		)
		
		interactor.mockResult = mockResult
		
		
		Task {
			do {
				
				let _ = try await presenter.discoverMovie()
				expectation.fulfill()
			} catch {
				XCTFail("Failed to discover movie: \(error)")
			}
		}
		
		await fulfillment(of: [expectation], timeout: 0.5)
		
		XCTAssertTrue(interactor.discoverMovieCalled)
		XCTAssertEqual(view.setStateCalls.count, 2)
	}
	
}

extension MovieListPresenterTests {
	func makeSUT() -> MovieListPresenterInterface? {
		return nil
	}
}

class MovieListInteractorMock: MovieListInteractorInterface {
	
	var movieId: String = ""
	
	var mockResult: Result<TMDBApiResult<Movie>, Error>?
	var discoverMovieCalled = false
	
	func discoverMovie(by id: String, page: String) async throws -> TMDBApiResult<Movie>? {
		discoverMovieCalled = true
		if let result = mockResult {
			switch result {
			case .success(let movieResult):
				return movieResult
			case .failure(let error):
				throw error
			}
		}
		return nil
	}
}

class MovieListWireframeMock: MovieListWireframeInterface {
	func navigateToMovieDetails(destination: MovieListNavigationOption, _ navigationController: UINavigationController?) {
		// Implement mock behavior if needed
	}
}

class MovieListViewInterfaceMock: MovieListViewInterface {
	var setStateCalls: [(state: ViewState<[MovieListItem]>, Void)] = []
	
	func setState(_ state: ViewState<[MovieListItem]>) {
		setStateCalls.append((state, ()))
	}
}
