//
//  HomeGenresCollectionComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 07/12/2022.
//

import SwiftUI

struct HomeGenresCollection: View {
    
    var genres: [GenreViewModel]
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 40), spacing: 20), count: 2)
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: true) {
            
            LazyHGrid(rows: gridItems, alignment: .center, spacing: 20) {
                
                ForEach(genres) { genre in
                    
                    GenreLinkView(genre: genre)
                    
                }
            }.padding(.horizontal)
        }.frame(height: 180, alignment: .leading)
    }
}

struct HomeGenresCollection_Previews: PreviewProvider {
    static var previews: some View {
        HomeGenresCollection(genres: GenreViewModel.listPlaceHolders)
    }
}
