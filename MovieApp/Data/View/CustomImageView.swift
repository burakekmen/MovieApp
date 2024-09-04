//
//  CustomImageView.swift
//  MovieApp
//
//  Created by Burak Ekmen on 4.09.2024.
//

import SwiftUI
import Kingfisher

struct CustomImageView: View {
    let url: String
    @State private var loadFailed = false

    init(url: String) {
        self.url = url
    }

    var body: some View {
        if loadFailed {
            Image("imgPlaceholder")
                .resizable()
        } else if let url = URL(string: url) {
            KFImage(url)
                .resizable()
                .roundCorner(
                radius: .widthFraction(0.1),
                roundingCorners: [.all]
            )
                .fade(duration: 0.1)
                .serialize(as: .PNG)
                .onFailure { _ in
                loadFailed = true
            }
        } else {
            Image("imgPlaceholder")
                .resizable()
        }
    }
}

#Preview {
    CustomImageView(url: "https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg")
}

