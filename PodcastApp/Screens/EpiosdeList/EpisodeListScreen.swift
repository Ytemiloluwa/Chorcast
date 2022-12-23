//
//  EpiosdeListScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import SwiftUI

struct EpisodeListScreen: View {
    
    var episodes: [EpisodeViewModel] = []
    
    enum ListSection: String, CaseIterable {
        
        case downloaded = "Downloaded"
        case allEpisodes = "All episodes"
    }
    @State private var listSection = ListSection.allEpisodes
    @State private var filteredEpisodes = [EpisodeViewModel]()
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var section: some View {
        
        Section(header: createSegmentedPicker()) {
            ForEach(filteredEpisodes) { episode in
                
                EpisodeView(episode: episode, play: {})
                    .transition(.move(edge: .leading))
            }
        }
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: gridItems, alignment: .leading, spacing: 20, content: {section})
                .padding()
            
        }.onAppear(perform: filterEpisodes)
            .onChange(of: listSection) { _ in
                
                filterEpisodes()
            }
            
          //  .animation(.easeIn, value: listSection)
        
        .navigationBarTitle("\(episodes.count) Episodes")
        
    }
    
    fileprivate func filterEpisodes() {
        
        switch listSection {
        case .downloaded:
            filteredEpisodes = episodes.filter({ episode in
                
                if let audio = episode.audio {
                    
                    return !audio.isEmpty
                }
                
                return false
            })
        case .allEpisodes:
            filteredEpisodes = episodes
        }
    }
    
    func createSegmentedPicker() -> some View {
        
        Picker("", selection: $listSection) {
            
            Text(ListSection.allEpisodes.rawValue)
                .tag(ListSection.allEpisodes)
            Text(ListSection.downloaded.rawValue)
                .tag(ListSection.downloaded)
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.vertical, 5)
            .background(Color.backgroundColor)
    }
}

struct EpiosdeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            EpisodeListScreen(episodes: EpisodeViewModel.listPlaceholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            EpisodeListScreen(episodes: EpisodeViewModel.listPlaceholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(DownloadManager())
    }
}
