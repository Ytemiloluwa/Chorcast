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
    
    @ObservedObject private var store = Store()
    @ObservedObject private var downloadManager = DownloadManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(downloadManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
