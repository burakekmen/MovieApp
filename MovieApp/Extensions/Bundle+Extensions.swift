//
//  Bundle+Extensions.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

extension Bundle {
    
    func getValueWithKeyFromBundle(bundleKey: String, defaultValue: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: bundleKey) as? String else {
            return defaultValue
        }
        return value
    }
}

