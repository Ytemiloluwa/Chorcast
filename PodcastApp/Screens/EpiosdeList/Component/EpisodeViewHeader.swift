//
//  EpisodeViewHeader.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import SwiftUI

struct EpisodeViewHeader: View {
    
    var epiosde: EpisodeViewModel
    var downloadEpisode = {}
    
    var body: some View {
    
        HStack {
    
            Text(epiosde.date)
            
            Spacer()
            
            Button(action: downloadEpisode, label: {
                
                Image(systemName: "icloud.and.arrow.down.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.border)
            }).buttonStyle(BorderlessButtonStyle())
        }
    }
    
    private func downloadEpiosde() {
        
        
    }
}

struct EpisodeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EpisodeViewHeader(epiosde: EpisodeViewModel.placeholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            EpisodeViewHeader(epiosde: EpisodeViewModel.placeholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
        
    }
}
