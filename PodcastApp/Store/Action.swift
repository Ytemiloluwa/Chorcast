//
//  Action.swift
//  PodcastApp
//
//  Created by Temiloluwa on 23/11/2022.
//

import Foundation

enum Action {
    
    enum Api {
        
        case fetchPodcasts(_ term: String, limit: Int = 10)
        case fetchGenres(_filename : String)
    }
    
    
}
