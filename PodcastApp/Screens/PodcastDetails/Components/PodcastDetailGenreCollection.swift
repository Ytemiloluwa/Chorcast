//
//  PodcastDetailGenreCollection.swift
//  PodcastApp
//
//  Created by Temiloluwa on 19/12/2022.
//

import SwiftUI

struct PodcastDetailGenreCollection: View {
    
    var genres: [String]
    
    private let gridItems: [GridItem] = Array(repeating: .init(.flexible(), spacing: 5), count: 3)
    
    var body: some View {
        
        LazyVGrid(columns: gridItems, alignment: .center, spacing: 10) {
            
            ForEach(genres, id: \.self) { genre in
                
                Text(genre)
                    .font(.caption)
                    .foregroundColor(Color.pop)
                    .frame(maxWidth: .infinity)
                    .frame(height: 15)
                    .padding(10)
                    .background(Color.pop.opacity(0.3))
                    .cornerRadius(20)

            }.frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct PodcastDetailGenreCollection_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            PodcastDetailGenreCollection(genres: ["Technology", "NFL", "Comedy", "Politcis", "Geography"])
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            PodcastDetailGenreCollection(genres: ["Technology", "NFL", "Comedy", "Politcis", "Geography"])
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
