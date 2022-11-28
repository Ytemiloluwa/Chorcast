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
        return URLSession(configuration: config)
    }
    
    private func buildUrl(term: String, limit: Int) -> URL? {
        
        let queryItems = [
        URLQueryItem(name: "entity", value: "podcast"),
        URLQueryItem(name: "term", value: term),
        URLQueryItem(name: "limit", value: "\(limit)")]
        
        var components = URLComponents(url: ConfigParser.baseUrl, resolvingAgainstBaseURL: false)
        
        components?.queryItems = queryItems
        
        return components?.url
    }
    
    public func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError> {
        guard let url = buildUrl(term: term, limit: limit) else {
            
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            
        }
        
        return session
            .dataTaskPublisher(for: url)
            .retry(3)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    public func localPublisher(filename: String) -> AnyPublisher<Data, URLError> {
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return CurrentValueSubject(data).eraseToAnyPublisher()
    }
    
}
