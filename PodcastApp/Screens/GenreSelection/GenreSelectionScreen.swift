//
//  GenreSelectionScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 01/12/2022.
//

import SwiftUI

struct GenreSelectionScreen: View {
    @EnvironmentObject private var store: Store
    var body: some View {
        
        switch store.apiState.allGenres {
            
        case.loading:
            GenreSelectionContent(genres: GenreViewModel.listPlaceHolder) { _ in
            }.onAppear(perform: {
                
                store.dispatch(.api(.fetchGenres(_filename: "genres")))
            }).redacted(reason: .placeholder)
        case.success(let genres):
            
            GenreSelectionContent(genres: genres, onContinue: { selectedGenres in
                
                store.dispatch(.coreData(.saveGenres(selectedGenres)))
            })
         
        case.failure:
             Text("Failed to Load genres...")
        }
    }
}

struct GenreSelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionScreen()
            .previewLayout(.sizeThatFits)
            .environmentObject(Store())
    }
}
