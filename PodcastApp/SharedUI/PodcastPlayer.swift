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
    
    
    
    private func validatesValues(for keys: [String], asset: AVAsset) -> Bool {
        
        return true
    }
    
    private func setUpObservers() {
        
        
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
}
