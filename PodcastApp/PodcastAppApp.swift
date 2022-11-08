//
//  PodcastAppApp.swift
//  PodcastApp
//
//  Created by Temiloluwa on 08/11/2022.
//

import SwiftUI

@main
struct PodcastAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
