//
//  ApiService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 18/11/2022.
//

import Foundation
import Combine

public class APIService: ApiServiceProtocol {
    
    // session object is being used to make http request to fetch data over the network
    private var session: URLSession {
        
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.waitsForConnectivity = true
        config.requestCachePolicy = .reloadRevalidatingCacheData
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }
    
    private func buildUrl(term: String, limit: Int) -> URL? {
        
        let queryItems = [URLQueryItem(name: "entity", value: "podcast"),
        URLQueryItem(name: "term", value: term),
        URLQueryItem(name: "limit", value: "\(limit)")]
        
        var components = URLComponents(url: ConfigParser.baseUrl, resolvingAgainstBaseURL: false)
        
        components?.queryItems = queryItems    
    }
    
    public func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError> {
        <#code#>
    }
    
    public func localPublisher(filename: String) -> AnyPublisher<Data, URLError> {
        <#code#>
    }
    
}
