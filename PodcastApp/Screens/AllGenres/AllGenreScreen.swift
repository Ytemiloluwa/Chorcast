//
//  AllGenreScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 15/12/2022.
//

import SwiftUI

struct AllGenreScreen: View {
    
    @EnvironmentObject private var store: Store
    
    private let genresFilename = "genres"
    
    private let griditems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var content: some View {
        
        Group {
            
            switch store.apiState.allGenres {
                
            case.loading:
                RedactedListView(viewType: .genre)
                    .onAppear(perform: fetchgenres)
                
            case.success(let genres):
                createSuccess(genres: genres)
            
            case.failure:
                FailureView(message: "Unable to load Genres", showIcon: true, retryAction: fetchgenres)
                
            }
        }
    }
    
    var body: some View {
      
        ScrollView {
            
            LazyVGrid(columns: griditems, alignment: .leading, spacing: 20, content: { content })
            
        }.navigationTitle("All Genres")
    }
    
    private func fetchgenres() {
        
        store.dispatch(.api(.fetchGenres(_filename: genresFilename)))
    }
    
    private func createSuccess(genres: [GenreViewModel]) -> some View {
        
        ForEach(genres) { genre in
            
            GenreLinkView(genre: genre)
                .frame(height: 70)
            
        }.padding(.horizontal)
        
    }
}

struct AllGenreScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
     
        Group {
            
            AllGenreScreen()
                .preferredColorScheme(.dark)
            
            AllGenreScreen()
            
        }.environmentObject(store)
    }
}
