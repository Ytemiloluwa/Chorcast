//
//  previewCoreDataService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 12/12/2022.
//

import Foundation
import CoreData

class PreviewCoreDataService: CoreDataServiceProtocol {
    
    func fetchAllManagedPodcast(bookmarkedOnly: Bool) -> [PodcastViewModel] {
        
        return PodcastViewModel.listPlaceholder
    }
    
    
    func bookmarkPodcast(_ podcast: PodcastViewModel) -> PodcastManagedObject? {
        
       return nil
    }
    
    func deleteBookmark(_ id: Int) -> PodcastManagedObject? {
        
        return nil
    }
    
    func fetchEpisode(_ episode: EpisodeViewModel) -> EpisodeManagedObject? {
        return nil
    }
    
    func fetchPodcast(_ id: Int) -> PodcastManagedObject? {
        
        return nil
    }
    
    func saveEpisode(_ episode: EpisodeViewModel, audio: Data) -> Bool {
        
        return false
    }
    
    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool {
        return true
    }
    
    func fetchGenres() -> [GenreViewModel] {
        return GenreViewModel.listPlaceHolder
    }
}
