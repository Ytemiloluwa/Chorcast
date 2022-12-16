//
//  HomeMyLibrarySection.swift
//  PodcastApp
//
//  Created by Temiloluwa on 15/12/2022.
//

import SwiftUI

struct HomeMyLibrarySection: View {
    @State private var selectedGenre = ""
    
    private var section : some View {
        
        Section(header: HomeMyLibrarySectionHeader(selected: $selectedGenre)) {
            
            PodcastListContent(genre: selectedGenre)
        }
    }
    var body: some View {
        
        LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1), alignment: .leading, spacing: 10, pinnedViews: [.sectionHeaders], content: { section })
            
        
        
    }
}

struct HomeMyLibrarySection_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
       
        Group {
            
            HomeMyLibrarySection()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            HomeMyLibrarySection()
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(store)
    }
}
