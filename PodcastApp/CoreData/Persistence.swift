//
//  Persistence.swift
//  PodcastApp
//
//  Created by Temiloluwa on 08/11/2022.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentCloudKitContainer
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "PodcastApp")
        
        let defaultDirectoryURL = NSPersistentContainer.defaultDirectoryURL()
        
        let cloudSyncStoreDescription = createDescription(configuration: "CloudSync", dirURl: defaultDirectoryURL)
        let localStoreDescription = createDescription(configuration: "Local", dirURl: defaultDirectoryURL)
        
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
        // override the default configuration by setting the persistentStoreDescriptions of the container giving it the two store descriptions created.
        container.persistentStoreDescriptions = [cloudSyncStoreDescription, localStoreDescription]
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    private func createDescription(configuration: String, dirURl: URL) -> NSPersistentStoreDescription {
        
        let dbUrl = dirURl.appendingPathComponent("\(configuration).sqlite")
        let storeDescription = NSPersistentStoreDescription(url: dbUrl)
        storeDescription.configuration = configuration
        
        return storeDescription
        
    }
}
