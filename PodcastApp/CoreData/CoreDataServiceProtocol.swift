//
//  CoreDataServiceProtocol.swift
//  PodcastApp
//
//  Created by Temiloluwa on 04/12/2022.
//

import Foundation

protocol CoreDataServiceProtocol {
    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool
    func fetchGenres() -> [GenreViewModel]
    func saveEpisode(_ episode: EpisodeViewModel, audio: Data) -> Bool
    func fetchEpisode(_ episode: EpisodeViewModel) -> EpisodeManagedObject?
    func fetchPodcast(_ id: Int) -> PodcastManagedObject?
    func bookmarkPodcast(_ podcast: PodcastViewModel) -> PodcastManagedObject?
    func deleteBookmark(_ id: Int) -> PodcastManagedObject?
    func fetchAllManagedPodcast(bookmarkedOnly: Bool) -> [PodcastViewModel]
}
