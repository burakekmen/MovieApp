//
//  TargetType.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

public protocol TargetType {

}

extension TargetType {

    var baseURL: URL {
        return URL(string: NetworkUtil.baseURL)!
    }

    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateMobileEndPointV1(lastPath: lastPath)
    }
}
