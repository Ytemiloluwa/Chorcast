//
//  ExpandedPlayerComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 30/12/2022.
//

import SwiftUI

struct ExpandedPlayerComponent: View {
    
    var track: Track
    
    var body: some View {
        
        VStack(spacing: 40) {
        
            TrackImageView(track: track)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(15)
            
            VStack {
                Text(track.title)
                    .font(.callout)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text(track.podcastName)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
            
            PlayerProgressView(currentTime: 200, totalTime: 300)
                .frame(maxWidth: 300, alignment: .center)
            
            createButtonRow()
        }.padding(40)
        
    }
    
    private func createButtonRow() -> some View {
        
        HStack(spacing: 50) {
            
            
            PlayerButton(action: {
                
                
            }, icon: "gobackward.15", isBig: true)
            
            
            PlayerButton(action: {
                
                
            }, icon: "play.fill", isBig: true)
            
            
            PlayerButton(action: {
                
                
            }, icon: "goforward.15", isBig: true)
        }
    }
    
}

struct ExpandedPlayerComponent_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            ExpandedPlayerComponent(track: Track.placeholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            ExpandedPlayerComponent(track: Track.placeholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
