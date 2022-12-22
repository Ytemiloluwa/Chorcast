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
        
        environment.downloader.didFinish = { [weak self] data in
            
            //save downloaded episode to coredata
            
            guard let self = self, let audio = data else { return }
            
            if self.environment.coredata.saveEpisode(self.episode, audio: audio) {
                
                self.state = .finished(true)
                
            }else {
                
                self.state = .finished(false)
            }
        }
        
        environment.downloader.progress = { [weak self] value in
            
            // update progress
            
            self?.state = .executing(value)
        }
    }
    
    override func cancel() {
        
        super.cancel()
        self.environment.downloader.cancel()
    }
}
