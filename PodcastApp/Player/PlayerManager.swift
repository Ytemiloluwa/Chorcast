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
    
    
    init() {
        
        setUpPlayersObservers()
    }
    

    private func setUpPlayersObservers() {
        
        // setting all closures in the PodcastPlayer to start listening to changes
        
        player.onTimeChange = { [weak self] currentTime in
            
            // Update the currenttime everytime there is a change
            
            self?.currentTime = currentTime
        }
        
        player.onTogglePlay = { [weak self]  isPlaying in
            
            //isplaying will be toggled on or false
            self?.isPlaying = isPlaying
            
        }
        
        player.onPlayerStart = { [weak self] duration in
             
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                // setting the duration of the item
                self.duration = duration
                
                // updating the state to isplaying
                self.state = State.playing
            }
        }
        
        player.onFailure = { [weak self] message in
            
            DispatchQueue.main.async {
                
                // update state when there is a failure event
                
                self?.state = .failed(message)
            }
        }
    }
    
    func play(_ track: Track) {
        
        guard let url = getAudioUrl(from: track) else { return }
        
        // start playing
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) { [weak self] in
            
            self?.state = .loading
            self?.player.play(url: url)
            self?.currentTrack = track
        }
    }
    
    // writing audio url to a file
    
    private func getAudioUrl(from track: Track) -> URL? {
        
        if let url = track.audio?.writeData(to: UUID().uuidString) {
            
            return url
            
        }
        
        if let url = URL(string: track.audioUrl) {
            
            return url 
        }
        
        return nil
    }

}
 

