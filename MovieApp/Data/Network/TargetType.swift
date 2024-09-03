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

    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateEndPoint(lastPath: lastPath)
    }
}
