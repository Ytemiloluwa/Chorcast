//
//  PlayerView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 31/12/2022.
//

import SwiftUI

struct PlayerView: View {
    
    @State private var isExpanded = false
    @State private var offsetY: CGFloat = 0
    
    @Environment(\.horizontalSizeClass) private var hSizeClass: UserInterfaceSizeClass?
    @EnvironmentObject private var playerManager: PlayerManager
    
    @Namespace private var animation
    var track: Track
    
    var body: some View {
        switch playerManager.state {
        case .idle:
            createContent(track: track)
                .redacted(reason: .placeholder)
        case .loading:
            ProgressView("Loading...")
                .padding()
        case .playing:
            createContent(track: track)
            
        case .failed(let message):
            Text(message)
        }
    }
    
    func createContent(track: Track) -> some View {
        ZStack(alignment: .bottom) {
            if isExpanded {
                ExpandedPlayerComponent(track: track, isExpanded: $isExpanded, offsetY: $offsetY, namespace: animation)
            } else {
                FolderPlayerComponent(track: track, isExpanded: $isExpanded, offsetY: $offsetY, namespace: animation)
            }
        }
        .background(BlurView())
        .cornerRadius(20)
        .roundedBorder(radius: 20, color: Color.border)
        .padding()
        .padding(.bottom, 10)
        .animation(.spring(response: 0.55, dampingFraction: 0.9, blendDuration: 0), value: self.isExpanded)
        .onDisappear { playerManager.stop()}
      
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerView(track: Track.placeholder)
                .environmentObject(PlayerManager())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            PlayerView(track: Track.placeholder)
                .environmentObject(PlayerManager())
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
