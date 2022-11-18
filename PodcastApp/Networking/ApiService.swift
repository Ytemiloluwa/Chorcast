//
//  ApiService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 18/11/2022.
//

import Foundation
import Combine

public class APIService: ApiServiceProtocol {
    
    public func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError> {
        <#code#>
    }
    
    public func localPublisher(filename: String) -> AnyPublisher<Data, URLError> {
        <#code#>
    }
    
}
