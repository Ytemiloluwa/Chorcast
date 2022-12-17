//
//  RssService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 17/12/2022.
//

import Foundation
import Combine
import FeedKit

class RssService: RssServiceProtocol {
    
    func publisher(urlString: String) -> AnyPublisher<FeedKit.Feed, FeedKit.ParserError> {
        
        guard let url = URL(string: urlString) else {
            
            return Fail(error: ParserError.internalError(reason: "Invalid url")).eraseToAnyPublisher()
        }
        
        let parser = FeedParser(URL: url)
        
        return Future<Feed, ParserError> { promise in
            
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { result in
                
                switch result {
                    
                case.success(let feed):
                    promise(.success(feed))
                case.failure(let error):
                    promise(.failure(error))
                }
            }
            
        }.eraseToAnyPublisher()
    }
    
}
