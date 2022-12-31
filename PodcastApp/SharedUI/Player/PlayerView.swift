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
    
    var body: some View {
     
        switch playerManager.state {
            
        case .idle:
            createContent(track: playerManager.currentTrack)
                .redacted(reason: .placeholder)
        case.loading:
            ProgressView("Loading...")
                .padding()
        case.playing:
            createContent(track: playerManager.currentTrack)
        case.failed(let message):
            Text(message)
            
        }
    }
    
    func createContent(track: Track) -> some View {
          ZStack(alignment: .bottom, content: {
              if isExpanded {
                  ExpandedPlayerComponent(track: track, isExpanded: $isExpanded, offsetY: $offsetY, namespace: animation)
              } else {
                  FolderPlayerComponent(track: track, isExpanded: $isExpanded, offsetY: $offsetY, namespace: animation)
              }
          }).background(BlurView())
          .cornerRadius(20)
          .roundedBorder(radius: 20, color: Color.border)
          .padding()
          .padding(.bottom, 10)
          .animation(.spring(response: 0.55, dampingFraction: 0.9, blendDuration: 0), value: self.isExpanded)
      }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            PlayerView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            PlayerView()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(PlayerManager())
    }
}
