//
//  ContentView.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import SwiftUI
import Combine

struct MoviesView: View {
    @StateObject var viewModel = MoviesViewModel()
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        // Filmleri listele
        List(viewModel.responseMovies?.movies ?? [], id: \.imdbId) { movie in
            if let title = movie.title {
                Text(title)
            }
        }

            .onAppear {
            // Ekran göründüğünde filmi ara
            viewModel.searchMovies(query: "Inception")
        }
        // Combine publisher'ları dinle
        .onReceive(viewModel._loadingState) { isLoading in
            // Loading durumunu UI'da kullanmak için
            print("Loading state changed: \(isLoading)")
        }
            .onReceive(viewModel._errorState) { error in
            // Error state'ini UI'da göstermek için
            print("Error occurred: \(error)")
        }
            .onReceive(viewModel.responseMoviesPublisher) { movies in
            viewModel.responseMovies = movies
        }
    }
}

#Preview {
    MoviesView()
}
