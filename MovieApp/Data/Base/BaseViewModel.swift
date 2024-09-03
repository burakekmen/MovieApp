//
//  BaseViewModel.swift
//  MovieApp
//
//  Created by Burak Ekmen on 3.09.2024.
//

import Foundation
import Combine
import SwiftUI

typealias ErrorStateSubject = PassthroughSubject<Error, Never>
typealias LoadingPublisherSubject = PassthroughSubject<Bool, Never>
typealias ResponsePublisherSubject<T: Codable> = PassthroughSubject<T, Never>

class BaseViewModel: ObservableObject {
    
    let client = Client()
    
    func handleRequest<RESPONSE: Codable> (
        endpoint: String,
        errorState: ErrorStateSubject?,
        response: ResponsePublisherSubject<RESPONSE>,
        loadingPublisher: LoadingPublisherSubject?) {
        
        loadingPublisher?.send(true)
        client.requestRestApi(endpoint: endpoint) { (result: Result<RESPONSE?, ClientError>) in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let data):
                    if let data {
                        response.send(data)
                    }
                    
                    loadingPublisher?.send(false)
                    
                case .failure(let error):
                    errorState?.send(error)
                    loadingPublisher?.send(false)
                    
                }
                
            }
        }
        
    }
    
}
