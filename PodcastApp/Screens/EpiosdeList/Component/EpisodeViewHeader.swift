//
//  EpisodeViewHeader.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import SwiftUI

struct EpisodeViewHeader: View {
    
    var episode: EpisodeViewModel
    
    
    @State private var state = DownloadManager.State.idle
    @EnvironmentObject private var downloadManager: DownloadManager
    
    private var downloadButton: some View {
        
        Button(action: downloadEpisode, label: {
            
            Image(systemName: "icloud.and.arrow.down.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.border)
        })
        .buttonStyle(BorderlessButtonStyle())
    }
    
    private var pendingView: some View {
        
        Image(systemName: "clock.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundColor(.border)
        
    }
    
    private var savedImage: some View {
        
        Image(systemName: "icloud.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundColor(.border)
    }
    
    
    var body: some View {
        
        HStack {
            
            Text(episode.date.uppercased())
            
            Spacer()
            
            createDownloadButton()
        }
        //Update local state whenever this view appears using the episode view model
        .onAppear{
            
            state = downloadManager.getState(for: episode)
        }
        // listen to downloadings changes and update state accordingly
        .onChange(of: downloadManager.downloadings, perform: { downloadings in
            
            if let state = downloadings[episode.title] {
                
                self.state = state
            }else {
                
                self.state = downloadManager.getState(for: episode)
            }
        })
    }
    
    @ViewBuilder
    
    private func createDownloadButton() -> some View {
        
        switch state {
            
        case .idle:
            downloadButton
            
        case .pending:
            pendingView
            
        case .downloading(let progress):
            createProgressView(progress)
            
            
        case .done(let success):
            if success {
                
                savedImage
                
            }else {
                
                downloadButton
            }
            
        }
    }
    
    private func createProgressView(_ progress: CGFloat) -> some View {
        
        Button(action: abort, label: {
            
           
            ZStack {
                
                CircularProgressView(progress: progress, total: 1, width: 3)
                    .frame(width: 20, height: 20)
                
                Image(systemName: "stop.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 8)
                    .foregroundColor(.accentColor)
            }
        })
    }
    
    private func abort() {
        
        downloadManager.abort(name: episode.title)
    }
    
    private func downloadEpisode() {
        
        downloadManager.download(episode)
    }
}

struct EpisodeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EpisodeViewHeader(episode: EpisodeViewModel.placeholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            EpisodeViewHeader(episode: EpisodeViewModel.placeholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }.environmentObject(DownloadManager())
        
    }
}
