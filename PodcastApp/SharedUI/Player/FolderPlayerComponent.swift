//
//  FolderPlayerComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/12/2022.
//

import SwiftUI

struct FolderPlayerComponent: View {
    
    var track: Track
    @Binding var isExpanded: Bool
    @Binding var offsetY: CGFloat
    
    var namespace: Namespace.ID
    @EnvironmentObject private var playerManager: PlayerManager
    
    var body: some View {
        HStack(spacing: 10) {
            TrackImageView(track: track)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .matchedGeometryEffect(id: "\(track.title)-image", in: namespace)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(track.title)
                    .font(.callout)
                    .lineLimit(1)
                    .matchedGeometryEffect(id: "\(track.title)-progressView", in: namespace)
                Text(track.podcastName)
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .matchedGeometryEffect(id: "\(track.title)-titles", in: namespace)
            }
            
            // Play/Pause Button
            PlayerButton(action: {
                playerManager.playPause()
            }, icon: playerManager.isPlaying ? "pause.fill" : "play.fill", isBig: false)
            .matchedGeometryEffect(id: "\(track.title)-play", in: namespace)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .onTapGesture {
            self.isExpanded = true
            self.offsetY = 0
        }
      
    }
}

struct FolderPlayerComponent_Previews: PreviewProvider {
    
    @Namespace private static var namespace
    
    static var previews: some View {
        Group {
            FolderPlayerComponent(track: Track.placeholder, isExpanded: .constant(false), offsetY: .constant(0), namespace: namespace)
                .environmentObject(PlayerManager())
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            FolderPlayerComponent(track: Track.placeholder, isExpanded: .constant(false), offsetY: .constant(0), namespace: namespace)
                .environmentObject(PlayerManager())
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
        }
    }
}
