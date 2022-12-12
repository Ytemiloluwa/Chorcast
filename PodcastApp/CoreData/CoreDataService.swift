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
    
    func saveGenres(_ genres: [GenreViewModel]) -> Bool {
        
        genres.forEach {
            
            let newGenres = GenreManagedObject(context: context)
            newGenres.id = Int64($0.id)
            newGenres.name = $0.name
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
    
}
