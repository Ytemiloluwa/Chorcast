//
//  ApiReducer.swift
//  PodcastApp
//
//  Created by Temiloluwa on 24/11/2022.
//

import Foundation
import Combine

enum ApiReducer {
    
    typealias StateCompletion = ((AppState.Api) -> Void)
    
    static func execute(action: Action.Api, state: AppState.Api, enviroment: AppEnviroment, completion: @escaping StateCompletion) -> AnyCancellable{
        
        switch action {
            
        case.fetchPodcasts(let term, let limit):
            
            let publisher = enviroment.api.remotePublisher(term: term, limit: limit)
            
            return suscribe(to: publisher, type: PodcastList.self, enviroment: enviroment) { result, _ in
                
               
            }
            
            
            
        case.fetchGenres(let filename):
            let publisher = enviroment.api.localPublisher(filename: filename)
            
            
            return suscribe(to: publisher, type: GenreList.self, enviroment: enviroment) { result, _ in
                
                
                
            }
            
        }
        
        
    }
    
    private static func suscribe<T: Codable>(to publisher: AnyPublisher<Data, URLError>, type: T.Type, enviroment: AppEnviroment, completion: @escaping (T?, Error?) -> Void) -> AnyCancellable {
        
        
        publisher
            .decode(type: type, decoder: enviroment.decoder)
            .receive(on: DispatchQueue.main)
            .sink { status in
                
                if case .failure(let error) = status {
                    
                    Log.error(error)
                    completion(nil, error)
                }
            }receiveValue: { result in
                
                completion(result, nil )
                
            }
        
    }
    
 
    
    private static func setPreferredPodcasts() {
        
        
    }
}
