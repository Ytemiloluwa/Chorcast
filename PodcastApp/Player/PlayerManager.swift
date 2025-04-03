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
    
    @Published var state: State = .idle
    @Published var currentTrack = Track.placeholder
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    
    private var player = PodcastPlayer()
    
    init() {
        setUpPlayersObservers()
    }
    
    private func setUpPlayersObservers() {
        player.onTimeChange = { [weak self] currentTime in
            DispatchQueue.main.async {
                self?.currentTime = currentTime
            }
        }
        
        player.onTogglePlay = { [weak self] isPlaying in
            DispatchQueue.main.async {
                self?.isPlaying = isPlaying
            }
        }
        
        player.onPlayerStart = { [weak self] duration in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.duration = duration
                self.state = .playing
            }
        }
        
        player.onFailure = { [weak self] message in
            DispatchQueue.main.async {
                self?.state = .failed(message)
            }
        }
    }
    
    func play(_ track: Track) {
        guard let url = getAudioUrl(from: track) else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.state = .loading
            self?.player.play(url: url)
            self?.currentTrack = track
        }
    }
    
    func playPause() {
        player.togglePlay()
    }
    
    func skip(percent: Double) {
        let time = duration * percent
        player.seek(to: time)
    }
    
    func fastForward() {
        player.fastForward()
    }
    
    func fastBackward() {
        player.fastBackward()
    }
    
    func stop() {
        player.stop()
      
    }
    
    
    private func getAudioUrl(from track: Track) -> URL? {
        if let audioData = track.audio {
            return audioData.writeData(to: UUID().uuidString)
        }
        if let url = URL(string: track.audioUrl) {
            return url
        }
        return nil
    }
}
