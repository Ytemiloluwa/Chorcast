//
//  ImageCache.swift
//  PodcastApp
//
//  Created by Temiloluwa on 09/12/2022.
//

import Foundation

struct ImageCache {
    
    static var shared = ImageCache()
    
    private let cache: Cache<String, Data>
    
    
    init(lifetime: TimeInterval = 12 * 60 * 60, maximumCount: Int = 200) {
        
        cache = Cache<String, Data>(entryLifetime: lifetime, maximumEntryCount: maximumCount)
    }
    
    func set(_ data: Data, for key: String) {
        
        cache.insert(data, forKey: key as String)
    }
    
    func get(for key: String) -> Data? {
        
        cache.value(forKey: key as String)
    }
    
}
