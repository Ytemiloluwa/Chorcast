//
//  CoreDataService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 05/12/2022.
//

import Foundation
import CoreData

class CoreDataService: CoreDataserviceProtocol {
    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool {
        return false
    }
    
    func fetchGenres() -> [GenreViewModel] {
        return []
    }
}
