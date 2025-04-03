//
//  BookmarkedScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 25/12/2022.
//

import SwiftUI

struct BookmarkedScreen: View {
    
    @EnvironmentObject private var store: Store
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var grid: some View {
        
        LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10, content: {
            
            PodcastListContent(state: store.coreDataState.bookmarkedPodcasts, fetchPodcasts: fetchPodcasts)
        })
    }
    
    var body: some View {
        
        ScrollView {
            
            grid
            
        }.navigationTitle("Bookmark")
        .onAppear(perform: fetchPodcasts)
    }
    
    private func fetchPodcasts() {
        
        store.dispatch(.coreData(.fetchBookmarkedPodcasts))
    }
    
    private func createContent(podcasts: [PodcastViewModel]) -> some View {
        
        ForEach(podcasts) { podcast in
            
            PodcastLinkView(podcast: podcast)
            
        }.padding(.horizontal)
    }
    
    private func createGrid(podcasts: [PodcastViewModel]) -> some View {
        
        LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10, content: { createContent(podcasts: podcasts)})
    }
    
}

struct BookmarkedScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        
        Group {
            
            BookmarkedScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            BookmarkedScreen()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(store)
    }
}
