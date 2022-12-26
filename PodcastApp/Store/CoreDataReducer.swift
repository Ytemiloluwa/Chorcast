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
        
        case .fetchPodcast(let podcast):
             let managedPodcast = environment.coredata.fetchPodcast(podcast.id)
            updateState(&state, savedPodcast: managedPodcast, existingPodcast: podcast)
        
        case .bookmark(let podcast):
            
            if let managedPodcast = environment.coredata.bookmarkPodcast(podcast){
                updateState(&state, savedPodcast: managedPodcast, existingPodcast: podcast)
                
            }
        case.unbookmarked(let podcast):
            let managedPodcast = environment.coredata.unbookmarkedPodcast(podcast.id)
                
            updateState(&state, savedPodcast: managedPodcast, existingPodcast: podcast)
            
        case.fetchBookmarkedPodcasts:
            let podcasts = environment.coredata.fetchAllPodcast(bookmarkedOnly: true, OnlyContainingEpisodes: false)
            state.bookmarkedPodcasts = .success(podcasts)
            
        case .fetchPodcastWithEpisodes:
            let podcast = environment.coredata.fetchAllPodcast(bookmarkedOnly: false, OnlyContainingEpisodes: true)
            state.podcastsWithEpisodes = .success(podcast)
        }
    }
    
    private static func updateState(_ state: inout AppState.CoreData, savedPodcast: PodcastManagedObject?, existingPodcast: PodcastViewModel) {
        
        if let managedPodcast = savedPodcast {
            
            let podcast = PodcastViewModel(managedPodcast, existingPodcast: existingPodcast)
            state.savedPodcast = .success(podcast)
            
        }else {
            
            state.savedPodcast = .failure
        }
        
    }
    
}
