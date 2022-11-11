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
   // var podcast: GenreViewModel = .placeHolder
    
    static var placeholder: EpisodeViewModel {
        
        createPlaceholder()
    }
    
    static var listPlaceholder: [EpisodeViewModel] {
        
        (0...10).map { _ in
        
            createPlaceholder()
        }
    }
    
    private static func createPlaceholder() -> EpisodeViewModel {
        
        EpisodeViewModel(tittle: "Lorem ipsum", description: "", date:  "20 sept 2020", audioUrl: "", audioLength: 120, audioSize: "13MB")
    }
    
}

