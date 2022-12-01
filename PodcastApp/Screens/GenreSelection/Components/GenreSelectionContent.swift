//
//  GenreSelectionContent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 01/12/2022.
//

import SwiftUI

struct GenreSelectionContent: View {
    
    var genres: [GenreViewModel]
    var onContinue: (([GenreViewModel]) -> Void) = { _ in }
    
    @State private var selectedGenres: [String: GenreViewModel] = [:]
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 30) {
                
                GenreSelectionHeader()
                
                GenreSelectionCollection(genres: genres, selectedGenres: $selectedGenres)
                
                if selectedGenres.count > 2 {
                    
                    GetStartedButton(action: {
                        
                        var genres = [GenreViewModel]()
                        
                        selectedGenres.values.forEach{ genres.append($0)}
                        onContinue(genres)
                    })
                }
            }.padding(.vertical, 40)
        }.background(Color.white)
    }
}

struct GenreSelectionContent_Previews: PreviewProvider {
    static var previews: some View {
        
        GenreSelectionContent(genres: GenreViewModel.listPlaceHolders)
            .previewLayout(.sizeThatFits)
    }
}
