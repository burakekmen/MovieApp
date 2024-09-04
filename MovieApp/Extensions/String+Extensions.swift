//
//  String+Extensions.swift
//  MovieApp
//
//  Created by Burak Ekmen on 4.09.2024.
//

import Foundation

extension String {
    
    var trimmingCharacters: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
