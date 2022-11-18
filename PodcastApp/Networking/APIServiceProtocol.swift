//
//  APIServiceProtocol.swift
//  PodcastApp
//
//  Created by Temiloluwa on 18/11/2022.
//

import Foundation
import Combine


public protocol ApiServiceProtocol {
    
    // remote calling
    func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError>
    
    //parsing local file
    
    func localPublisher(filename: String) -> AnyPublisher<Data, URLError>
    
}
