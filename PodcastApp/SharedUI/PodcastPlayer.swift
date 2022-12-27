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
    
    func play(url: URL) {
        
        let asset = AVAsset(url: url)
    }
    
}
