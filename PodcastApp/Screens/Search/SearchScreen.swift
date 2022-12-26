//
//  SearchScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/12/2022.
//

import SwiftUI

struct SearchScreen: View {
    
    @EnvironmentObject private var store: Store
    @State private var searchTerm = ""
    
    private var section: some View {
        
     
        Section(header: SearchFieldView(searchTerm: $searchTerm, isSearching: .constant(!searchTerm.isEmpty))) {
            
            PodcastListContent(state: getState(for: searchTerm), fetchPodcasts: fetchPodcasts)
        }
    }
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var grid: some View {
        
        LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10, pinnedViews: [.sectionHeaders], content: { section })
    }
    
    var body: some View {
        
        ScrollView {
            
            section
            
        }.navigationBarTitle("Search", displayMode: searchTerm.isEmpty ? .large : .inline)
    }
    
    private func fetchPodcasts() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            store.dispatch(.api(.fetchPodcasts(searchTerm, limit: 100)))
        }
    }
    
    private func getState(for term: String) -> AppState.Result<[PodcastViewModel]> {
        
        if let state = store.apiState.preferredPodcasts[term] {
            
            return state
        }
        
        return .loading
    }
}

struct SearchScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
                             
    static var previews: some View {
        
        Group {
            
            SearchScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            SearchScreen()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(store)
    }
}
