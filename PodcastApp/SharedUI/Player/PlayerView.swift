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
        Text("Hello, World!")
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
