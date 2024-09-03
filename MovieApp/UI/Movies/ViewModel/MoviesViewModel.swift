//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Burak Ekmen on 3.09.2024.
//

import Foundation
import Combine
import SwiftUI

class MoviesViewModel: BaseViewModel {

    // MARK: Private Props
    private let errorState = ErrorStateSubject()
    private let loadingState = LoadingPublisherSubject()
    private let service = MovieService.self

    // MARK: Public Props
    var _errorState: ErrorStateSubject { errorState }
    var _loadingState: LoadingPublisherSubject { loadingState }

    // MARK: Models
    @Published var responseMoviesPublisher = ResponsePublisherSubject<SearchResult>()
    @Published var responseMovies: SearchResult?
    
}


// MARK: Service
extension MoviesViewModel {
    
    func searchMovies(query: String) {
        handleRequest(
            endpoint: service.getMovies(query: query).path,
            errorState: errorState,
            response: responseMoviesPublisher,
            loadingPublisher: loadingState
        )
    }
    
}
