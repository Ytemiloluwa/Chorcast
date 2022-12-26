//
//  CoreDataService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 05/12/2022.
//

import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {

    func fetchAllPodcast(bookmarkedOnly: Bool, OnlyContainingEpisodes flag: Bool) -> [PodcastViewModel] {
        
        let request: NSFetchRequest<PodcastManagedObject> = PodcastManagedObject.fetchRequest()
        
        if bookmarkedOnly {
            
            request.predicate = NSPredicate(format: "isBookmarked = %@", "1")
        }
        
        do {
            let results = try context.fetch(request)
            
            if flag {
                
                return results
                    .filter{ !$0.episodesArray.isEmpty }
                    .map { PodcastViewModel($0)}
            }
            return results.map {
                
                PodcastViewModel($0)
            }
            
        }catch let error {
            
            Log.error(error)
        }
        
        return []
    }
    
    
    func bookmarkPodcast(_ podcast: PodcastViewModel) -> PodcastManagedObject? {
        
        
        var managedPodcast: PodcastManagedObject?
        
        if let existingPodcast = fetchPodcast(podcast.id) {
            
            existingPodcast.isBookmarked = true
            managedPodcast = existingPodcast
            
        }else {
            
            let newPodcast = createManagedPodcast(podcast)
            newPodcast.isBookmarked = true
            managedPodcast = newPodcast
        }
        
        if saveContext() {
            
            return managedPodcast
        }
            
        return nil
    }
    
    func unbookmarkedPodcast(_ id: Int) -> PodcastManagedObject? {
    
        guard let managedPodcast = fetchPodcast(id) else {
            
            return nil
        }
        
        if managedPodcast.episodesArray.isEmpty {
            
            context.delete(managedPodcast)
            
            if saveContext() {
                
                return nil
            }
        }
        
        managedPodcast.isBookmarked = false
        _ = saveContext()
        
        return managedPodcast
    }
    
    private var context: NSManagedObjectContext {
        
        return PersistenceController.shared.container.viewContext
    }
    
    private func saveContext() -> Bool {
        
        do {
            
            if context.hasChanges {
                
                try context.save()
            }
        } catch {
            
            let nsError = error as NSError
            
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return true
    }

    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool {
        
        genres.forEach {
            
            let newGenres = GenreManagedObject(context: context)
            newGenres.id = Int64($0.id)
            newGenres.name = $0.name
        }
        return saveContext()
    }
    
    func saveEpisode(_ episode: EpisodeViewModel, audio: Data) -> Bool {
        
        do {
            
            let managedEpisode = createManagedEpisode(episode, audioData: audio)
            if let managedPocast = fetchPodcast(episode.podcast.id) {
                
                managedPocast.addToEpisodes(managedEpisode)
            }
            else {
                
                let podcast = episode.podcast
                let managedPodcast = createManagedPodcast(podcast)
                
                if let imgUrl = URL(string: podcast.imageUrl) {
                    
                    managedPodcast.image = try Data(contentsOf: imgUrl)
                }
                
                if let thumUrl = URL(string: podcast.thumbnailUrl) {
                    
                    managedPodcast.thumbnail = try Data(contentsOf: thumUrl)
                }
            }
        }catch let error {
            
            Log.error(error)
            return false
        }
        return saveContext()
    }
    
    func fetchGenres() -> [GenreViewModel] {
        
        let request: NSFetchRequest<GenreManagedObject> = GenreManagedObject.fetchRequest()
        
        do {
            
            let result = try context.fetch(request)
            return result.map { GenreViewModel(genre: $0)}
        } catch let error {
            Log.error(error)
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            
        }
    }
    
    func fetchEpisode(_ episode: EpisodeViewModel) -> EpisodeManagedObject? {
        
        let request: NSFetchRequest<EpisodeManagedObject> = EpisodeManagedObject.fetchRequest()
        request.predicate = NSPredicate(format: "title = %@", episode.title)
        
        do {
            
            let results = try context.fetch(request)
            return results.first
            
        }catch let error {
            
            print(error)
        }
        
        return nil
        
    }
    
    func fetchPodcast(_ id: Int) -> PodcastManagedObject? {
        
        let request: NSFetchRequest<PodcastManagedObject> = PodcastManagedObject.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", String(id))
        
        do {
            let results = try context.fetch(request)
            return results.first
        }
        catch let error {
            
            print(error)
        }
        
        return nil
    }
    
    
    private func createManagedEpisode(_ episode: EpisodeViewModel, audioData: Data) -> EpisodeManagedObject {
        
        let managedEpisode = EpisodeManagedObject(context: context)
        managedEpisode.id = episode.id
        managedEpisode.title = episode.title
        managedEpisode.createdAt = Date()
        managedEpisode.descr = episode.description
        managedEpisode.duration = episode.audioLength
        managedEpisode.releaseDate = episode.date.toDate()
        managedEpisode.size = episode.audioSize
        managedEpisode.sourceAudioUrl = episode.audioUrl
        managedEpisode.audio = audioData
        return managedEpisode
        
    }
    
    private func createManagedPodcast(_ podcast: PodcastViewModel) -> PodcastManagedObject {
        
        let managedPodcast = PodcastManagedObject(context: context)
        managedPodcast.title = podcast.title
        managedPodcast.author = podcast.author
        managedPodcast.createdAt = Date()
        managedPodcast.country = podcast.country
        managedPodcast.descr = podcast.description
        managedPodcast.explicitContent = podcast.explicitContent
        managedPodcast.feedUrl = podcast.feedUrl
        managedPodcast.releaseDate = podcast.date.toDate()
        managedPodcast.language = podcast.language
        managedPodcast.publisher = podcast.publisher
        managedPodcast.id = Int64(podcast.id)
        managedPodcast.imageUrl = podcast.imageUrl
        managedPodcast.thumbnailUrl = podcast.thumbnailUrl
        managedPodcast.genres = podcast.genres.joined(separator: ",")
        return managedPodcast
    }
    
}
