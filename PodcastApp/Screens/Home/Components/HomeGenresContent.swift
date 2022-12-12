//
//  HomeGenresContentComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 07/12/2022.
//

import SwiftUI

struct HomeGenresContent: View {
    
    @EnvironmentObject private var store: Store
    
    var body: some View {
        
        switch store.apiState.allGenres {
            
        case.loading:
            createContent(genres: GenreViewModel.listPlaceHolders)
                .redacted(reason: .placeholder)
                .onAppear{
                    
                    store.dispatch(.api(.fetchGenres(_filename: "genres")))
                }
            
        case.success(let genres):
            createContent(genres: genres)
            
        case.failure:
            Text("Failed to Load Genres")
        }
        
    }
    
    private func createContent(genres: [GenreViewModel]) -> some View {
        
        VStack {
            
            HomeSectionHeaderView(title: "All genres")
            HomeGenresCollection(genres: genres)
        }
    }
}

struct HomeGenresContent_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        
        Group {
            
            HomeGenresContent()
                .background(Color.backgroundColor)
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
            
            HomeGenresContent()
                .background(Color.backgroundColor)
                .previewLayout(.sizeThatFits)
                .colorScheme(.light)
            
        }  .environmentObject(store)
        
    }
}
