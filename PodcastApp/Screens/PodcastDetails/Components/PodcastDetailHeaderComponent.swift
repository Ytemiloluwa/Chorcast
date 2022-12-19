//
//  PodcastDetailHeaderComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 19/12/2022.
//

import SwiftUI

struct PodcastDetailHeaderComponent: View {
    
    var podcast: PodcastViewModel
    
    var title: some View {
        
        Text(podcast.title)
            .font(.largeTitle)
            .bold()
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var details: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            PodcastDetailsElement(name: "Author", value: podcast.author)
            PodcastDetailsElement(name: "Publisher", value: podcast.publisher)
            PodcastDetailsElement(name: "Explicit", value: podcast.explicitContent)
            PodcastDetailsElement(name: "ReleaseDate", value: podcast.date)
            PodcastDetailsElement(name: "Language", value: podcast.language ?? "")
      
        }
    }
    var genres: some View {
        
        VStack {
            
            Divider()
            PodcastDetailGenreCollection(genres: podcast.genres)
            Divider()
        }
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            title
            details
            genres
        }.frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
    }
}

struct PodcastDetailHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            PodcastDetailHeaderComponent(podcast: PodcastViewModel.placeHolder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            PodcastDetailHeaderComponent(podcast: PodcastViewModel.placeHolder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
