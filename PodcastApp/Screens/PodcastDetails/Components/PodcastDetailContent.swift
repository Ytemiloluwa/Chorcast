//
//  PodcastDetailContent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 19/12/2022.
//

import SwiftUI

struct PodcastDetailContent: View {
    
    var podcast: PodcastViewModel
    
    @EnvironmentObject private var store: Store
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var hSizeClass: UserInterfaceSizeClass?
    #endif
    
    private var description: some View {
        
        Text(podcast.description)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
    
    private var allEpiosdeLink: some View {
        
        NavigationLink(destination: EpisodeListScreen(episodes: podcast.episodes)) {
            
            Label("See all \(podcast.episodes.count) episodes", systemImage: "square.stack.3d.down.right.fill")
        }.padding(.horizontal)
    }
    
    private var bookmarkButton: some View {
        
        Button(action: {
            
            if podcast.isBookmarked {
                
                store.dispatch(.coreData(.unbookmarked(podcast)))
            }else {
                
                store.dispatch(.coreData(.bookmark(podcast)))
            }
            
        }, label: {
            
            Image(systemName: podcast.isBookmarked ? "bookmark.fill" : "bookmark")
            
        })

    }
    
    var compactContent: some View {
        
        GeometryReader { geometry in
            
            ScrollView(showsIndicators: false, content: {
                
                VStack{
                    
                    createImage(size: geometry.size.width)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        PodcastDetailHeaderComponent(podcast: podcast)
                        allEpiosdeLink
                        Divider()
                        description
                    }
                }
            })
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: bookmarkButton)
        }
    }
    
    var regularContent: some View {
        
        HStack {
            
            GeometryReader { geometry in
                
                ScrollView(showsIndicators: false, content: {
                    
                    VStack {
                        
                        createImage(size: geometry.size.width, cornerRadius: 20)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            PodcastDetailHeaderComponent(podcast: podcast)
                            description
                        }
                    }
                })
            }
            EpisodeListScreen(episodes: podcast.episodes)
            
        }.navigationBarTitle("", displayMode: .inline)
            .padding(.horizontal)
            .toolbar {
                
                bookmarkButton
            }
    }
    
    var body: some View {
        
        if hSizeClass == .compact {
            
            compactContent
            
        }else {
            
            regularContent
        }
    }
    
    private func createImage(size: CGFloat, cornerRadius: CGFloat = 0) -> some View {
        
        SCImage(podcast: podcast, size: size, cornerRadius: cornerRadius)
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
