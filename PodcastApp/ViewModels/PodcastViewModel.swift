//
//  PodcastViewModel.swift
//  PodcastApp
//
//  Created by Temiloluwa on 11/11/2022.
//

import Foundation
import FeedKit

struct PodcastViewModel: Identifiable, Equatable {
    
    static func == (lhs: PodcastViewModel, rhs: PodcastViewModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.language == rhs.language &&
        lhs.episodes.count == rhs.episodes.count &&
        lhs.image.count == rhs.image.count &&
        lhs.thumbnail.count == rhs.thumbnail.count
    }
    
    var id: Int
    var title: String
    var publisher: String
    var imageUrl: String
    var thumbnailUrl: String = ""
    var image = Data()
    var thumbnail = Data()
    var author: String
    var totalEpisodes: Int
    var explicitContent: String
    var description: String
    var date: String = ""
    var language: String?
    var country: String
    var genres: [String] = []
    var episodes: [EpisodeViewModel] = []
    var nextEpisodePubDate: Date
    var feedUrl: String
    var isBookmarked = false
    static var placeHolder: PodcastViewModel {
        
        createPlaceholder(id: 0)

    }
    
    static var listPlaceholder: [PodcastViewModel] {
        
        (0..<10).map {
            
            createPlaceholder(id: $0)
        }
    }
    
    private static func createPlaceholder(id: Int) -> PodcastViewModel {
        
        PodcastViewModel(id: id,
                         title: "Lorem ipsum",
                         publisher: "Lorem ipsum", imageUrl: "https://via.placeholder.com/150/2EB9F0/000000?Text=liquidcoder.com",
                         author: "Lorem ipsum",
                         totalEpisodes: 23,
                         explicitContent: "NO",
                         description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                         country: "US",
                         genres: ["Technology", "NFL", "Comedy", "Politics", "Geography"],
                         nextEpisodePubDate: Date(),
                         feedUrl: "")

        
    }
    internal init(id: Int, title: String, publisher: String? = nil, imageUrl: String, thumbnailUrl: String? = nil, image: Data? = nil, thumbnail: Data? = nil,  author: String? = nil, totalEpisodes: Int, explicitContent: String, description: String, date: String? = nil, language: String? = nil, country: String, genres: [String]? = nil, episodes: [EpisodeViewModel]? = nil, nextEpisodePubDate: Date, feedUrl: String, isBookmarked: Bool = false) {
        
        self.id = id
        self.title = title
        self.publisher = publisher ?? ""
        self.imageUrl = imageUrl
        self.thumbnailUrl = thumbnailUrl ?? ""
        self.image = image ?? Data()
        self.thumbnail = thumbnail ?? Data()
        self.author = author ?? ""
        self.totalEpisodes = totalEpisodes
        self.explicitContent = explicitContent
        self.description = description
        self.date = date ?? ""
        self.language = language
        self.country = country
        self.genres = genres ?? []
        self.episodes = episodes ?? []
        self.nextEpisodePubDate = nextEpisodePubDate
        self.feedUrl = feedUrl
        self.isBookmarked = isBookmarked
    }
    
    init(podcast: Podcast) {
        
        self.id = podcast.collectionID
        self.title = podcast.collectionName ?? ""
        self.publisher = ""
        self.imageUrl = podcast.artworkUrl600 ?? ""
        self.thumbnailUrl = podcast.artworkUrl100 ?? ""
        self.author = podcast.artistName ?? ""
        self.totalEpisodes = podcast.trackCount ?? 0
        self.explicitContent = podcast.collectionExplicitness ?? ""
        self.description = podcast.description ?? ""
        self.date = podcast.releaseDate?.formatDate() ?? ""
        self.language = nil
        self.country = podcast.country ?? ""
        self.genres = podcast.genres ?? []
        self.episodes = []
        self.nextEpisodePubDate = Date()
        self.feedUrl = podcast.feedURL ?? ""
        
    }
    
    init(_ feed: RSSFeed, existingPodcast: PodcastViewModel? = nil) {
        
        self.id = existingPodcast?.id ?? 0
        self.title = existingPodcast?.title ?? ""
        self.imageUrl = existingPodcast?.imageUrl ?? ""
        self.author = existingPodcast?.author ?? ""
        self.thumbnailUrl = existingPodcast?.thumbnailUrl ?? ""
        self.image = existingPodcast?.image ?? Data()
        self.thumbnail = existingPodcast?.thumbnail ?? Data()
        self.totalEpisodes = existingPodcast?.episodes.count ?? 0
        self.country = existingPodcast?.country ?? ""
        self.genres = existingPodcast?.genres ?? []
        self.feedUrl = existingPodcast?.feedUrl ?? ""
        self.isBookmarked = existingPodcast?.isBookmarked ?? false
        self.publisher = feed.managingEditor ?? ""
        self.explicitContent = feed.iTunes?.iTunesExplicit ?? ""
        self.description = feed.description ?? "No description"
        self.language = feed.language ?? ""
        self.nextEpisodePubDate = Date()
        
        self.episodes = feed.items?.compactMap({ item in
            
            EpisodeViewModel(feedItem: item, podcast: self)
        }) ?? []
        
        self.date = feed.pubDate.map { $0.format()} ?? ""
        
        if imageUrl.isEmpty {
            
            if let imgUrl = feed.iTunes?.iTunesImage?.attributes?.href {
                
                self.imageUrl = imgUrl
            }
        }
        
    }
    
    init(_ managedPodcast: PodcastManagedObject, existingPodcast: PodcastViewModel? = nil) {
        
        self.id = Int(managedPodcast.id)
        self.title = managedPodcast.title ?? ""
        self.imageUrl = managedPodcast.imageUrl ?? ""
        self.author = managedPodcast.author ?? ""
        self.thumbnailUrl = managedPodcast.thumbnailUrl ?? ""
        self.image = managedPodcast.image ?? Data()
        self.thumbnail = managedPodcast.thumbnail ?? Data()
        self.totalEpisodes = managedPodcast.episodes?.count ?? 0
        self.explicitContent = managedPodcast.explicitContent ?? ""
        self.description = managedPodcast.descr ?? ""
        self.language = managedPodcast.langugage ?? ""
        self.country = managedPodcast.country ?? ""
        self.publisher = managedPodcast.publisher ?? ""
        self.genres = managedPodcast.genres?.components(separatedBy: ", ") ?? []
        self.nextEpisodePubDate = Date()
        self.feedUrl = managedPodcast.feedUrl ?? ""
        self.episodes = existingPodcast?.episodes.map({  episode in
            
            if let managedEpisode = managedPodcast.episodesArray.first(where: {$0.title == episode.title}) {
                
                return EpisodeViewModel(downloaded: managedEpisode, podcast: self)
            }else {
                
                return episode
            }
            
        }) ?? []
        self.isBookmarked = managedPodcast.isBookmarked
    }
    
}
