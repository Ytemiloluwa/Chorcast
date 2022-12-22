//
//  CoreDataService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 05/12/2022.
//

import Foundation
import CoreData

class CoreDataService: CoreDataserviceProtocol {
    
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
        return false
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
        managedEpisode.soundAudioUrl = episode.audioUrl
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
        managedPodcast.langauge = podcast.language
        managedPodcast.publisher = podcast.publisher
        managedPodcast.id = Int64(podcast.id)
        managedPodcast.imageUrl = podcast.imageUrl
        managedPodcast.thumbnailUrl = podcast.thumbnailUrl
        managedPodcast.genres = podcast.genres.joined(separator: ",")
        return managedPodcast
    }
    
}
