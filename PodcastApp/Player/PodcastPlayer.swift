//
//  PodcastPlayer.swift
//  PodcastApp
//
//  Created by Temiloluwa on 27/12/2022.
//

import Foundation
import AVFoundation
import MediaPlayer

class PodcastPlayer: NSObject {
    
    var player = AVPlayer()
    
    //keeping track of object returned by various observers
    private var timeObserverToken: Any?
    private var playerItemStatusObserver: NSKeyValueObservation?
    
    // sending values to the calling site
    
    var onPlayerStart: ((Double) -> Void) = { _ in }
    var onTimeChange: ((Double) -> Void) = { _ in }
    var onTogglePlay: ((Bool) -> Void) = { _ in }
    var onFailure: ((String) -> Void) = { _ in }
    
    override init() {
        
        super.init()
        
        player = AVPlayer()
    }
    
    func play(url: URL) {
        
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        player.replaceCurrentItem(with: playerItem)
        prepareAsset(asset)
    }
    
    func togglePlay() {
        
        
        switch self.player.timeControlStatus {
            
        case.paused, .waitingToPlayAtSpecifiedRate:
            player.play()
        onTogglePlay(true)
        case.playing:
            player.pause()
            onTogglePlay(false)
        default:
            player.pause()
            onTogglePlay(false)
        }
    }
    
    func seek(to value: Double) {
        
        let time = CMTime(seconds: value, preferredTimescale: 1000)
        player.seek(to: time)
    }
    
    func fastForward() {
        
        var time: TimeInterval = player.currentTime().seconds
        time += 15.0 // fastforward 15 seconds
        
        if player.currentItem?.currentTime() == player.currentItem?.duration {
            
            return
        }
        
        seek(to: time)
    }
    
    
    func fastBackward() {
        
        var time: TimeInterval = player.currentTime().seconds
        
        time -= 15.0 // Go back by 15 seconds
        
        if player.currentItem?.currentTime() == .zero {
            
            return
        }
        
        seek(to: time)
    }
    
    func stop() {
        player.pause()
        player.seek(to: CMTime.zero)
        onTogglePlay(false)
    }
    
    
    private func validatesValues(for Keys: [String], asset: AVAsset) -> Bool {
        
        for key in Keys {
            
            var error: NSError?
            
            if asset.statusOfValue(forKey: key, error: &error) == .failed {
                
                self.onFailure("The media failed to load key: \(key)")
            }
        }
        
#if os(watchOS)
        
        if !asset.isPlayable {
            
            self.onFailure("Sorry, the media is not playable.")
            
            return false
        }
        
#else
        
        if !asset.isPlayable || asset.hasProtectedContent {
            
            self.onFailure("Sorry, the media is not playable.")
        }
#endif
        return true
    }
    
    private func updateProgress(with time: CMTime) {
        
        self.onTimeChange(time.seconds)
    }
    
    private func updatePlayerStatus() {
        
        guard let currentItem = player.currentItem else { return }
        
        switch currentItem.status {
            
        case.readyToPlay:
            self.player.play()
            self.onTogglePlay(true)
            self.onPlayerStart(currentItem.asset.duration.seconds)
        case.failed:
            self.onFailure("Sorry the media is not playable.")
        default:
            Log.info("Unknown status")
        }
    }
    
    
    private func setUpObservers() {
        
        let interval = CMTime(value: 1, timescale: 1)
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [unowned self] time in
            

            // update progress
            
            self.updateProgress(with: time)
        }
        
        playerItemStatusObserver = player.observe(\AVPlayer.currentItem?.status, options: [.new, .initial]) { [unowned self] _, _ in
            
            DispatchQueue.main.async {
                
                self.updatePlayerStatus()
            }
        }
    }
    
    private func prepareAsset(_ asset: AVAsset) {
        
        let playableKeys = ["playable", "hasProtectedContent"]
        
        asset.loadValuesAsynchronously(forKeys: playableKeys) { [weak self] in
            
            guard let self = self else { return }
            
            if self.validatesValues(for: playableKeys, asset: asset) {
                
                self.setUpObservers()
            }
        }
    }
    
    private func removePeriodicTimeObserver() {
        
        if let timeObserverToken = timeObserverToken {
            
            player.removeTimeObserver(timeObserverToken)
            self.timeObserverToken = nil
            
        }
    }
    
    // remove the observers when the class is reinitialised
    deinit {
        stop()
        removePeriodicTimeObserver()
    
    }
}
