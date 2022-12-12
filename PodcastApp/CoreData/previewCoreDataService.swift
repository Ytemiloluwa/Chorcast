//
//  previewCoreDataService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 12/12/2022.
//

import Foundation
import CoreData

class PreviewCoreDataService: CoreDataserviceProtocol {
    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool {
        return true
    }
    
    func fetchGenres() -> [GenreViewModel] {
        return GenreViewModel.listPlaceHolders
    }
}
