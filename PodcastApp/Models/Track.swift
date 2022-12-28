//
//  Track.swift
//  PodcastApp
//
//  Created by Temiloluwa on 28/12/2022.
//

import Foundation

struct Track: Equatable {
    
    var title, imageUrl, podcastName, description, audioUrl, releaseDate: String
    var duration: Double
    var image: Data?
    var audio: Data? = nil
    var nextEpisodes: [EpisodeViewModel] = []
    
    static var placeholder = Track(title: "#1538 - Douglas Murray",
                                   imageUrl: "https://via.placeholder.com/150/2EB9F0/000000?Text=liquidcoder.com",
                                   podcastName: "The Joe Rogan Experience",
                                   description: "Writer, journalist, and political commentator Douglas Murray is the author",
                                   audioUrl: "", releaseDate: "wed, 30 Sep 2020", duration: 2000)
    
    init(title: String, imageUrl: String, podcastName: String, description: String, audioUrl: String, releaseDate: String, duration: Double) {
        
        self.title = title
        self.imageUrl = imageUrl
        self.podcastName = podcastName
        self.description = description
        self.audioUrl = audioUrl
        self.releaseDate = releaseDate
        self.duration = duration
        
    }
    
    
    init(_ episode: EpisodeViewModel, nextEpisodes: [EpisodeViewModel]) {
        
        self.title = episode.title
        self.imageUrl = episode.podcast.imageUrl
        self.podcastName = episode.podcast.title
        self.image = episode.podcast.image
        self.description = episode.description
        self.audioUrl = episode.audioUrl
        self.releaseDate = episode.date
        self.duration = episode.audioLength
        self.audio = episode.audio
        self.nextEpisodes = nextEpisodes
    }
    
    static func ==(lhs: Track, rhs: Track) -> Bool {
        
        return lhs.title == rhs.title && lhs.podcastName == rhs.podcastName
    }
}
