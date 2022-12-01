//
//  GenreSelectionCollection.swift
//  PodcastApp
//
//  Created by Temiloluwa on 01/12/2022.
//

import SwiftUI

struct GenreSelectionCollection: View {
    
    var genres: [GenreViewModel]
    @Binding var selectedGenres: [String : GenreViewModel]
    
    private let gridItems = Array(repeating: GridItem.init(.adaptive(minimum: 40)), count: 1)
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            LazyHGrid(rows: gridItems, alignment: .center, spacing: 10) {
                
                ForEach(genres) { genre in
                   creategenreToggle(genre)
                }
            }.padding()
        }.frame(height: 340, alignment: .center)
    }
    
    fileprivate func creategenreToggle(_ genre: GenreViewModel) -> some View {
        
        return GenreToggle(genre: genre) { selected in
            
            if selected {
                
                selectedGenres[genre.name] = genre
            }else {
                selectedGenres.removeValue(forKey: genre.name)
                
            }
        }
    }
}
struct GenreSelectionCollection_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionCollection(genres: GenreViewModel.listPlaceHolders, selectedGenres: .constant([:]))
            .previewLayout(.sizeThatFits)
    }
}
