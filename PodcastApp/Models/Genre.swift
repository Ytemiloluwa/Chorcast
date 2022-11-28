//
//  Genre.swift
//  PodcastApp
//
//  Created by Temiloluwa on 10/11/2022.
//

import Foundation

struct GenreList: Codable {
    
    let genres: [Genre]
}

struct Genre: Codable {
    
    let id: Int
    let name: String
}
