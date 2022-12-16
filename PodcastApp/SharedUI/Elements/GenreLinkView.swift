//
//  GenreLinkView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 07/12/2022.
//

import SwiftUI

struct GenreLinkView: View {
    var genre: GenreViewModel
    var body: some View {
 
        NavigationLink(destination: PodcastListScreen(genre: genre.name), label: {
            
            GenreView(genre: genre)
                .frame(minWidth: 250, maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .background(Color.overlay)
                .cornerRadius(15)
        })
    }
}

struct GenreLinkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            GenreLinkView(genre: GenreViewModel.placeHolder)
                .frame(width: 250, height: 70, alignment: .leading)
                .previewLayout(.sizeThatFits)
            
            GenreLinkView(genre: GenreViewModel.placeHolder)
                .frame(width: 250, height: 70, alignment: .leading)
                .colorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
