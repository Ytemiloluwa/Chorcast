//
//  EpisodeView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import SwiftUI

struct EpisodeView: View {
    
    var episode: EpisodeViewModel
    var play = {}
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            EpisodeViewHeader(epiosde: episode)
            EpisodeViewBody(episode: episode, play: play)
        }.padding()
            .background(Color.overlay)
            .cornerRadius(15)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EpisodeView(episode: EpisodeViewModel.placeholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            EpisodeView(episode: EpisodeViewModel.placeholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
