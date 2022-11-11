//
//  EpisodeViewModel.swift
//  PodcastApp
//
//  Created by Temiloluwa on 10/11/2022.
//

import Foundation
import FeedKit

struct EpisodeViewModel: Identifiable {
    
    let id = UUID()
    var tittle, description: String
    var date: String
    var audioUrl: String
    var audio: Data?
    var audioLength: Double
    var audioSize: String
    var podcast: GenreViewModel = .placeHolder
    
    
}

