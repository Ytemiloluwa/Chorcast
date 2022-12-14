//
//  GenreViewModel.swift
//  PodcastApp
//
//  Created by Temiloluwa on 10/11/2022.
//

import Foundation

struct GenreViewModel: Identifiable, Equatable {
    
    var id: Int
    var name: String
    static let placeHolder = createPlaceholder(id: 1)
    
    static var listPlaceHolder: [GenreViewModel] {
        
        (0..<15).map {
            
            createPlaceholder(id: $0)
        }
    }
    
    private static func createPlaceholder(id: Int) -> GenreViewModel {
        
        GenreViewModel(Genre(id: id, name: "Technology"))
        
    }
    
    init(_ genre: Genre) {
        
        self.id = genre.id
        self.name = genre.name
    }
    
    init(genre managedObject: GenreManagedObject) {
        
        self.id = Int(managedObject.id)
        self.name = managedObject.name ?? ""
        
    }

}
