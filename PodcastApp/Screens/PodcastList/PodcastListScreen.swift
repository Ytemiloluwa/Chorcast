//
//  PodcastListScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 16/12/2022.
//

import SwiftUI

struct PodcastListScreen: View {
    
    var genre: String
    
    @EnvironmentObject private var store: Store
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var grid: some View {
        
        LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10, content: {
            
            PodcastListContent(state: getState(for: genre), fetchPodcasts: fetchPodcasts)
        })
        
    }
    var body: some View {
        
        ScrollView {
            
            grid
            
        }.navigationTitle(genre)
    }
    
    private func fetchPodcasts() {
        
        store.dispatch(.api(.fetchPodcasts(genre, limit: 10)))
    }
    
    private func getState(for term: String) -> AppState.Result<[PodcastViewModel]> {
        
        if let state = store.apiState.preferredPodcasts[term] {
            
            return state
        }
        
        return .loading
        
    }
}

struct PodcastListScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
       
        Group {
            
            PodcastListScreen(genre: "technology")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            PodcastListScreen(genre: "technology")
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(store)
    }
}
