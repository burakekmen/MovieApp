//
//  NetworkUtil.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

struct NetworkUtil {

    static var baseURL: String {
        return Bundle.main.getValueWithKeyFromBundle(bundleKey: "BaseUrl", defaultValue: "https://www.omdbapi.com/")
    }
    
    static var apiKey: String {
        return Bundle.main.getValueWithKeyFromBundle(bundleKey: "ApiKey", defaultValue: "")
    }
    
    static func generateMobileEndPointV1(lastPath: String) -> String {
        return "?apikey=\(apiKey)?\(lastPath)"
    }
    
}
