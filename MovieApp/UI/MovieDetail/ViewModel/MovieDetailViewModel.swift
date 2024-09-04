//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Burak Ekmen on 4.09.2024.
//

import Foundation
import Combine
import SwiftUI

class MovieDetailViewModel: BaseViewModel {

    // MARK: Private Props
    private let errorState = ErrorStateSubject()
    private let loadingState = LoadingPublisherSubject()
    private let service = MovieService.self

    // MARK: Public Props
    var _errorState: ErrorStateSubject { errorState }
    var _loadingState: LoadingPublisherSubject { loadingState }

    // MARK: Models
    @Published var responseMovieDetailPublisher = ResponsePublisherSubject<MovieDetail>()
    @Published var responseMovieDetail: MovieDetail?
    
    let imdbId: String
    
    init(imdbId: String) {
        self.imdbId = imdbId
        super.init()
    }
}


// MARK: Service
extension MovieDetailViewModel {
    
    func getMovieDetail() {
        handleRequest(
            endpoint: service.getMovieDetail(imdbId: self.imdbId).path,
            errorState: errorState,
            response: responseMovieDetailPublisher,
            loadingPublisher: loadingState
        )
    }
    
}
