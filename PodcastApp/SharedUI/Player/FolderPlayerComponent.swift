//
//  FolderPlayerComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/12/2022.
//

import SwiftUI

struct FolderPlayerComponent: View {
    
    var track: Track
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            TrackImageView(track: track)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .zIndex(1.0)
            
            VStack(alignment: .leading) {
                
                Text(track.title)
                    .font(.callout)
                    .lineLimit(2)
                Text(track.podcastName)
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                
            }
            
            PlayerButton(action: {}, icon: "play.fill", isBig: false)
                .frame(maxHeight: .infinity)
        }.padding(.horizontal)
            .padding(.vertical, 10)
    }
}

struct FolderPlayerComponent_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            FolderPlayerComponent(track: Track.placeholder)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            FolderPlayerComponent(track: Track.placeholder)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
