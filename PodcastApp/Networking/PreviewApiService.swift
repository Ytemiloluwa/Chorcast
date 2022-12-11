//
//  PreviewApiService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 11/12/2022.
//

import Foundation
import Combine

class previewApiService: ApiServiceProtocol {
    
    
    func createPublisher(for filename: String) -> AnyPublisher<Data, URLError> {
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json"), let data = try? Data(contentsOf: url) else {
            
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            
        }
        
        return CurrentValueSubject<Data, URLError>(data)
            .delay(for: 5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError> {
        
        return createPublisher(for: "podcasts")
    }
    
    func localPublisher(filename: String) -> AnyPublisher<Data, URLError> {
        
        return createPublisher(for: "genres")
    }
    
}
