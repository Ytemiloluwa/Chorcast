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
    
    static func execute(action: Action.Api, state: AppState.Api, enviroment: AppEnviroment, completion: @escaping StateCompletion){
        
        switch action {
            
        case.fetchPodcasts(let term, let limit):
            
            let publisher = enviroment.api.remotePublisher(term: term, limit: limit)
            
        case.fetchGenres(let filename):
            let publisher = enviroment.api.localPublisher(filename: filename)
            
        }
    
      // return action
    }
}
