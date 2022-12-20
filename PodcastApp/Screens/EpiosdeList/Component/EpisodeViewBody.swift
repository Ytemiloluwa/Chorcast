//
//  EpisodeViewBody.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import SwiftUI

struct EpisodeViewBody: View {
    var episode: EpisodeViewModel
    var play = {}
    
    private var title: some View {
        
        Button(action: play) {
            Text(episode.title)
                .font(.headline)
                .lineLimit(1)
            
                .foregroundColor(.text)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    private var description: some View {
        
        Text(episode.description)
            .font(.subheadline)
            .foregroundColor(Color.gray)
    }
    var body: some View {
       
        VStack(alignment: .leading, spacing: 10){
            
            title
            description
        }
    }
}

struct EpisodeViewBody_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            EpisodeViewBody(episode: EpisodeViewModel.placeholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            EpisodeViewBody(episode: EpisodeViewModel.placeholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)

        }
    }
}
