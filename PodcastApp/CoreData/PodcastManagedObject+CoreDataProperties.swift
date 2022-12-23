//
//  PodcastManagedObject+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Temiloluwa on 23/12/2022.
//

import Foundation
import CoreData


extension PodcastManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PodcastManagedObject> {
        return NSFetchRequest<PodcastManagedObject>(entityName: "PodcastManagedObject")
    }

    @NSManaged public var author: String?
    @NSManaged public var country: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var descr: String?
    @NSManaged public var explicitContent: String?
    @NSManaged public var feedUrl: String?
    @NSManaged public var genres: String?
    @NSManaged public var id: Int64
    @NSManaged public var image: Data?
    @NSManaged public var imageUrl: String?
    @NSManaged public var isBookmarked: Bool
    @NSManaged public var langugage: String?
    @NSManaged public var publisher: String?
    @NSManaged public var releaseDate: Date?
    @NSManaged public var thumbnail: Data?
    @NSManaged public var thumbnailUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var totalEpisodesCount: Int64
    @NSManaged public var episodes: NSSet?
    
    public var episodesArray: [EpisodeManagedObject] {
           guard let episodeSet = episodes as?  Set<EpisodeManagedObject> else {
               return []
           }
           
           return episodeSet.sorted {
               $0.createdAt! > $1.createdAt!
           }
       }

}

// MARK: Generated accessors for episodes
extension PodcastManagedObject {

    @objc(addEpisodesObject:)
    @NSManaged public func addToEpisodes(_ value: EpisodeManagedObject)

    @objc(removeEpisodesObject:)
    @NSManaged public func removeFromEpisodes(_ value: EpisodeManagedObject)

    @objc(addEpisodes:)
    @NSManaged public func addToEpisodes(_ values: NSSet)

    @objc(removeEpisodes:)
    @NSManaged public func removeFromEpisodes(_ values: NSSet)

}

extension PodcastManagedObject : Identifiable {

}

