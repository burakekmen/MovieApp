//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Burak Ekmen on 3.09.2024.
//

import SwiftUI
import Combine

struct MoviesView: View {
    @ObservedObject var viewModel: MoviesViewModel

    @State private var searchableMovie: String = ""
    @State private var isLoading: Bool = false

    init(viewModel: MoviesViewModel = MoviesViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack { // ZStack ekleyerek ProgressView'in List'in üstünde olmasını sağlıyoruz
                VStack {
                    TextField("Search Movie...", text: $searchableMovie, onCommit: {
                        viewModel.searchMovies(query: searchableMovie)
                    })
                        .padding()
                        .textFieldStyle(.roundedBorder)

                    List(viewModel.responseMovies?.movies ?? [], id: \.imdbId) { movie in
                        NavigationLink(destination: MovieDetailView(imdbId: movie.imdbId ?? ""),
                                       label: {
                                           HStack {
                                               CustomImageView(url: movie.poster ?? "")
                                                   .frame(width: 90, height: 130)

                                               VStack(alignment: .leading) {
                                                   Text(movie.title ?? "")
                                                       .font(.title3)
                                                       .lineLimit(2)
                                                       .minimumScaleFactor(0.7)
                                                       .foregroundStyle(.blue)

                                                   Text(movie.year ?? "")
                                                       .foregroundStyle(.orange)
                                               }
                                           }
                                       })
                    }
                        .navigationTitle("Movies")
                }
                    .onAppear {
                    print("onAppear")
                }
                    .onReceive(viewModel._loadingState) { isLoading in
                    self.isLoading = isLoading
                }
                    .onReceive(viewModel._errorState) { error in
                    print("Error occurred: \(error)")
                }
                    .onReceive(viewModel.responseMoviesPublisher) { movies in
                    viewModel.responseMovies = movies
                }

                if isLoading {
                    ProgressView("Loading Movies...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                        .scaleEffect(1.5) // Daha büyük bir ProgressView
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Tam ekran kapla
                    .background(Color.black.opacity(0.4)) // Arka planı karart
                    .cornerRadius(10) // Köşeleri yuvarlat
                    .ignoresSafeArea() // Safe area'yı da kaplasın
                }
            }
                .navigationViewStyle(StackNavigationViewStyle())
                .preferredColorScheme(.light)
        }
    }
}

#Preview {
    MoviesView()
}
