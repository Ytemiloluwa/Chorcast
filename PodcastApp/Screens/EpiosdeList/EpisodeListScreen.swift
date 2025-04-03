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
    @EnvironmentObject private var playerManager: PlayerManager
    @EnvironmentObject private var downloadManager: DownloadManager
    
    private let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 350), spacing: 20), count: 1)
    
    private var section: some View {
        Section(header: createSegmentedPicker()) {
            ForEach(filteredEpisodes) { episode in
                NavigationLink(
                    destination: PlayerView(track: Track(episode, nextEpisodes: []))
                        .onAppear {
                            playEpisode(episode)
                        }
                ) {
                    EpisodeView(episode: episode)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }

    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, alignment: .leading, spacing: 20, content: { section })
                .padding()
        }
        .onAppear(perform: filterEpisodes)
        .onChange(of: listSection) { _ in filterEpisodes() }
        .navigationBarTitle("\(episodes.count) Episodes")
        .onDisappear { playerManager.stop() }
    }
    
    fileprivate func filterEpisodes() {
        switch listSection {
        case .downloaded:
            filteredEpisodes = episodes.filter { downloadManager.getState(for: $0) == .done(success: true) }
        case .allEpisodes:
            filteredEpisodes = episodes
        }
    }
    
    private func playEpisode(_ episode: EpisodeViewModel) {
        let state = downloadManager.getState(for: episode)
        if case .done(success: true) = state {
            let track = Track(episode, nextEpisodes: [])
            playerManager.play(track)
        } else {
            print("Episode is not downloaded")
        }
    }

    
    func createSegmentedPicker() -> some View {
        Picker("", selection: $listSection) {
            Text(ListSection.allEpisodes.rawValue).tag(ListSection.allEpisodes)
            Text(ListSection.downloaded.rawValue).tag(ListSection.downloaded)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.vertical, 5)
        .background(Color.backgroundColor)
    }
}

struct EpisodeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EpisodeListScreen(episodes: EpisodeViewModel.listPlaceholder)
                .environmentObject(PlayerManager())
                .environmentObject(DownloadManager())
                
        }
        .preferredColorScheme(.dark)
        
    }
   
}
