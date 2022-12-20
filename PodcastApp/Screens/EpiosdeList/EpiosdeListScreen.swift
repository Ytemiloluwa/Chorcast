//
//  EpiosdeListScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import SwiftUI

struct EpiosdeListScreen: View {
    
    var episodes: [EpisodeViewModel]
    
    enum ListScreen: String, CaseIterable {
        
        case downloaded = "Downloaded"
        case allEpisodes = "all episodes"
    }
    @State private var listSection: ListScreen = .allEpisodes
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var section: some View {
        
        Section(header: createSegmentedPicker()) {
            ForEach(episodes) { episode in
                
                
            }
        }
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: gridItems, content: {}).padding()
        }
    }
    
    func createSegmentedPicker() -> some View {
        
        Picker("", selection: $listSection) {
            
            Text(ListScreen.allEpisodes.rawValue)
                .tag(ListScreen.allEpisodes)
            Text(ListScreen.downloaded.rawValue)
                .tag(ListScreen.downloaded)
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.vertical, 5)
            .background(Color.backgroundColor)
    }
}

struct EpiosdeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            EpiosdeListScreen(episodes: EpisodeViewModel.listPlaceholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            EpiosdeListScreen(episodes: EpisodeViewModel.listPlaceholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
