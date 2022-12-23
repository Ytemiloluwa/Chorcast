//
//  CoreDataReducer.swift
//  PodcastApp
//
//  Created by Temiloluwa on 05/12/2022.
//

import Foundation

struct CoreDataReducer {
    
    static func execute(action: Action.CoreData, state: inout AppState.CoreData, environment: AppEnvironment){
        
        switch action {
            
        case.fetchGenres:
            state.savedGenres = environment.coredata.fetchGenres()
        case.saveGenres(let genres):
            _ = environment.coredata.saveGenres(genres)
        
        case .fetchPodcasts(let podcast):
            _ = environment.coredata.fetchPodcast(podcast.id)
//            if let managedPodcast = environment.coredata.fetchPodcast(podcast.id) {
//
//                let podcast = PodcastViewModel(managedPodcast, existingPodcast: podcast)
//                state.savedPodcast = .success(podcast)
//            }else {
//                state.savedPodcast = .failure
//            }
        }
    }
}
