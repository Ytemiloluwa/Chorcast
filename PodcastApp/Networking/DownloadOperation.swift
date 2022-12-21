//
//  DownloadOperation.swift
//  PodcastApp
//
//  Created by Temiloluwa on 21/12/2022.
//

import Foundation

class DownloadOperation: BaseOperation {
    
    // episode to download
    private var episode: EpisodeViewModel
    
    //environment that contain all the necessary services to save the downloaded episode.
    private var environment: AppEnvironment
    
    init(episode: EpisodeViewModel, environment: AppEnvironment) {
        
        self.episode = episode
        self.environment = environment
    }
    
    override func main() {
        
        if isCancelled || state == .finished() { return }
        
        guard let url = URL(string: episode.audioUrl) else {
            
            return
        }
        
        self.name = episode.title
        
        environment.downloader.download(from: url)
        
        environment.downloader.didFinish = { data in
            
            //save downloaded episode to coredata
        }
        
        environment.downloader.progress = { value in
            
            // update progress
        }
    }
    
    override func cancel() {
        
        
    }
}
