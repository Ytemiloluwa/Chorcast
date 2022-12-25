//
//  DownloadedScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 25/12/2022.
//

import SwiftUI

struct DownloadedScreen: View {
    
    @EnvironmentObject private var store : Store
    
    private let gridItem: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var grid: some View {
        
        LazyVGrid(columns: gridItem, alignment: .leading, spacing: 10, content: {
            
            
            PodcastListContent(state: store.coreDataState.podcastsWithEpisodes, fetchPodcasts: fetchpodcasts)
        })
        
    }
    
    var body: some View {
       
        ScrollView {
            
            grid
            
        }.navigationTitle("Downloaded")
    }
    
    private func fetchpodcasts() {
        
        
        store.dispatch(.coreData(.fetchPodcastWithEpisodes))
    }
}

struct DownloadedScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
        Group {
            
            DownloadedScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            DownloadedScreen()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(store)
    }
}
