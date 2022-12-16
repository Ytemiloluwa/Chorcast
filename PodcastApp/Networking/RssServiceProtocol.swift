//
//  RssServiceProtocol.swift
//  PodcastApp
//
//  Created by Temiloluwa on 17/12/2022.
//

import Foundation
import Combine
import FeedKit

protocol RssServiceProtocol {
    
    func publisher(urlString: String) -> AnyPublisher<Feed, ParserError>
}
