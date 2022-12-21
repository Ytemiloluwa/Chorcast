//
//  previewCoreDataService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 12/12/2022.
//

import Foundation
import CoreData

class PreviewCoreDataService: CoreDataserviceProtocol {
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
