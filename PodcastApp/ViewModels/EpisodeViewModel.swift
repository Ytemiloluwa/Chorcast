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
    var title, description: String
    var date: String
    var audioUrl: String
    var audio: Data?
    var audioLength: Double
    var audioSize: String
    var podcast: PodcastViewModel = .placeHolder
    
    static var placeholder: EpisodeViewModel {
        
        createPlaceholder()
    }
    
    static var listPlaceholder: [EpisodeViewModel] {
        
        (0...10).map { _ in
        
            createPlaceholder()
        }
    }

    private static func createPlaceholder() -> EpisodeViewModel {
        
        EpisodeViewModel(title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", date:  "20 sept 2020", audio: "", audioLength: 120, audioSize: "13MB", podcast: .placeHolder)
    }
    
    internal init(title: String, description: String, date: String, audio: String, audioLength: Double, audioSize: String, podcast: PodcastViewModel) {
        
        self.title = title
        self.description = description
        self.date = date
        self.audioUrl = audio
        self.audioSize = audioSize
        self.audioLength = audioLength
        self.podcast = podcast

    }

    init(feedItem: RSSFeedItem, podcast: PodcastViewModel) {

        self.title = feedItem.title ?? ""
        self.description = feedItem.description ?? ""
        self.date = feedItem.pubDate.map { $0.formatted() } ?? ""
        self.audioUrl = feedItem.enclosure?.attributes?.url ?? ""
        self.audioLength = feedItem.iTunes?.iTunesDuration ?? 0
        self.audioSize = feedItem.enclosure?.attributes?.length.map { "\($0 / 1000000)MB" } ?? "0 mb"
        self.podcast = podcast
    }
}
