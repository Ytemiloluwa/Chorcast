//
//  PlayerManager.swift
//  PodcastApp
//
//  Created by Temiloluwa on 28/12/2022.
//

import Foundation

class PlayerManager: ObservableObject {
    
    
    enum State {
        
        case idle
        case loading
        case playing
        case failed(_ message: String)
        
    }
    
    @Published var state: State = State.idle
    @Published var currentTrack = Track.placeholder
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    
    private var player = PodcastPlayer()
    
}
 

