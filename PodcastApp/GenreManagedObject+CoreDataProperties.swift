//
//  GenreManagedObject+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Temiloluwa on 04/12/2022.
//
//

import Foundation
import CoreData


extension GenreManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenreManagedObject> {
        return NSFetchRequest<GenreManagedObject>(entityName: "GenreManagedObject")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?

}

extension GenreManagedObject : Identifiable {

}
