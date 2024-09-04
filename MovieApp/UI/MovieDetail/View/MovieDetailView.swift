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
        ZStack { // ZStack ekleyerek ProgressView'in List'in üstünde olmasını sağlıyoruz
            VStack {
                Text(viewModel.responseMovieDetail?.plot ?? "")
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

#Preview {
    MovieDetailView(imdbId: "tt0468569")
}
