//
//  PodcastDetailContent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 19/12/2022.
//

import SwiftUI

struct PodcastDetailContent: View {
    
    var podcast: PodcastViewModel
    
    private var description: some View {
        
        Text(podcast.description)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private var allEpiosdeLink: some View {
        
        NavigationLink(destination: EpisodeListScreen(episodes: podcast.episodes)) {
            
            Label("See all \(podcast.episodes.count) episodes", systemImage: "square.stack.3d.down.right.fill")
        }.padding(.horizontal)
    }
    var body: some View {
        
        GeometryReader { geometry  in
            
            ScrollView(showsIndicators: false, content: {
            
                VStack {
                    
                    createImage(size: geometry.size.width)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        PodcastDetailHeaderComponent(podcast: podcast)
                        allEpiosdeLink
                        Divider()
                        description
                    }
                }
            }).navigationBarTitle("", displayMode: .inline)
        }
    }
    
    private func createImage(size: CGFloat) -> some View {
        
        SCImage(podcast: podcast, size: size, cornerRadius: 0)
            .aspectRatio(contentMode: .fill)
    }
}
struct PodcastDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            PodcastDetailContent(podcast: PodcastViewModel.placeHolder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            PodcastDetailContent(podcast: PodcastViewModel.placeHolder)
                .previewLayout(.sizeThatFits)
        }
    }
}
