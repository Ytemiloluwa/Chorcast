//
//  CoreDataServiceProtocol.swift
//  PodcastApp
//
//  Created by Temiloluwa on 04/12/2022.
//

import Foundation

public protocol CoreDataserviceProtocol {
    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool
    func fetchGenres() -> [GenreViewModel]
    
}
