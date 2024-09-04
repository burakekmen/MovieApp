//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Burak Ekmen on 4.09.2024.
//

import SwiftUI
import Combine

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    @State private var isLoading: Bool = false

    init(imdbId: String) {
        self.viewModel = MovieDetailViewModel(imdbId: imdbId)
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    let movie = viewModel.responseMovieDetail
                    
                    CustomImageView(url: movie?.poster ?? "")
                        .frame(width: UIScreen.main.bounds.width * 0.6,
                               height: UIScreen.main.bounds.width * 0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                        .padding(.top, 20)

                    Text(movie?.title ?? "Title")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text(movie?.year ?? "Year")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text(movie?.plot ?? "Plot")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)

                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Director:")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(movie?.director ?? "Unknown")
                                .font(.body)
                                .foregroundColor(.secondary)

                            Text("Genre:")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(movie?.genre ?? "Unknown")
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                }
            }
            .onAppear {
                viewModel.getMovieDetail()
            }
            .onReceive(viewModel._loadingState) { isLoading in
                self.isLoading = isLoading
            }
            .onReceive(viewModel._errorState) { error in
                print("Error occurred: \(error)")
            }
            .onReceive(viewModel.responseMovieDetailPublisher) { movie in
                viewModel.responseMovieDetail = movie
            }

            if isLoading {
                ProgressView("Loading Movie...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .foregroundColor(.white)
                    .scaleEffect(1.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.4))
                    .ignoresSafeArea()
            }
        }
        .navigationBarTitleDisplayMode(.inline) // NavigationView boşluğunu azaltır
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.light)
    }
}

#Preview {
    MovieDetailView(imdbId: "")
}
