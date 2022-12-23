//
//  EpisodeManagedObject+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Temiloluwa on 23/12/2022.
//

import Foundation
import CoreData


extension EpisodeManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EpisodeManagedObject> {
        return NSFetchRequest<EpisodeManagedObject>(entityName: "EpisodeManagedObject")
    }

    @NSManaged public var audio: Data?
    @NSManaged public var createdAt: Date?
    @NSManaged public var descr: String?
    @NSManaged public var duration: Double
    @NSManaged public var id: UUID?
    @NSManaged public var releaseDate: Date?
    @NSManaged public var size: String?
    @NSManaged public var sourceAudioUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var podcast: PodcastManagedObject?

}

extension EpisodeManagedObject : Identifiable {

}

