//
//  DownloadManager.swift
//  PodcastApp
//
//  Created by Temiloluwa on 22/12/2022.
//

import Foundation
import SwiftUI

class DownloadManager: ObservableObject {
    
    enum State : Equatable {
        
        case idle
        case pending
        case downloading(progress: CGFloat)
        case done(success: Bool)
        
    }
    
    // observing views when it changes 
    @Published var state: State = .idle
    @Published var downloadings: [String: State] = [:]
    
    private var operationQueue = OperationQueue()
    
    private var environment: AppEnvironment
    
    init(environment: AppEnvironment = AppEnvironment()) {
        
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.qualityOfService = .background
        self.environment = environment
        
    }
    
    func download(_ episode: EpisodeViewModel) {
        
        self.downloadings[episode.title] = .pending
        
        let operation = DownloadOperation(episode: episode, environment: environment)
        
        operation.onStateChange = { [weak self ] state in
            
            switch state {
                
            case.idle:
                self?.downloadings[episode.title] = .pending
            case.executing(let progress):
                DispatchQueue.main.async {
                    self?.downloadings[episode.title] = .downloading(progress: progress)
                }
            case.finished(let success):
                DispatchQueue.main.async {
                    self?.state = .done(success: success)
                    self?.downloadings.removeValue(forKey: episode.title)
                }
            }
        }
        
        operationQueue.addOperation(operation)
    }
    
    func abort(name: String) {
        
        if let operations = operationQueue.operations.first(where: { $0.name == name }) {
            
            operations.cancel()
        }
    }
    
    func getState(for episode: EpisodeViewModel) -> State {
        
        if let state = downloadings[episode.title] {
            
            return state
        }
        
        let episode = environment.coredata.fetchEpisode(episode)
        
        self.state = .done(success: episode != nil)
        
        return .done(success: episode != nil )
    }
}
